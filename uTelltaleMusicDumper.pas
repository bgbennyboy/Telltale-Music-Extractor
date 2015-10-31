{
******************************************************
  Telltale Music Extractor
  Copyright (c) 2006 - 2014 Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}

unit uTelltaleMusicDumper;

interface

uses
  Classes, SysUtils, Forms, Windows, Strutils,
  JCLFileUtils, JCLShell,
  uTelltaleFuncs, uTtarchBundleManager, uTelltaleMemStream, uTelltaleTypes,
  uTelltaleMusicExtractorConst, uTelltaleMusicExtractorFuncs,
  uSoundtrackManager, uMPEGHeaderCheck, OggVorbisAndOpusTagLibrary;

type
  EMusicDumpError = class (exception);

  TProgressEvent = procedure(ProgressMax: integer; ProgressPos: integer) of object;

  TMusicType = (
    mt_OGG,
    mt_TTARCH,
    mt_NONE
  );

  TTelltaleMusicDumper = class

  private
    fBundle:    TTtarchBundleManager;
    fGame:      TTelltaleGame;
    fMusicType: TMusicType;
    fSourceDir: string;
    fDestDir:   string;
    fSourceFiles, fAdditionalFSBFiles: TStringList;
    fTtarchFilename: string;
    fOnProgress: TProgressEvent;
    fFSBBankDumpExe, fFSBdll1, fSoxExe, fTrimSilenceBat: string;
    function FindMusicType(SearchDir: String): TMusicType;
    function FindMusicTtarchBundle(Dir: string; TheGame: TTelltaleGame): string;
    procedure LoadTtarchBundle;
    procedure TagMusic(FileName, Title, Album, Artist, Genre, TrackNo, Year, Coverart: string);
    procedure SaveFixedMP3Stream(InStream, OutStream: TStream; FileSize, Channels: integer);
    function CopyUnbundledFiles: integer;
    function CopyBundledFiles: integer;
    function CopyBundledFilesWithSoundtrack(Soundtrack: TSoundtrackManager): integer;
    function SaveFSBToMP3(SourceStream: TTelltaleMemoryStream; DestFile: string): boolean;
    function ExtractFSB4(SourceStream: TTelltaleMemoryStream; DestStream: TStream; DestFile: string): boolean;
    function ExtractFSB5(SourceStream: TTelltaleMemoryStream; DestStream: TStream; DestFile: string): boolean;
    function DumpAdditionalBankFilesAsFSB(SearchDir, DestDir: string): boolean;
    function GetTtarchFilesWithAdditionalBanksIn(CurrentTtarchFilename: string; AllBundleFiles: TStringList): TStringList;
    function ExtractFSBFromBankFile(TheBundle: TTtarchBundleManager; FileNo: integer; DestDir, FileName: string): boolean;
    function FindFileHeader(SearchStream: TTelltaleMemoryStream; StartSearchAt, EndSearchAt: Integer; Header: string): integer;
  public
    constructor Create(SearchDir, DestDir: String; Game: TTelltaleGame); overload;
    constructor Create(DestDir: String; Game: TTelltaleGame; TtarchFile: string); overload;
    destructor Destroy; override;
    function SaveFiles: integer; overload;
    function SaveFiles(Soundtrack: TSoundtrackManager): integer; overload;
    function GetListOfFilesInBundleWithoutExt(var FileList: TStringList): integer;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
  end;


implementation

const
  WolfEP1_MusicBundle = 'Fables_pc_Fables101_ms.ttarch2';
  WolfEP2_MusicBundle = 'Fables_pc_Fables102_ms.ttarch2';
  WolfEP3_MusicBundle = 'Fables_pc_Fables103_ms.ttarch2';
  WolfEP4_MusicBundle = 'Fables_pc_Fables104_ms.ttarch2';
  WolfEP5_MusicBundle = 'Fables_pc_Fables105_ms.ttarch2';
  WalkingDeadS2_EP1_Bundle = 'WalkingDead_pc_WalkingDead201_ms.ttarch2';
  WalkingDeadS2_EP2_Bundle = 'WalkingDead_pc_WalkingDead202_ms.ttarch2';
  WalkingDeadS2_EP3_Bundle = 'WalkingDead_pc_WalkingDead203_ms.ttarch2';
  WalkingDeadS2_EP4_Bundle = 'WalkingDead_pc_WalkingDead204_ms.ttarch2';
  WalkingDeadS2_EP5_Bundle = 'WalkingDead_pc_WalkingDead205_ms.ttarch2';
  BorderlandsEP1_Bundle = 'Borderlands_pc_Borderlands101_ms.ttarch2';
  BorderlandsEP2_Bundle = 'Borderlands_pc_Borderlands102_ms.ttarch2';
  BorderlandsEP3_Bundle = 'Borderlands_pc_Borderlands103_ms.ttarch2';
  BorderlandsEP4_Bundle = 'Borderlands_pc_Borderlands104_ms.ttarch2';
  BorderlandsEP5_Bundle = 'Borderlands_pc_Borderlands105_ms.ttarch2';
  GameOfThronesEP1_Bundle = 'GameOfThrones_pc_GameOfThrones101_ms.ttarch2';
  GameOfThronesEP2_Bundle = 'GameOfThrones_pc_GameOfThrones102_ms.ttarch2';
  GameOfThronesEP3_Bundle = 'GameOfThrones_pc_GameOfThrones103_ms.ttarch2';
  GameOfThronesEP4_Bundle = 'GameOfThrones_pc_GameOfThrones104_ms.ttarch2';
  GameOfThronesEP5_Bundle = 'GameOfThrones_pc_GameOfThrones105_ms.ttarch2';
  GameOfThronesEP6_Bundle = 'GameOfThrones_pc_GameOfThrones106_ms.ttarch2';
  MinecraftEP1_Bundle     = 'MCSM_pc_Minecraft101_ms.ttarch2';
  MinecraftEP2_Bundle     = 'MCSM_pc_Minecraft102_ms.ttarch2';
  MinecraftEP3_Bundle     = 'MCSM_pc_Minecraft103_ms.ttarch2';
  MinecraftEP4_Bundle     = 'MCSM_pc_Minecraft104_ms.ttarch2';
  MinecraftEP5_Bundle     = 'MCSM_pc_Minecraft105_ms.ttarch2';


