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

unit uTelltaleMusicExtractorConst;

interface

const
  strGameNotFound:       string = 'Couldnt find the game.' + #13 + #13 + 'Try clicking ''Open Folder'' and browse for the game manually.';
  strProgName:           string = 'Telltale Music Extractor';
  strProgVersion:        string = '1.5.0';
  strProgURL:            string = 'http://quickandeasysoftware.net';
  strSoundTrackDir:      string = 'Soundtracks';
  strCommentTag:         string = 'Created with Telltale Music Extractor ';
  strDumpSoundTrack:     string = 'Do you want to dump this game as a soundtrack?' + #13#13 + 'See the readme for more information about this.';
  strCSIFatalConspiracy: string = 'CSI Fatal Conspiracy has the music for each of its 5 parts stored in separate folders. ' +
                                  'You''ll need to dump the music from each part manually.' + #13#13 +
                                  'To do this click "Open Folder", scroll down to the "Pack" folder, select one of the CSI6 folders and click the "Go" button.'
                                  + #13#13 +
                                  'For example, select the CSI601 folder to dump the music from the first part.';


  strInvalidFolder:   string = 'Invalid destination folder. Check the destination path';
  strNoMusicFound:    string = 'No .aud or music .ttarch files found! Check the source folder path!';
  strMoreThanOneFSB:  string = 'Not just 1 sample in FSB! ';
  strTtarchError:     string = 'Error while parsing the Ttarch bundle';
  strNoSoundtrackErr: string = 'Error - soundtrack parameter is nil';
  strSoundtrackOnlyOgg: string = 'At the moment only OGG files are supported for soundtracks, and this file is a MP3 or WAV. This is because I am lazy. If you need support for MP3 and WAV files then contact me';

implementation

end.
