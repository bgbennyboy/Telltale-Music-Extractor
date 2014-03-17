{
******************************************************
  Telltale Music Extractor
  Copyright (c) 2006 - 2014 Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

unit uTelltaleMusicDumper;

interface

uses
  Classes, SysUtils, Forms,
  JCLFileUtils,
  uTelltaleFuncs, uTtarchBundleManager, uTelltaleMemStream, uTelltaleTypes,
  uTelltaleMusicExtractorConst,
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
    fSourceFiles: TStringList;
    fTtarchFilename: string;
    fOnProgress: TProgressEvent;

    function FindMusicType(SearchDir: String): TMusicType;
    function FindMusicTtarchBundle(Dir: string; TheGame: TTelltaleGame): string;
    procedure FindFilesInDirByExt(Path, FileExt: string; FileList: TStrings);
    procedure LoadTtarchBundle;
    procedure TagMusic(FileName, Title, Album, Artist, Genre, TrackNo, Year, Coverart: string);
    function CopyUnbundledFiles: integer;
    function CopyBundledFiles: integer;
    function CopyBundledFilesWithSoundtrack(Soundtrack: TSoundtrackManager): integer;
    function SaveFSBToMP3(SourceStream: TTelltaleMemoryStream; DestFile: string): boolean;
  public
    constructor Create(SearchDir, DestDir: String; Game: TTelltaleGame);
    destructor Destroy; override;
    function SaveFiles: integer; overload;
    function SaveFiles(Soundtrack: TSoundtrackManager): integer; overload;
    function GetListOfFilesInBundleWithoutExt(var FileList: TStringList): integer;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
  end;

implementation

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

//Find files with a specific extension and add them to a string list
procedure TTelltaleMusicDumper.FindFilesInDirByExt(Path, FileExt: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if length(FileExt) > 1 then
    if FileExt[1] <> '.' then
      FileExt := '.' + FileExt;

  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      begin
        if sr.Attr and faDirectory = faDirectory then
        else
        if sr.Attr and faSysFile = faSysFile then
        else
        begin
          if extractfileext(sr.Name)=FileExt then
            filelist.Add(sr.Name);
        end;
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function TTelltaleMusicDumper.FindMusicTtarchBundle(Dir: string; TheGame: TTelltaleGame): string;
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
  //HACK - if add new game - also add it to the SpecificBundleNames list at the bottom
var
  BundleList, SpecificBundleNames: TStringList;
  i, j: integer;
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
      WolfAmongUs_Faith:              BundleFileName := WolfEP1_MusicBundle;
      WolfAmongUs_SmokeAndMirrors:    BundleFileName := WolfEP2_MusicBundle;
      WolfAmongUs_ACrookedMile:       BundleFileName := WolfEP3_MusicBundle;
      WolfAmongUs_InSheepsClothing:   BundleFileName := WolfEP4_MusicBundle;
      WolfAmongUs_CryWolf:            BundleFileName := WolfEP5_MusicBundle;
      WalkingDead_S2_AllThatRemains:  BundleFileName := WalkingDeadS2_EP1_Bundle;
      WalkingDead_S2_AHouseDivided:   BundleFileName := WalkingDeadS2_EP2_Bundle;
      WalkingDead_S2_InHarmsWay:      BundleFileName := WalkingDeadS2_EP3_Bundle;
      WalkingDead_S2_AmidTheRuins:    BundleFileName := WalkingDeadS2_EP4_Bundle;
      WalkingDead_S2_NoGoingBack:     BundleFileName := WalkingDeadS2_EP5_Bundle;
    end;

    for I := 0 to BundleList.Count - 1 do
    begin
      //For .ttarch2 bundles try and find a specific file - as bundles are often all in the same dir along with a boot music bundle
      if Uppercase( ExtractFileExt( BundleList.Strings[i] )) = '.TTARCH2' then
      begin
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

    {
    Edge case - they've used 'open folder' to manually choose a game. They've
    chosen a folder with one of the new .ttarch2 games in it - so we dont know
    what specific episode they actually want from that folder.
    Hack for now - just choose the first recognised bundle in that folder
    THIS IS AN AWFUL HACK - FIX THIS
    Having to remember to add new constants to the stringlist below is particularly bad
    }
    if result = '' then
    begin
      SpecificBundleNames := TstringList.Create;
      try
        SpecificBundleNames.Add(WolfEP1_MusicBundle);
        SpecificBundleNames.Add(WolfEP2_MusicBundle);
        SpecificBundleNames.Add(WolfEP3_MusicBundle);
        SpecificBundleNames.Add(WolfEP4_MusicBundle);
        SpecificBundleNames.Add(WolfEP5_MusicBundle);
        SpecificBundleNames.Add(WalkingDeadS2_EP1_Bundle);
        SpecificBundleNames.Add(WalkingDeadS2_EP2_Bundle);
        SpecificBundleNames.Add(WalkingDeadS2_EP3_Bundle);
        SpecificBundleNames.Add(WalkingDeadS2_EP4_Bundle);
        SpecificBundleNames.Add(WalkingDeadS2_EP5_Bundle);

        for j := 0 to SpecificBundleNames.Count - 1 do
        begin
          for I := 0 to BundleList.Count - 1 do
          begin
            if Uppercase( ExtractFileExt( BundleList.Strings[i] )) <> '.TTARCH2' then continue;

            if UpperCase(BundleList.Strings[i]) = UpperCase(SpecificBundleNames[j]) then
            begin
              result := BundleList.Strings[i];
              exit;
            end;
          end;
        end;
      finally
        SpecificBundleNames.Free;
      end;
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


function TTelltaleMusicDumper.CopyBundledFiles: integer;
var
  i, MusicCount: integer;
  TempStream: TTelltaleMemoryStream;
  DestPath: string;
  DestFile: TFileStream;
begin
  Result:=0;

  //First count how many files there are
  MusicCount:=0;
  for i := 0 to fBundle.Count - 1 do
  begin
    if (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.AUD') or
       (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.WAV') or    //walking dead 101 has mix of aud + wav
       (Uppercase( ExtractFileExt( fBundle.FileName[i] )) = '.FSB') then  //walking dead has FSB
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

function TTelltaleMusicDumper.SaveFSBToMP3(SourceStream: TTelltaleMemoryStream; DestFile: string): boolean;
var
  TempInt: Integer;
  buffer: TBuffer;
  tmpMpegHeader: TMpegHeader;
  DestStream: TFileStream;
begin
  result := false;

  SourceStream.Position := 0;

  if SourceStream.ReadDWord <> 876761926 then //'FSB4'
  begin
    //ShowMessage( 'Not a FSB4 header! on file ' + ExtractFileName(DestFile));
    Exit;
  end;

  TempInt := SourceStream.ReadDWord;
  if TempInt <> 1 then //Number of samples
  begin
    raise EMusicDumpError.Create( strMoreThanOneFSB + inttostr(TempInt) + ' on file ' + ExtractFileName(DestFile));
    Exit;
  end;

  DestStream:=tfilestream.Create(DestFile, fmOpenWrite or fmCreate);
  try
    DestStream.Position := 0;

    TempInt := SourceStream.ReadDWord; //Size of sample header
    SourceStream.Seek(36 + TempInt, soFromCurrent); //Puts it at start of sample data


    //Now parse the MP3
    while SourceStream.Position < SourceStream.Size do
    begin
      setlength(buffer, 4);
      TempInt := SourceStream.Read(buffer[0], 4);  //Bytes read
      if TempInt < 4 then exit;

      tmpMpegHeader := GetValidatedHeader(buffer, 0);
      if tmpMpegHeader.valid then
      begin
        SourceStream.Seek( -4, soFromCurrent);
        if tmpMpegHeader.framelength + SourceStream.Position > SourceStream.Size then
          exit //Bad frame at the end, dont copy it
        else
          DestStream.CopyFrom(SourceStream, tmpMpegHeader.framelength);
      end
      else
        SourceStream.Position := SourceStream.Position -3;
    end;

   finally
    Result := true;
    DestStream.Free;
  end;
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