//Normal constructor  - search a directory for the music and determine the music type
constructor TTelltaleMusicDumper.Create(SearchDir, DestDir: string; Game: TTelltaleGame);
begin
  fDestDir      := IncludeTrailingPathDelimiter(DestDir);
  if DirectoryExists(fDestDir) = false then
    raise EMusicDumpError.Create(strInvalidFolder);

  fGame         := Game;
  fSourceFiles  := TStringList.Create;

  fSourceDir    := IncludeTrailingPathDelimiter(SearchDir);
  fMusicType    := FindMusicType(fSourceDir);
  if fMusicType = mt_NONE then
    raise EMusicDumpError.Create(strNoMusicFound);

  if fMusicType = mt_TTarch then LoadTtarchBundle;

end;

//For 'open file' - open a specific ttarch/ttarch2 bundle
constructor TTelltaleMusicDumper.Create(DestDir: String; Game: TTelltaleGame;
  TtarchFile: string);
begin
  fDestDir      := IncludeTrailingPathDelimiter(DestDir);
  if DirectoryExists(fDestDir) = false then
    raise EMusicDumpError.Create(strInvalidFolder);

  fGame         := Game;
  fSourceFiles  := TStringList.Create;

  fSourceDir := '';
  fTtarchFileName := TtarchFile;
  fMusicType := mt_TTARCH;
  LoadTtarchBundle;
end;

destructor TTelltaleMusicDumper.Destroy;
begin
  fSourceFiles.Free;
  if fBundle <> nil then fBundle.Free;

  inherited;
end;

function TTelltaleMusicDumper.FindMusicType(SearchDir: String): TMusicType;
begin
  result := mt_NONE;

  //First see if there's .aud ogg files there
  FindFilesInDirByExt( SearchDir , '.aud', fSourceFiles);
  if fSourceFiles.Count > 0 then
  begin
    result := mt_OGG;
    exit;
  end;

  //Else see if there's music in a ttarch file in the dir
  fTtarchFilename := FindMusicTtarchBundle( SearchDir, fGame );
  if fTtarchFilename <> '' then
  begin
    result := mt_TTARCH;
    exit;
  end;
end;

function TTelltaleMusicDumper.GetListOfFilesInBundleWithoutExt(var FileList: TStringList): integer;
var
  i: integer;
begin
  result := 0;
  if FileList = nil then exit;
  if fBundle = nil then exit;

  for i := 0 to fBundle.Count - 1 do
  begin //Add them without the file extension
    FileList.Add( ChangeFileExt(fBundle.FileName[i], '') );
  end;

  Result := FileList.Count;
end;

procedure TTelltaleMusicDumper.LoadTtarchBundle;
begin
  try
    fBundle:=TTtarchBundleManager.Create(fSourceDir + fTtarchFileName);
    fBundle.ParseFiles;
  except on E: EInvalidFile do
  begin
    fBundle.Free;
    fBundle := nil;
    raise EMusicDumpError.Create(strTtarchError + ' ' +  fTtarchFileName);
  end;
  end;
end;

function TTelltaleMusicDumper.SaveFiles: integer;
begin
  result := 0;
  if fMusicType = mt_TTARCH then
    result := CopyBundledFiles
  else
  if fMusicType = mt_OGG then
    result := CopyUnbundledFiles;
end;

function TTelltaleMusicDumper.SaveFiles(Soundtrack: TSoundTrackManager): integer;
begin
  result := 0;

  if Soundtrack = nil then
    raise EMusicDumpError.Create(strNoSoundtrackErr);

  if fMusicType = mt_TTARCH then
    result := CopyBundledFilesWithSoundtrack(Soundtrack)
  else
  if fMusicType = mt_OGG then
    result := CopyUnbundledFiles;
end;


function TTelltaleMusicDumper.FindMusicTtarchBundle(Dir: string; TheGame: TTelltaleGame): string;
var
  BundleList: TStringList;
  i: integer;
  BundleFileName: string;
