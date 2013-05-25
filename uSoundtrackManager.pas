{
******************************************************
  Telltale Music Extractor
  Copyright (c) 2006 - 2013 Bennyboy
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


unit uSoundtrackManager;

interface

uses
  Classes, Sysutils, Inifiles ,jclfileutils {,dialogs};

type
  EInvalidIniFile = class (exception);

  TSoundtrackManager = class

  private
    FSoundTrackIni: TMemIniFile;
    FFilesList, FOriginalFileNames: TStringList;
    FSoundTrackDir: string;
    FNoSoundTracks: boolean;
    function FindMatchingIniFile: string;
    procedure ListFileDir(Path: string; FileList: TStrings);
    function CheckForUniqueFiles(UniqueFile1, UniqueFile2, UniqueFile3: string): boolean;
    function GetGameTitle: string;
    function GetCount: integer;
    function GetNewName(OriginalName: string): string;
    function GetOriginalFileNames(Index: integer): string;
    function GetCombinationFileCount(OriginalName: string): integer;
    function GetCombinationFiles(var FileList: TStringList; FileCount: integer; OriginalName: string): boolean;
    function GetAlbum: string;
    function GetArtist: string;
    function GetGenre: string;
    function GetTitle(OriginalName: string): string;
    function GetTrackNo(OriginalName: string): string;
    function GetYear: string;
    function GetCoverArt: string;
  public
    constructor Create(SoundTrackDir: String; FilesList: TStringList);
    destructor Destroy; override;
    property GameTitle: string read GetGameTitle;
    property Title[OriginalName: string]: string read GetTitle;
    property TrackNo[OriginalName: string]: string read GetTrackNo;
    property Album: string read GetAlbum;
    property Artist: string read GetArtist;
    property Year: string read GetYear;
    property Genre: string read GetGenre;
    property CoverArt: string read GetCoverArt;

    property NewName[OriginalName: string]: string read GetNewName;
    property Count: integer read GetCount;
    property OriginalFileNames[Index: integer]: string read GetOriginalFileNames;
    property CombinationFileCount[OriginalName: string]: integer read GetCombinationFileCount;
    property CombinationFiles[var FileList: TStringList; FileCount: integer; OriginalName: string]: boolean read GetCombinationFiles;
end;

implementation

function IsValidFileName( const FileName: string ): boolean;
begin
  Result := (LastDelimiter('\/:*?"<>|',FileName ) =0 );
end;


{
  CleanFileName
  ---------------------------------------------------------------------------

  Given an input string strip any chars that would result
  in an invalid file name.  This should just be passed the
  filename not the entire path because the slashes will be
  stripped.  The function ensures that the resulting string
  does not hae multiple spaces together and does not start
  or end with a space.  If the entire string is removed the
  result would not be a valid file name so an error is raised.

}

function CleanFileName(const InputString: string): string;
var
  i: integer;
  ResultWithSpaces: string;
begin
  if InputString = '' then
  begin
    Result := InputString;
    exit;
  end;

  ResultWithSpaces := InputString;

  for i := 1 to Length(ResultWithSpaces) do
  begin
    // These chars are invalid in file names.
    case ResultWithSpaces[i] of
      '/', '\', ':', '*', '?', '"', '|', ' ', #$D, #$A, #9:
        // Use chr(161) to indicate a duplicate space so we can remove
        // them at the end.
        {$WARNINGS OFF} // W1047 Unsafe code 'String index to var param'
        if (i > 1) and
          ((ResultWithSpaces[i - 1] = ' ') or (ResultWithSpaces[i - 1] = chr(161))) then
          ResultWithSpaces[i] := chr(161)
        else
          ResultWithSpaces[i] := ' ';

        {$WARNINGS ON}
    end;
  end;

  // A * indicates duplicate spaces.  Remove them.
  result := StringReplace(ResultWithSpaces, chr(161), '', [rfReplaceAll]);  //ReplaceStr(ResultWithSpaces, '*', '');

  // Also trim any leading or trailing spaces
  result := Trim(Result);
end;


procedure TSoundtrackManager.ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      begin
        if sr.Attr and faDirectory = faDirectory then
        else
        if sr.Attr and faSysFile = faSysFile then
        else
        begin
          if extractfileext(sr.Name)='.ini' then
            filelist.Add(sr.Name);
        end;
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function TSoundtrackManager.FindMatchingIniFile: string;
var
  SoundTrackFiles: TstringList;
  i: integer;
  StrUnique1, StrUnique2, StrUnique3: string;
  FileCheck: boolean;
begin
  SoundTrackFiles:=TStringList.Create;
  try
    ListFileDir(FSoundTrackDir, SoundTrackFiles);

    result:='';
    if SoundTrackFiles.Count=0 then exit;

    for I := 0 to SoundTrackFiles.Count - 1 do
    begin
      FSoundTrackIni:=TMemIniFile.Create(FSoundTrackDir + SoundTrackFiles[i]);
      try
        StrUnique1:=FSoundTrackIni.ReadString('Info Header', 'UniqueFile1', '');
        StrUnique2:=FSoundTrackIni.ReadString('Info Header', 'UniqueFile2', '');
        StrUnique3:=FSoundTrackIni.ReadString('Info Header', 'UniqueFile3', '');

        FileCheck:=CheckForUniqueFiles(StrUnique1, StrUnique2, StrUnique3);
        if FileCheck = true then
        begin
          result:=FSoundTrackDir + SoundTrackFiles[i];
          break;
        end;

      finally
        FSoundTrackIni.Free;
      end;
    end;

  finally
    SoundTrackFiles.Free;
  end;
end;

function TSoundtrackManager.CheckForUniqueFiles(UniqueFile1,
  UniqueFile2, UniqueFile3: string): boolean;
var
  FoundCount, i: integer;
begin
  if UniqueFile1='' then //They are all unique but if this is blank then
  begin                  //the others probably will be
    result:=false;
    exit;
  end;

  FoundCount:=0;

  for i := 0 to fFilesList.Count - 1 do
  begin
    if (PathRemoveExtension(fFilesList[i]) = UniqueFile1) or
       (PathRemoveExtension(fFilesList[i]) = UniqueFile2) or
       (PathRemoveExtension(fFilesList[i]) = UniqueFile3) then
        inc(FoundCount);
  end;

  if FoundCount=3 then
    result:=true
  else
    result:=false;
end;

constructor TSoundtrackManager.Create(SoundTrackDir: String; FilesList: TStringList);
var
  Ini: string;
begin
  FFilesList := FilesList;
  FOriginalFileNames := TStringList.Create;

  FSoundTrackDir:=IncludeTrailingPathDelimiter(SoundTrackDir);

  Ini:=FindMatchingIniFile;

  if ini= '' then
  begin
    FNoSoundTracks:=true;
    raise EInvalidIniFile.Create('No valid SoundTrack ini file found!');
  end
  else
  begin
    FSoundTrackIni:=TMemIniFile.Create(Ini);
    FNoSoundTracks:=false;
    FSoundTrackIni.ReadSections(FOriginalFileNames);
    if FOriginalFileNames.Count > 0 then
      if FOriginalFileNames[0] = 'Info Header' then
        FOriginalFileNames.Delete(0);

  end;
end;

destructor TSoundtrackManager.Destroy;
begin
  if FNoSoundTracks=false then
    FSoundTrackIni.Free;

  FOriginalFileNames.Free;

  inherited;
end;

function TSoundtrackManager.GetNewName(OriginalName: string): string;
var
  Track: string;
  Title: string;
begin
  if FNoSoundTracks then
  begin
    Result:='';
    Exit;
  end;

  if OriginalName = '' then
  begin
    Result:='';
    Exit;
  end;

  //Result := FSoundTrackIni.ReadString( ChangeFileExt(OriginalName, ''), 'NewName', '');
  Track := GetTrackNo(OriginalName);
  Title := GetTitle(OriginalName);
  if Title = '' then
    Result := ''
  else
  if Track = '' then
    Result := Title
  else
    Result := Track + ' - ' + Title;


  //Strip any invalid characters
  Result := StringReplace(Result, '/', '-', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':', ' -', [rfReplaceAll, rfIgnoreCase]);

  if IsValidFileName(Result) = false then
    Result := CleanFileName(Result);


  //To fix any future ChangeFileExt calls
  if Pos('.', Result) <> 0 then
    Result := Result + '.'; //Pad it with . so that will be stripped

end;


function TSoundtrackManager.GetOriginalFileNames(Index: integer): string;
begin
  if (Index < 0) or (Index > FOriginalFileNames.Count) then
  begin
    Result:='';
    Exit;
  end;

  Result := FOriginalFileNames[Index];
end;

function TSoundtrackManager.GetAlbum: string;
begin
  Result :=   FSoundTrackIni.ReadString('Info Header', 'Album', '');
end;

function TSoundtrackManager.GetArtist: string;
begin
  Result :=   FSoundTrackIni.ReadString('Info Header', 'Artist', '');
end;

function TSoundtrackManager.GetGenre: string;
begin
  Result :=   FSoundTrackIni.ReadString('Info Header', 'Genre', '');
end;

function TSoundtrackManager.GetTitle(OriginalName: string): string;
begin
  if FNoSoundTracks then
  begin
    Result:='';
    Exit;
  end;

  if OriginalName = '' then
  begin
    Result:='';
    Exit;
  end;

  Result := FSoundTrackIni.ReadString( OriginalName, 'Title', '');
end;

function TSoundtrackManager.GetTrackNo(OriginalName: string): string;
begin
  if FNoSoundTracks then
  begin
    Result:='';
    Exit;
  end;

  if OriginalName = '' then
  begin
    Result:='';
    Exit;
  end;

  Result := FSoundTrackIni.ReadString( OriginalName, 'TrackNo', '');
end;

function TSoundtrackManager.GetYear: string;
begin
  Result := FSoundTrackIni.ReadString('Info Header', 'Year', '');
end;

function TSoundtrackManager.GetCombinationFileCount(OriginalName: string): integer;
var
  i: integer;
begin
  Result := 0;
  i := 1;
  while FSoundTrackIni.ReadString(OriginalName, 'File' + inttostr(i), '') <> '' do
  begin
    inc(Result);
    inc(i);
  end;
end;

function TSoundtrackManager.GetCombinationFiles(var FileList: TStringList;
  FileCount: integer; OriginalName: string): boolean;
var
  i: integer;
  tempstr: string;
begin
  Result := false;
  if FileCount < 1 then exit;
  if FileList = nil then exit;

  for I := 1 to FileCount  do
  begin
    tempstr := FSoundTrackIni.ReadString(OriginalName, 'File' + inttostr(i), '');
    if tempstr = '' then
      exit
    else
      FileList.Add(tempStr);
  end;

  result :=true;
end;

function TSoundtrackManager.GetCount: integer;
begin
  result := FOriginalFileNames.count;
end;

function TSoundtrackManager.GetCoverArt: string;
begin
  result := FSoundTrackIni.ReadString('Info Header', 'Coverart', '');
end;

function TSoundtrackManager.GetGameTitle: string;
begin
  result := FSoundTrackIni.ReadString('Info Header', 'Title', '');
end;

end.
