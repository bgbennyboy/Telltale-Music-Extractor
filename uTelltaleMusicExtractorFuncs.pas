{
******************************************************
  Telltale Music Extractor
  Copyright (c) 2006 - 2018 Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}

unit uTelltaleMusicExtractorFuncs;

interface

uses
  Classes, Sysutils, windows,
  JCLFileUtils;

procedure FindFilesInDirByExt(Path, FileExt: string; FileList: TStrings);
procedure RemoveReadOnlyFileAttribute(FileName: string);
function ExtractResourceFileToDir(ExtractedName, Directory, ResourceName: string): string;
function CountFilesInFolder ( path: string ): integer;

implementation


//Find files with a specific extension and add them to a string list
procedure FindFilesInDirByExt(Path, FileExt: string; FileList: TStrings);
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
    Sysutils.FindClose(SR);
  end;
end;


function ExtractResourceFileToDir(ExtractedName, Directory, ResourceName: string): string;
var
  ResStream: TResourceStream;
begin
  result := IncludeTrailingPathDelimiter(Directory) + ExtractedName;
  ResStream := TResourceStream.Create(hInstance, ResourceName, RT_RCDATA);
  try
    try
      if FileExists(result) then //Want it to make a new file not overwrite existing one - there could be 2 instances of program open
        result := FindUnusedFileName(result, ExtractFileExt(ExtractedName));

      ResStream.SaveToFile(result);
    except
      on E: EFCreateError do //If it tries to overwrite and cant this gets raised
      begin
        result := FindUnusedFileName(result, ExtractFileExt(ExtractedName));
        ResStream.SaveToFile(result);
      end;
    end;
  finally
    ResStream.Free;
  end;
end;

procedure RemoveReadOnlyFileAttribute(FileName: string);
var
  Attributes: cardinal;
begin
  if FileName = '' then exit;

  Attributes:=FileGetAttr(FileName);
  if Attributes = INVALID_FILE_ATTRIBUTES then exit;

  if Attributes and faReadOnly = faReadOnly then
    FileSetAttr(FileName, Attributes xor faReadOnly);
end;

function CountFilesInFolder ( path: string ): integer;
var
  tsr: TSearchRec;
begin
  path := IncludeTrailingPathDelimiter ( path );
  result := 0;
  if FindFirst ( path + '*.*', faAnyFile and not faDirectory, tsr ) = 0 then begin
    repeat
      inc ( result );
    until FindNext ( tsr ) <> 0;
    Sysutils.FindClose ( tsr );
  end;
end;
end.