begin
{
  Need to find the music .ttarch bundle.
  Usually has either 'MUSIC' or 'MS' in the filename

  Starting with The Wolf Among Us the bundles are .ttarch2
  They often have all the bundles in the same folder rather than in separate
  folders as before. Sometimes they also have a separate music bundle for the
  menu and one for the episode .That means we need to specifically look for a
  certain file for later games.
}
  Result := '';
  Dir := IncludeTrailingPathDelimiter(Dir);

  BundleList := Tstringlist.Create;
  try
    //First find ttarch archives in the folder
    FindFilesInDirByExt(Dir, '.ttarch', BundleList);
    //Then also find any ttarch2 archives in the folder
    FindFilesInDirByExt(Dir, '.ttarch2', BundleList);

    if BundleList.Count = 0 then exit;

    //For .ttarch2 bundles try and find a specific file - see below
    case TheGame of
      WolfAmongUs_Faith:                          BundleFileName := WolfEP1_MusicBundle;
      WolfAmongUs_SmokeAndMirrors:                BundleFileName := WolfEP2_MusicBundle;
      WolfAmongUs_ACrookedMile:                   BundleFileName := WolfEP3_MusicBundle;
      WolfAmongUs_InSheepsClothing:               BundleFileName := WolfEP4_MusicBundle;
      WolfAmongUs_CryWolf:                        BundleFileName := WolfEP5_MusicBundle;
      WalkingDead_S2_AllThatRemains:              BundleFileName := WalkingDeadS2_EP1_Bundle;
      WalkingDead_S2_AHouseDivided:               BundleFileName := WalkingDeadS2_EP2_Bundle;
      WalkingDead_S2_InHarmsWay:                  BundleFileName := WalkingDeadS2_EP3_Bundle;
      WalkingDead_S2_AmidTheRuins:                BundleFileName := WalkingDeadS2_EP4_Bundle;
      WalkingDead_S2_NoGoingBack:                 BundleFileName := WalkingDeadS2_EP5_Bundle;
      TalesFromBorderlands_Zer0Sum:               BundleFileName := BorderlandsEP1_Bundle;
      TalesFromBorderlands_AtlasMugged:           BundleFileName := BorderlandsEP2_Bundle;
      TalesFromBorderlands_CatchARide:            BundleFileName := BorderlandsEP3_Bundle;
      TalesFromBorderlands_EscapePlanBravo:       BundleFileName := BorderlandsEP4_Bundle;
      TalesFromBorderlands_TheVaultOfTheTraveler: BundleFileName := BorderlandsEP5_Bundle;
      GameOfThrones_IronFromIce:                  BundleFileName := GameOfThronesEP1_Bundle;
      GameOfThrones_TheLostLords:                 BundleFileName := GameOfThronesEP2_Bundle;
      GameOfThrones_TheSwordInTheDarkness:        BundleFileName := GameOfThronesEP3_Bundle;
      GameOfThrones_SonsOfWinter:                 BundleFileName := GameOfThronesEP4_Bundle;
      GameOfThrones_ANestOfVipers:                BundleFileName := GameOfThronesEP5_Bundle;
      GameOfThrones_TheIceDragon:                 BundleFileName := GameOfThronesEP6_Bundle;
      Minecraft_TheOrderOfTheStone:               BundleFileName := MinecraftEP1_Bundle;
      Minecraft_AssemblyRequired:                 BundleFileName := MinecraftEP2_Bundle;
      Minecraft_TheLastPlaceYouLook:              BundleFileName := MinecraftEP3_Bundle;
      Minecraft_ABlockAndAHardPlace:              BundleFileName := MinecraftEP4_Bundle;
      Minecraft_OrderUp:                          BundleFileName := MinecraftEP5_Bundle;
    end;

    for I := 0 to BundleList.Count - 1 do
    begin
      //For .ttarch2 bundles try and find a specific file - as bundles are often all in the same dir along with a boot music bundle
      if Uppercase( ExtractFileExt( BundleList.Strings[i] )) = '.TTARCH2' then
      begin
        if TheGame = UnknownGame then //Open folder used - we dont know what game this is - so we cant choose the correct bundle
          raise EMusicDumpError.Create(strMultipleMusicBundles);

        //Try and match one of the bundles in the folder to the BundleFileName that we expect for that game
        if UpperCase(BundleList.Strings[i]) = UpperCase(BundleFileName) then
        begin
          result := BundleList.Strings[i];
          break;
        end;
      end
      else
      //Check if any file is a music ttarch from the filename
      if Pos('MUSIC', AnsiUpperCase(BundleList.Strings[i])) <> 0 then
      begin
        result := BundleList.Strings[i];
        break;
      end
      else //used in Wallace and Grommit onwards
      if Pos('_MS', AnsiUpperCase(BundleList.Strings[i])) <> 0 then
      begin
        result := BundleList.Strings[i];
        break;
      end
    end;
  finally
    BundleList.Free;
  end;
end;

function TTelltaleMusicDumper.CopyUnbundledFiles: integer;
var
  DestPath: string;
  Header: ansistring;
  i, StartPos: integer;
  SourceFile, DestFile: TFileStream;
begin
  result := 0;

  for i:=0 to fSourceFiles.Count -1 do
  begin
    DestPath   := fDestDir + pathextractfilenamenoext(fSourceFiles.Strings[i]) + '.ogg';
    SourceFile := tfilestream.Create(fSourceDir + fSourceFiles.Strings[i], fmopenread);
    try
      DestFile := tfilestream.Create(DestPath, fmOpenWrite or fmCreate);
      try
        Setlength(Header, 4);
        SourceFile.Read(Header[1], 4);

        if Header = 'ERTM' then StartPos:=93
        else
          StartPos := 126;

        SourceFile.Seek(StartPos, sofrombeginning);
        DestFile.CopyFrom(SourceFile, SourceFile.Size - StartPos);
        inc(Result);
      finally
        DestFile.Free;
      end;
    finally
      SourceFile.Free;
    end;

    if Assigned(FOnProgress) then FOnProgress(fSourceFiles.Count -1, i);
  end;
end;


//Match the given ttarch and return all the bundles that we need to dump to get the extra bank files
function TTelltaleMusicDumper.GetTtarchFilesWithAdditionalBanksIn(
  CurrentTtarchFilename: string; AllBundleFiles: TStringList): TStringList;
