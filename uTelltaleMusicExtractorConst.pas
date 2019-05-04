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

unit uTelltaleMusicExtractorConst;

interface

const
  strGameNotFound:       string = 'Couldnt find the game.' + #13 + #13 + 'Try clicking ''Open Folder'' and browse for the game manually.';
  strProgName:           string = 'Telltale Music Extractor';
  strProgVersion:        string = '1.5.5';
  strProgURL:            string = 'http://quickandeasysoftware.net';
  strSoundTrackDir:      string = 'Soundtracks';
  strCommentTag:         string = 'Created with Telltale Music Extractor ';
  strDumpSoundTrack:     string = 'Do you want to dump this game as a soundtrack?' + #13#13 + 'See the readme for more information about this.';
  strCSIFatalConspiracy: string = 'CSI Fatal Conspiracy has the music for each of its 5 parts stored in separate folders. ' +
                                  'You''ll need to dump the music from each part manually.' + #13#13 +
                                  'To do this click "Open Folder", scroll down to the "Pack" folder, select one of the CSI6 folders and click the "Go" button.'
                                  + #13#13 +
                                  'For example, select the CSI601 folder to dump the music from the first part.';

  strCSIDeadlyIntent:    string = 'CSI Deadly Intent has the music for each of its 5 parts stored in separate folders. ' +
                                  'You''ll need to dump the music from each part manually.' + #13#13 +
                                  'To do this click "Open Folder", scroll down to the "Pack" folder, select one of the CSI5 folders and click the "Go" button.'
                                  + #13#13 +
                                  'For example, select the CSI501 folder to dump the music from the first part.';
  strInvalidFolder:   string = 'Invalid destination folder. Check the destination path';
  strNoFilesCreated:  string = 'No music files were created!';
  strNoMusicFound:    string = 'No music files found! Check the source folder path!' + #13#13 + 'Choose a folder with .aud .ttarch  or .ttarch2 files.';
  strMoreThanOneFSB:  string = 'Not just 1 sample in FSB! ';
  strTtarchError:     string = 'Error while parsing the Ttarch bundle';
  strNoSoundtrackErr: string = 'Error - soundtrack parameter is nil';
  strSoundtrackOnlyOgg: string = 'At the moment only OGG files are supported for soundtracks, and this file is a MP3 or WAV. This is because I am lazy. If you need support for MP3 and WAV files then contact me';
  strAuthorLink:      string = 'By Bennyboy' + #13 + '<a href="http://quickandeasysoftware.net">Quick and Easy Software</a>';
  strOpenDialogTitle: string = 'Choose a folder with .aud .ttarch  or .ttarch2 files';
  strSaveDialogTitle: string =  'Select a destination folder for the music';
  strAllDone:         string = 'All done! ';
  strXFilesCreated:   string = ' files created.';
  strMissingMenu:     string =  'Menu missing for game! Report this.';
  strExtraBankDumpFail:   string = 'Error dumping extra bank files!';
  strMultipleMusicBundles: string = 'Error - couldn''t automatically find the music bundle.' + #13#13 +
                                    'It is likely that this folder contains the music for multiple episodes of a game. There are two possible solutions to this:' + #13#13 +
                                    'Select an episode from the menu and the program will automatically find the files for that episode. Or...' + #13#13 +
                                    'Choose "Open file" and select the file that you want to extract music from. If you do this then you will want the file ending in ''ms'' eg MCSM_pc_Minecraft103_ms';

implementation

end.
