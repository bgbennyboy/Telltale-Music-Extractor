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