begin
  Result := TStringList.Create; //Caller owns this stringlist so caller must free it!

  //Find the correct bundle for the episode
  if CurrentTtarchFilename = MinecraftEP1_Bundle then
    Result.Add( 'MCSM_pc_Project_ms.ttarch2'); //Contains common.bank - just dump it with the first episode
end;

//Dump additional bank files from inside other ttarches. Dump as FSB.
function TTelltaleMusicDumper.DumpAdditionalBankFilesAsFSB(SearchDir,
  DestDir: string): boolean;
var
  BundlesInDir, MasterBankBundles: TStringList;
  i, j: integer;
  ProjectBundle: TTtarchBundleManager;
begin
  Result := false;

  BundlesInDir := TStringList.Create;
  try
    FindFilesInDirByExt(SearchDir, '.ttarch2', BundlesInDir);

    //Get the ttarch bundles we need to dump to get the additional bank files
    MasterBankBundles := GetTtarchFilesWithAdditionalBanksIn( ExtractFileName(fTtarchFilename), BundlesInDir);
    try
      //Check its actually found some bundles
      if MasterBankBundles.Count =  0 then
      begin
        result := true;
        Exit;
      end;

      //Check the desired bundles actually exist
      for I := 0 to MasterBankBundles.Count -1 do
      begin
        if BundlesInDir.IndexOf(MasterBankBundles[i]) = -1 then //Couldnt find the bundle
          Exit;
      end;

      //Now dump the ttarch contents of each ttarch
      fAdditionalFSBFiles := TStringList.Create;
      for I := 0 to MasterBankBundles.Count -1 do
      begin
        ProjectBundle := nil;
        try
          try
            ProjectBundle:=TTtarchBundleManager.Create(SearchDir + MasterBankBundles[i]);
            ProjectBundle.ParseFiles;

            //Save all the files inside this Ttarch2 - includes the master.bank and other needed files
            for j := 0 to ProjectBundle.Count -1 do
            begin
              if ExtractFSBFromBankFile(ProjectBundle, j, DestDir, ChangeFileExt(ProjectBundle.FileName[j], '.fsb') ) then //Add them to the list so we can delete them later
                fAdditionalFSBFiles.Add(IncludeTrailingPathDelimiter(DestDir) + ChangeFileExt(ProjectBundle.FileName[j], '.fsb'));
            end;

            if fAdditionalFSBFiles.Count > 0 then
              result := true;

          except on E: EInvalidFile do
          begin
            if ProjectBundle <> nil then
            begin
              fAdditionalFSBFiles.Free;
              fAdditionalFSBFiles := nil;
              exit;
            end;
          end;
          end;

        finally
          if ProjectBundle <> nil then
            ProjectBundle.Free;
        end;
      end;


    finally
      MasterBankBundles.Free;
    end;

  finally
    BundlesInDir.Free;
  end;

end;

function TTelltaleMusicDumper.CopyBundledFiles: integer;
var
  i, MusicCount, NoFilesPostDump: integer;
  TempStream: TTelltaleMemoryStream;
  DestPath: string;
  DestFile: TFileStream;
  FSBFileList: TStringList;
