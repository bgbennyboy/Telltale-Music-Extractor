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


program Telltale_Music_Extractor;

uses
  Forms,
  formMain in 'formMain.pas' {frmMain},
  uSoundtrackManager in 'uSoundtrackManager.pas',
  uTelltaleMusicDumper in 'uTelltaleMusicDumper.pas',
  uTelltaleMusicExtractorConst in 'uTelltaleMusicExtractorConst.pas';

{$R *.res}
  
begin
  Application.Initialize;
  Application.Title := 'Telltale Music Extractor';

  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