begin
  Result:=0;

  //First count how many files there are
  MusicCount:=0;
  for i := 0 to fBundle.Count - 1 do
  begin
    if (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.AUD') or
       (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.WAV') or    //walking dead 101 has mix of aud + wav
       (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.FSB') or  //walking dead has FSB
       (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.BANK') then //multiple tracks stored in bank files
        inc(MusicCount);
  end;

  if MusicCount = 0 then exit;

  TempStream:=TTelltaleMemoryStream.Create;
  try
    //First dump AUD files
    for I := 0 to fBundle.Count - 1 do
    begin
      if Uppercase( ExtractFileExt( fBundle.FileName[i] )) <> '.AUD' then
        continue;

      DestPath := fDestDir + ChangeFileExt(fBundle.FileName[i], '.ogg');
      DestFile := tfilestream.Create(DestPath, fmOpenWrite or fmCreate);
      try
        TempStream.Clear;
        fBundle.SaveFileToStream(i, TempStream);
        if TempStream.Size <=52 then continue;

        TempStream.Position := 52; //Newer aud's have ogg at offset 52 or 56
        if TempStream.ReadString(4) = 'OggS' then
          TempStream.Position := 52
        else
        if TempStream.ReadString(4) = 'OggS' then
          TempStream.Position := 56
        else
          Continue;

        DestFile.CopyFrom(TempStream, TempStream.Size - TempStream.Position);
        inc(Result);
      finally
        DestFile.Free;
      end;

      if Assigned(FOnProgress) then FOnProgress(MusicCount, Result);
    end;

    //Wolf among us has FSB files with WAV extension so for lazyness  - just do this:
    //First try and dump FSB's + then assume its WAV if it fails
    for I := 0 to fBundle.Count - 1 do
    begin
      if (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.FSB') or (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.WAV') then
      else
        continue;

      TempStream.Clear;
      fBundle.SaveFileToStream(i, TempStream);
      TempStream.Position := 0;
      DestPath := fDestDir + ChangeFileExt(fBundle.FileName[i], '.mp3');
      if SaveFSBToMP3(TempStream, DestPath) = true then
        inc(Result)
      else //Assume its a normal WAV
      if Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.WAV' then
      begin
        TempStream.Position := 0;
        DestPath := fDestDir + fBundle.FileName[i];
        TempStream.SaveToFile(DestPath);
        inc(Result);
      end;

      if Assigned(FOnProgress) then FOnProgress(MusicCount, Result);
    end;


    //Dump .bank files rip FSB's from them and extract with FSB Bank Extractor at the end
    for I := 0 to fBundle.Count - 1 do
    begin
      if (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.BANK')  then
      else
        continue;

      ExtractFSBFromBankFile(fBundle, i, fDestDir, fBundle.FileName[i] );
      //fBundle.SaveFile(i, fDestDir, fBundle.FileName[i] ); //Save the .bank file to the normal dest dir - we will delete it later
    end;
    //Now check if there's any .bank files been extracted and run the bank extractor
    FSBFileList := TStringList.Create;
    try
      FindFilesInDirByExt(fDestDir, '.fsb', FSBFileList);

      if FSBFileList.Count > 0 then
      try
        //Extract the FSB Bank Dumper files
        fFSBBankDumpExe := ExtractResourceFileToDir('FSBBankDumper.exe', fDestDir, 'fsbdumper');
        fFSBdll1 := ExtractResourceFileToDir('fmodL.dll', fDestDir, 'fmoddll1');
        fSoxExe := ExtractResourceFileToDir('sox.exe', fDestDir, 'sox');
        fTrimSilenceBat := ExtractResourceFileToDir('TrimSilence.bat', fDestDir, 'trimsilencebat');

        if fTtarchFilename > '' then
        begin
          if DumpAdditionalBankFilesAsFSB(ExtractFilePath(fTtarchFilename), fDestDir) = false then
          begin
            raise EMusicDumpError.Create( strExtraBankDumpFail );
            exit;
          end;
        end;

        //Remove trailing backslash from dest dir because my bank dumper program is written in MS C++ which follows the bizarre rules for the shell and treats \ as an escape character
        ShellExecAndWait(fFSBBankDumpExe, '"' + ExcludeTrailingBackslash(fDestDir) + '"','', SW_SHOW, fDestDir);

        //Then run the bat file to trim any wav files
        ShellExecAndWait(fTrimSilenceBat, '','', SW_SHOW, fDestDir);
      finally
        //Delete the files we extracted
        Sleep(1500);
        for I := 0 to FSBFileList.Count -1 do
          Sysutils.DeleteFile(IncludeTrailingPathDelimiter(fDestDir) + FSBFileList[i]);

        RemoveReadOnlyFileAttribute(fFSBBankDumpExe); //Occasionally possible to become read only on some systems if the file thats copied like the exe is already read only
        Sysutils.DeleteFile(fFSBBankDumpExe);
        RemoveReadOnlyFileAttribute(fFSBdll1);
        Sysutils.DeleteFile(fFSBdll1);
        RemoveReadOnlyFileAttribute(fSoxExe);
        Sysutils.DeleteFile(fSoxExe);
        RemoveReadOnlyFileAttribute(fTrimSilenceBat);
        Sysutils.DeleteFile(fTrimSilenceBat);

        //Delete the extra files we dumped from the ttarch earlier (now FSB not bank)
        if fAdditionalFSBFiles <> nil then
        for i := 0 to fAdditionalFSBFiles.Count -1 do
        begin
          if FileExists(fAdditionalFSBFiles[i]) then
          Sysutils.DeleteFile(fAdditionalFSBFiles[i]);
        end;

        //Work out how many new files have been dumped
        NoFilesPostDump := CountFilesInFolder(fDestDir);
        if NoFilesPostDump > result then
          inc(Result, NoFilesPostDump - result);
      end;
    finally
      FSBFileList.free;
      if fAdditionalFSBFiles <> nil then
        fAdditionalFSBFiles.free;
    end;


  finally
    TempStream.Free;
  end;
end;

function TTelltaleMusicDumper.CopyBundledFilesWithSoundtrack(Soundtrack: TSoundtrackManager): integer;
var
  i, j, BundleFileIndex, MultipleFileIndex, MusicCount, MultipleFileCount: integer;
  TempStream: TTelltaleMemoryStream;
  DestPath, NewName: string;
  DestFile: TFileStream;
  CombinationFiles: TStringList;
  SearchResult: boolean;
  BundleFileList: TStringList;
begin
  Result:=0;

  //First count how many files there are
  MusicCount := SoundTrack.Count;
  if MusicCount = 0 then exit;

  TempStream:=TTelltaleMemoryStream.Create;
  try
    BundleFileList := TStringList.Create;
    try
      //Populate bundlefilelist so we can see what files are in the bundle
      GetListOfFilesInBundleWithoutExt(BundleFileList);

      for I := 0 to SoundTrack.Count - 1 do
      begin
        //First see if the soundtrack file exists in the bundle
        BundleFileIndex := BundleFileList.IndexOf(SoundTrack.OriginalFileNames[i]);
        if BundleFileIndex = -1 then
          continue;

        NewName := '';
        NewName := SoundTrack.NewName[BundleFileList[BundleFileIndex]];
        if NewName = '' then
          continue;

        //Lazyness - only OGG files are supported
        if (Uppercase( ExtractFileExt( fBundle.FileName[BundleFileIndex] )) = '.FSB') or (Uppercase( ExtractFileExt( fBundle.FileName[BundleFileIndex] )) = '.WAV') then
          raise EMusicDumpError.Create(strSoundtrackOnlyOgg);

        //Have to handle multiple files differently
        MultipleFileCount := SoundTrack.CombinationFileCount[BundleFileList[BundleFileIndex]];
        if  MultipleFileCount > 0 then
        begin
          CombinationFiles := TStringList.Create;
          try
            SearchResult := Soundtrack.CombinationFiles[CombinationFiles, MultipleFileCount, BundleFileList[BundleFileIndex]];
            if SearchResult = false then continue;

            //Dump the first file
            DestPath := fDestDir + ChangeFileExt(NewName, '.ogg');
            DestFile := tfilestream.Create(DestPath, fmOpenWrite or fmCreate);
            try
              TempStream.Clear;
              fBundle.SaveFileToStream(BundleFileIndex, TempStream);
              if TempStream.Size <=52 then continue;

              TempStream.Position := 52; //Newer aud's have ogg at offset 52 or 56
              if TempStream.ReadString(4) = 'OggS' then
                TempStream.Position := 52
              else
              if TempStream.ReadString(4) = 'OggS' then
                TempStream.Position := 56
              else
                Continue;

              DestFile.CopyFrom(TempStream, TempStream.Size - TempStream.Position);
              inc(Result);

              //Now copy the other files to the end of this one
                for j := 0 to MultipleFileCount - 1 do
                begin
                  TempStream.Clear;

                  //Match the next file up
                  MultipleFileIndex := BundleFileList.IndexOf(CombinationFiles[j]);

                  fBundle.SaveFileToStream(MultipleFileIndex, TempStream);
                  if TempStream.Size <=52 then continue;

                  TempStream.Position := 52; //Newer aud's have ogg at offset 52 or 56
                  if TempStream.ReadString(4) = 'OggS' then
                    TempStream.Position := 52
                  else
                  if TempStream.ReadString(4) = 'OggS' then
                    TempStream.Position := 56
                  else
                    Continue;

                  DestFile.CopyFrom(TempStream, TempStream.Size - TempStream.Position);
              end;

            finally
              DestFile.Free;
            end;

            if Assigned(FOnProgress) then FOnProgress(MusicCount, Result);

          finally
            CombinationFiles.Free;
          end;

          //Tag the file
          TagMusic(DestPath,
                    SoundTrack.Title[BundleFileList[BundleFileIndex]],
                    SoundTrack.Album,
                    SoundTrack.Artist,
                    SoundTrack.Genre,
                    SoundTrack.TrackNo[BundleFileList[BundleFileIndex]],
                    SoundTrack.Year,
                    SoundTrack.CoverArt);

          continue;
        end;


        //Otherwise dump as normally but with new name
        DestPath := fDestDir + ChangeFileExt(NewName, '.ogg');
        DestFile := tfilestream.Create(DestPath, fmOpenWrite or fmCreate);
        try
          TempStream.Clear;
          fBundle.SaveFileToStream(BundleFileIndex, TempStream);
          if TempStream.Size <=52 then continue;

          TempStream.Position:=52; //Newer aud's have ogg at offset 52 or 56
          if TempStream.ReadString(4) = 'OggS' then
            TempStream.Position:=52
          else
          if TempStream.ReadString(4) = 'OggS' then
            TempStream.Position:=56
          else
            Continue;

          DestFile.CopyFrom(TempStream, TempStream.Size - TempStream.Position);
          inc(Result);
        finally
          DestFile.Free;
        end;

        if Assigned(FOnProgress) then FOnProgress(MusicCount, Result);

        //Tag the file
        TagMusic(DestPath,
                  SoundTrack.Title[BundleFileList[BundleFileIndex]],
                  SoundTrack.Album,
                  SoundTrack.Artist,
                  SoundTrack.Genre,
                  SoundTrack.TrackNo[BundleFileList[BundleFileIndex]],
                  SoundTrack.Year,
                  SoundTrack.CoverArt);
      end;

    finally
      BundleFileList.Free;
    end;
  finally
    TempStream.Free;
  end;

end;

function TTelltaleMusicDumper.FindFileHeader(SearchStream: TTelltaleMemoryStream;
  StartSearchAt, EndSearchAt: Integer; Header: string): integer;
var
  HeaderLength, Index: integer;
begin
  Result:=-1;
  Index:=1;
  if EndSearchAt > SearchStream.Size then
    EndSearchAt:=SearchStream.Size;

  HeaderLength:=Length(Header);
  if HeaderLength <= 0 then exit;


  SearchStream.Position:=StartSearchAt;
  while SearchStream.Position < EndSearchAt do
  begin
    if Chr(SearchStream.ReadByte) <> Header[Index] then
    begin
      if Index > 1 then
        SearchStream.Position := SearchStream.Position  -1;

      Index:=1;
      continue;
    end;

    inc(Index);
    if index > HeaderLength then
    begin
      Result:=SearchStream.Position - HeaderLength;
      exit;
    end;
  end;

end;

function TTelltaleMusicDumper.ExtractFSBFromBankFile(TheBundle: TTtarchBundleManager; FileNo: integer; DestDir,
  FileName: string): boolean;
var
  TempStream: TTelltaleMemoryStream;
  DestFile: TFileStream;
  HeaderOffset: integer;
begin
  result := false;
  TempStream := TTelltaleMemoryStream.Create;
  try
    TheBundle.SaveFileToStream(FileNo, TempStream);
    TempStream.Position := 0;
    HeaderOffset := FindFileHeader(TempStream, 0, TempStream.Size, 'FSB5');
    if HeaderOffset = -1 then exit;

    TempStream.Position:=HeaderOffset;
    DestFile := TFileStream.Create(IncludeTrailingPathDelimiter(DestDir)  + changefileext(FileName, '.fsb'), fmOpenWrite or fmCreate);
    try
      DestFile.CopyFrom(TempStream, TempStream.Size - TempStream.Position);
      result := true;
    finally
      DestFile.Free;
    end;
  finally
    TempStream.Free;
  end;
end;

function TTelltaleMusicDumper.SaveFSBToMP3(SourceStream: TTelltaleMemoryStream; DestFile: string): boolean;
var
  Header: string;
  DestStream: TFileStream;
begin
  result := false;

  SourceStream.Position := 0;
  Header := SourceStream.ReadBlockName;
  if (Header <> 'FSB4') and (Header <> 'FSB5') then
    Exit;

  DestStream:=tfilestream.Create(DestFile, fmOpenWrite or fmCreate);
  try
    DestStream.Position := 0;
    SourceStream.Position := 0;

    if Header = 'FSB4' then
      Result := ExtractFSB4(SourceStream, DestStream, DestFile)
    else
    if Header = 'FSB5' then
      Result := ExtractFSB5(SourceStream, DestStream, DestFile)
    else
    begin
      //Log('No FSB headers found!');
      exit;
    end;
  finally
    DestStream.Free;
  end;
end;

function ShouldDownmixChannels(Channels, Frame: integer): boolean;
var
	ChansResult: integer;
begin
	if (Channels and 1) = 1 then
		ChansResult := Channels
	else
		ChansResult := Channels div 2;

	ChansResult := frame mod ChansResult;

	if (Channels <= 2) or (ChansResult = 0) then
		result := true
	else
		result := false;
end;

procedure TTelltaleMusicDumper.SaveFixedMP3Stream(InStream, OutStream: TStream; FileSize, Channels: integer);
var
	Frame, FrameSize, n: integer;
  Buffer: TBuffer;
	TempBuffer: TBuffer;
	tmpMpegHeader: TMpegHeader;
	TempByte: Byte;
begin
	Frame := 0;
	while FileSize > 0 do
	begin
    SetLength(buffer, 3);
		if InStream.Read(Buffer[0], 3) <> 3 then  //bytes read
			break;

		Dec(FileSize, 3);
		FrameSize := 0;
    //read 3 bytes, if invalid header then read another and shuffle the bytes up in the buffer and check again.
		while FileSize > 0 do
		begin
      tmpMpegHeader := GetValidatedHeader(Buffer, 0);
		  FrameSize := tmpMpegHeader.framelength;
      if tmpMpegHeader.valid = true then
        if FrameSize > 0 then break;

      if InStream.Size - InStream.Position < 1 then //Just in case
      begin
        //Log('Tried to read beyond stream in SaveFixedMP3Stream()');
        exit;
      end;
      InStream.Read(TempByte, 1);

		  Dec(FileSize, 1);

		  Buffer[0] := Buffer[1];
		  Buffer[1] := Buffer[2];
		  Buffer[2] := tempbyte;
		end;

		if FileSize < 0 then break;

		dec(FrameSize, 3);

		if ShouldDownmixChannels(Channels, Frame) then
      Outstream.Write(Buffer[0], 3);

    if FrameSize > 0 then
    begin
      SetLength(TempBuffer,FrameSize);
      n := InStream.Read(TempBuffer[0], FrameSize);
      dec(FileSize, n);

      if ShouldDownmixChannels(Channels, Frame) then
        OutStream.Write(TempBuffer[0], n);

      if n <> FrameSize then
        break;
    end;

		inc(Frame);
	end;
end;

function TTelltaleMusicDumper.ExtractFSB4(SourceStream: TTelltaleMemoryStream; DestStream: TStream; DestFile: string): boolean;
type
  TFSBCodec = (
    FMOD_SOUND_FORMAT_NONE,             //* Unitialized / unknown. */
    FMOD_SOUND_FORMAT_PCM8,             //* 8bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM16,            //* 16bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM24,            //* 24bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM32,            //* 32bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCMFLOAT,         //* 32bit floating point PCM data. */
    FMOD_SOUND_FORMAT_GCADPCM,          //* Compressed Nintendo 3DS/Wii DSP data. */
    FMOD_SOUND_FORMAT_IMAADPCM,         //* Compressed IMA ADPCM data. */
    FMOD_SOUND_FORMAT_VAG,              //* Compressed PlayStation Portable ADPCM data. */
    FMOD_SOUND_FORMAT_HEVAG,            //* Compressed PSVita ADPCM data. */
    FMOD_SOUND_FORMAT_XMA,              //* Compressed Xbox360 XMA data. */
    FMOD_SOUND_FORMAT_MPEG,             //* Compressed MPEG layer 2 or 3 data. */
    FMOD_SOUND_FORMAT_CELT,             //* Compressed CELT data. */
    FMOD_SOUND_FORMAT_AT9,              //* Compressed PSVita ATRAC9 data. */
    FMOD_SOUND_FORMAT_XWMA,             //* Compressed Xbox360 xWMA data. */
    FMOD_SOUND_FORMAT_VORBIS           //* Compressed Vorbis data. */
    );
const
  FSB_FileNameLength: integer = 30;
  FSOUND_DELTA = $00000200;
  FSOUND_8BITS = $00000008;
  FSOUND_16BITS = $00000010;
  FSOUND_MONO = $00000020;
  FSOUND_STEREO = $00000040;
var
  TempInt, RecordSize, Mode, Channels: Integer;
  Codec: TFSBCodec;
begin
{
    char        id[4];      /* 'FSB4' */
    int32_t     numsamples; /* number of samples in the file */
    int32_t     shdrsize;   /* size in bytes of all of the sample headers including extended information */
    int32_t     datasize;   /* size in bytes of compressed sample data */
    uint32_t    version;    /* extended fsb version */
    uint32_t    mode;       /* flags that apply to all samples in the fsb */
    char        zero[8];    /* ??? */
    uint8_t     hash[16];   /* hash??? */
}
  Result := false;

  SourceStream.Position := 0;
  DestStream.Position := 0;

  if SourceStream.ReadDWord <> 876761926 then //'FSB4'
  begin
    //Log( 'Not a FSB4 header! in FileNo ' + inttostr(FileNo));
    Exit;
  end;

  TempInt := SourceStream.ReadDWord;
  if TempInt <> 1 then //Number of samples
  begin
    raise EMusicDumpError.Create( strMoreThanOneFSB + inttostr(TempInt) + ' on file ' + ExtractFileName(DestFile));  //All games so far have a separate fsb for each sound with 1 sample in the file
    Exit;
  end;

  SourceStream.Seek(40, soFromCurrent); //Now at start of sample header
  RecordSize := SourceStream.ReadWord; //size of this record, inclusive
  SourceStream.Seek(FSB_FileNameLength, soFromCurrent); //Filename
  SourceStream.Seek(16, soFromCurrent);
  Mode := SourceStream.ReadDWord;
  SourceStream.Seek(28, soFromCurrent);
  if RecordSize > 80 then //Some files have extra data
    SourceStream.Seek(RecordSize - 80, soFromCurrent);

  //Now work out the codec it uses - so far its always MPEG
  Codec := FMOD_SOUND_FORMAT_PCM16;
  if (Mode and FSOUND_DELTA) <> 0 then
    Codec := FMOD_SOUND_FORMAT_MPEG
  else
  if ((Mode and FSOUND_8BITS) <> 0) and (Codec = FMOD_SOUND_FORMAT_PCM16) then
    Codec := FMOD_SOUND_FORMAT_PCM8;

  //Get no of channels
  Channels := 1;
  if (Mode and FSOUND_MONO) <> 0 then
    Channels := 1
  else
  if (Mode and FSOUND_STEREO) <> 0 then
    Channels := 2;

  if Codec = FMOD_SOUND_FORMAT_MPEG then //fix broken mp3's
    SaveFixedMP3Stream(SourceStream, DestStream, SourceStream.Size - SourceStream.Position, Channels)
  else
    DestStream.CopyFrom(SourceStream, SourceStream.Size - SourceStream.Position);

  Result := true;
end;

function TTelltaleMusicDumper.ExtractFSB5(SourceStream: TTelltaleMemoryStream; DestStream: TStream; DestFile: string): boolean;
var
  TempInt, FileOffset: integer;
  Offset, TheType: cardinal;
  Channels: Word;
begin
  Result := false;

  SourceStream.Position := 0;
  DestStream.Position := 0;

  if SourceStream.ReadBlockName <> 'FSB5' then
  begin
    //Log( 'Not a FSB5 header! in FileNo ' + inttostr(FileNo));
    Exit;
  end;


  SourceStream.Seek(4, soFromCurrent);

  TempInt := SourceStream.ReadDWord;
  if TempInt <> 1 then //Number of samples
  begin
    raise EMusicDumpError.Create( strMoreThanOneFSB + inttostr(TempInt) + ' on file ' + ExtractFileName(DestFile));  //All games so far have a separate fsb for each sound with 1 sample in the file
    Exit;
  end;

  FileOffset := SourceStream.ReadDWord + SourceStream.ReadDWord + 60;

  SourceStream.Seek(40, sofromcurrent); //now at end of file header

  Offset := SourceStream.ReadDWord;
  SourceStream.Seek(4, sofromcurrent); //samples
  TheType := Offset and ((1 shl 7) -1);
  SourceStream.Seek(4, sofromcurrent); //offset again
  Channels := (TheType shr 5) + 1;


  SourceStream.Seek(FileOffset, soFromBeginning); //Now at start of data???

  //Assume its mp3 - so far everything is
  SaveFixedMP3Stream(SourceStream, DestStream, SourceStream.Size - SourceStream.Position, Channels);

  Result := true;
end;

procedure TTelltaleMusicDumper.TagMusic(FileName, Title, Album, Artist, Genre, TrackNo, Year, Coverart: string);
var
  SourceCover: string;
  OpusTag: TOpusTag;
begin
  OpusTag := TOpusTag.Create;
  try
    OpusTag.SetTextFrameText('TITLE', Title);
    OpusTag.SetTextFrameText('ALBUM', Album);
    OpusTag.SetTextFrameText('ARTIST', Artist);
    OpusTag.SetTextFrameText('GENRE', Genre);
    OpusTag.SetTextFrameText('TRACK', TrackNo);
    OpusTag.SetTextFrameText('Year', Year);
    OpusTag.SetTextFrameText('Album Artist', 'Telltale Games');
    OpusTag.SetTextFrameText('COMMENT', strCommentTag + strProgVersion + ' ' + strProgURL);
    OpusTag.SaveToFile(FileName);
  finally
    OpusTag.Free;
  end;

  if CoverArt <> '' then
  begin
    SourceCover := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName) + strSoundTrackDir) + Coverart;
    if FileExists(SourceCover) then
      FileCopy( SourceCover, ExtractFilePath(FileName) + Coverart, false);
  end;
end;

end.
