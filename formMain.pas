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

unit formMain;

interface

uses
  Windows, Menus, Forms, ImgList, Controls, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, Classes, SysUtils, ShellApi, TypInfo, System.UITypes,

  JvBaseDlg, JvBrowseFolder, JCLSysInfo, JCLStrings, JCLFileUtils,

  uTelltaleFuncs, uTelltaleMusicExtractorConst, uTelltaleMusicDumper,
  uSoundTrackManager;

type
  TfrmMain = class(TForm)
    ProgressBar1: TProgressBar;
    EditSourcePath: TLabeledEdit;
    dlgBrowseForFolder: TJvBrowseForFolderDialog;
    PopupMenuOpen: TPopupMenu;
    MenuOpenFolder: TMenuItem;
    N2: TMenuItem;
    Bone1: TMenuItem;
    Menu_Bone_Boneville: TMenuItem;
    Menu_Bone_CowRace: TMenuItem;
    CrimeSceneInvestigation1: TMenuItem;
    Menu_CSI_3Dimensions: TMenuItem;
    Menu_CSI_HardEvidence: TMenuItem;
    SamAndMaxSeason11: TMenuItem;
    Menu_SamAndMax_CultureShock: TMenuItem;
    Menu_SamAndMax_SituationComedy: TMenuItem;
    Menu_SamAndMax_MoleMobMeatball: TMenuItem;
    Menu_SamAndMax_AbeLincoln: TMenuItem;
    Menu_SamAndMax_Reality20: TMenuItem;
    Menu_SamAndMax_BrightSideMoon: TMenuItem;
    SamAndMaxSeason21: TMenuItem;
    Menu_SamAndMax_IceStationSanta: TMenuItem;
    Menu_SamAndMax_MoaiBetterBlues: TMenuItem;
    Menu_SamAndMax_NightOfTheRavingDead: TMenuItem;
    Menu_SamAndMax_ChariotsOfTheDogs: TMenuItem;
    Menu_SamAndMax_WhatsNewBeelzebub: TMenuItem;
    StrongBadSeason11: TMenuItem;
    Menu_StrongBad_HomestarRuiner: TMenuItem;
    Menu_StrongBad_StrongBadiaTheFree: TMenuItem;
    Menu_StrongBad_BaddestOfTheBands: TMenuItem;
    Menu_StrongBad_Daneresque3: TMenuItem;
    Menu_StrongBad_8BitIsEnough: TMenuItem;
    Menu_Texas_Holdem: TMenuItem;
    WallaceandGromitsGrandAdventures1: TMenuItem;
    Menu_WallaceAndGromit_TheBogeyMan: TMenuItem;
    Menu_WallaceAndGromit_Muzzled: TMenuItem;
    Menu_WallaceAndGromit_TheLastResort: TMenuItem;
    Menu_WallaceAndGromit_FrightOfTheBumblebees: TMenuItem;
    TalesOfMonkeyIsland1: TMenuItem;
    Menu_Monkey_ScreamingNarwhal: TMenuItem;
    Menu_Monkey_SpinnerCay: TMenuItem;
    Menu_Monkey_LairLeviathan: TMenuItem;
    Menu_Monkey_TrialExecution: TMenuItem;
    Menu_Monkey_PirateGod: TMenuItem;
    Menu_CSI_DeadlyIntent: TMenuItem;
    SamAndMaxSeason31: TMenuItem;
    Menu_SamAndMax_CityThatDaresNotSleep: TMenuItem;
    Menu_SamAndMax_BeyondAlleyOfDolls: TMenuItem;
    Menu_SamAndMax_TheyStoleMaxsBrain: TMenuItem;
    Menu_SamAndMax_TombOfSammunMak: TMenuItem;
    Menu_SamAndMax_PenalZone: TMenuItem;
    PuzzleAgent1: TMenuItem;
    Menu_PuzzleAgent_Scoggins: TMenuItem;
    Menu_CSI_FatalConspiracy: TMenuItem;
    Menu_PokerNight_Inventory: TMenuItem;
    BackToTheFuture2: TMenuItem;
    Menu_BackToTheFuture_OutaTime: TMenuItem;
    Menu_BackToTheFuture_DoubleVisions: TMenuItem;
    Menu_BackToTheFuture_CitizenBrown: TMenuItem;
    Menu_BackToTheFuture_GetTannen: TMenuItem;
    Menu_BackToTheFuture_ItsAboutTime: TMenuItem;
    HectorBadgeOfCarnage1: TMenuItem;
    Menu_Hector_WeNegotiateWithTerrorists: TMenuItem;
    Menu_PuzzleAgent_2: TMenuItem;
    Menu_Hector_SenselessActsOfJustice: TMenuItem;
    Menu_Hector_BeyondReasonableDoom: TMenuItem;
    JurassicParkTheGame: TMenuItem;
    Menu_JurassicPark_EP4: TMenuItem;
    Menu_JurassicPark_EP3: TMenuItem;
    Menu_JurassicPark_EP2: TMenuItem;
    Menu_JurassicPark_EP1: TMenuItem;
    heWalkingDead1: TMenuItem;
    Menu_WalkingDead_ANewDay: TMenuItem;
    Menu_LawAndOrder_Legacies: TMenuItem;
    Menu_WalkingDead_StarvedForHelp: TMenuItem;
    Menu_WalkingDead_LongRoadAhead: TMenuItem;
    Menu_WalkingDead_AroundEveryCorner: TMenuItem;
    Menu_WalkingDead_NoTimeLeft: TMenuItem;
    MenuPoker: TMenuItem;
    Menu_PokerNight_2: TMenuItem;
    TheWolfAmongUs1: TMenuItem;
    Menu_WolfAmongUs_Faith: TMenuItem;
    SeasonOne1: TMenuItem;
    SeasonTwo1: TMenuItem;
    Menu_WalkingDead_400Days: TMenuItem;
    Menu_WalkingDead_S2_AllThatRemains: TMenuItem;
    Menu_WalkingDead_S2_AHouseDivided: TMenuItem;
    Menu_WalkingDead_S2_InHarmsWay: TMenuItem;
    Menu_WalkingDead_S2_AmidTheRuins: TMenuItem;
    Menu_WalkingDead_S2_NoGoingBack: TMenuItem;
    Menu_WolfAmongUs_SmokeAndMirrors: TMenuItem;
    Menu_WolfAmongUs_ACrookedMile: TMenuItem;
    Menu_WolfAmongUs_InSheepsClothing: TMenuItem;
    Menu_WolfAmongUs_CryWolf: TMenuItem;
    ImageListSmall: TImageList;
    FileOpenDialogFolder: TFileOpenDialog;
    btnChooseSource: TButton;
    btnChooseDest: TButton;
    btnGo: TButton;
    ImageListLarge: TImageList;
    EditDestPath: TLabeledEdit;
    lblSupportTelltaleLink: TLinkLabel;
    lblByAuthorLink: TLinkLabel;
    TalesFromTheBorderlands1: TMenuItem;
    Menu_TalesFromBorderlands_Zer0Sum: TMenuItem;
    Menu_TalesFromBorderlands_AtlasMugged: TMenuItem;
    Menu_TalesFromBorderlands_CatchARide: TMenuItem;
    Menu_TalesFromBorderlands_EscapePlanBravo: TMenuItem;
    Menu_TalesFromBorderlands_TheVaultOfTheTraveler: TMenuItem;
    MenuOpenFile: TMenuItem;
    OpenDialogFile: TOpenDialog;
    GameOfThrones1: TMenuItem;
    Menu_GameOfThrones_TheIceDragon: TMenuItem;
    Menu_GameOfThrones_ANestOfVipers: TMenuItem;
    Menu_GameOfThrones_SonsOfWinter: TMenuItem;
    Menu_GameOfThrones_TheSwordInTheDarkness: TMenuItem;
    Menu_GameOfThrones_TheLostLords: TMenuItem;
    Menu_GameOfThrones_IronFromIce: TMenuItem;
    MinecraftStoryMode1: TMenuItem;
    Menu_Minecraft_TheOrderoftheStone: TMenuItem;
    Menu_Minecraft_AssemblyRequired: TMenuItem;
    Menu_Minecraft_TheLastPlaceYouLook: TMenuItem;
    Menu_Minecraft_ABlockAndAHardPlace: TMenuItem;
    Menu_Minecraft_OrderUp: TMenuItem;
    SamAndMax1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OpenPopupMenuHandler(Sender: TObject);
    procedure MenuOpenFolderClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure btnChooseSourceClick(Sender: TObject);
    procedure btnChooseDestClick(Sender: TObject);
    procedure lblSupportTelltaleLinkLinkClick(Sender: TObject;
      const Link: string; LinkType: TSysLinkType);
  private
    fChosenGame: TTelltaleGame;
    fMusicDumper: TTelltaleMusicDumper;
    procedure EnableControls(Value: boolean);
    procedure OnProgress(ProgressMax: integer; ProgressPos: integer);
    procedure OpenFolder;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.EnableControls(Value: boolean);
begin
  btnChooseSource.Enabled := Value;
  btnChooseDest.Enabled := Value;
  btnGo.Enabled := Value;
  EditSourcePath.Enabled := Value;
  EditDestPath.Enabled := Value;
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //Windows XP linklabel fixes
  if Win32MajorVersion < 6 then
  begin
    //XP doesnt support right alignment of link label and breaks bottom border when autosize on
    //Probably better to do this with panels and things but...its only for xp
    lblByAuthorLink.AutoSize := false;
    lblSupportTelltaleLink.AutoSize := false;
    lblSupportTelltaleLink.Alignment := taLeftJustify;
    lblSupportTelltaleLink.Left := 238;
  end;

  dlgBrowseforfolder.RootDirectory:=fdDesktopDirectory;
  dlgBrowseforfolder.RootDirectoryPath:=GetDesktopDirectoryFolder;
  EditDestPath.Text:=GetDesktopDirectoryFolder;
  frmMain.Caption:=strProgName + ' ' + strProgVersion;
  lblSupportTelltaleLink.Caption := strSupportTelltaleLink;
  lblByAuthorLink.Caption := strAuthorLink;
end;

procedure TfrmMain.OnProgress(ProgressMax, ProgressPos: integer);
begin
  Progressbar1.Max := ProgressMax;
  Progressbar1.Position := ProgressPos;
end;

procedure TfrmMain.OpenPopupMenuHandler(Sender: TObject);
var
  SenderName, strFolder: string;
begin
  SenderName := TMenuItem(Sender).Name;
  fChosenGame := UnknownGame; //Only need to know the game for latest games

  if SenderName = 'MenuOpenFile' then
  begin
    if OpenDialogFile.Execute = false then exit;
    EditSourcePath.Text := OpenDialogFile.FileName;
    EditSourcePath.EditLabel.Caption := 'Source file:';
    Exit;
  end
  else
  if SenderName = 'MenuOpenFolder' then
    strFolder:=''
  else
  if SenderName = 'Menu_CSI_DeadlyIntent' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_DeadlyIntent);

    dlgBrowseForFolder.Directory := strFolder;
    FileOpenDialogFolder.DefaultFolder := strFolder;

    MessageDlg(strCSIDeadlyIntent, mtInformation, [mbOk], 0);
  end
  else
  if SenderName = 'Menu_CSI_FatalConspiracy' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_FatalConspiracy);

    dlgBrowseForFolder.Directory := strFolder;
    FileOpenDialogFolder.DefaultFolder := strFolder;

    MessageDlg(strCSIFatalConspiracy, mtInformation, [mbOk], 0);
  end
  else
  begin
    SenderName := strAfter('Menu_', SenderName);
    if SenderName = '' then MessageDlg(strMissingMenu, mtError, [mbOk], 0);

    //fChosenGame only really used by newest .ttartch2 games
    fChosenGame := TTelltaleGame(GetEnumValue(TypeInfo(TTelltaleGame), SenderName));

    //Games that need the music param for GetTelltaleGamePath
    if (SenderName = 'CSI_3Dimensions') or
       (SenderName = 'CSI_HardEvidence') or
       (SenderName = 'SamAndMax_IceStationSanta') or
       (SenderName = 'SamAndMax_MoaiBetterBlues') or
       (SenderName = 'SamAndMax_NightOfTheRavingDead') or
       (SenderName = 'SamAndMax_ChariotsOfTheDogs') or
       (SenderName = 'SamAndMax_WhatsNewBeelzebub')
    then
      strFolder:=GetTelltaleGamePath(fChosenGame, Music)
    else
      strFolder:=GetTelltaleGamePath(fChosenGame);

  end;

  EditSourcePath.EditLabel.Caption := 'Source folder:';

  if DirectoryExists(strFolder) = false then
  begin
    MessageDlg(strGameNotFound, mtError, [mbOk], 0);
    EditSourcePath.Text:='';
  end
  else
    EditSourcePath.Text:=strFolder;
end;

procedure TfrmMain.MenuOpenFolderClick(Sender: TObject);
begin
  OpenFolder;
end;

procedure TfrmMain.lblSupportTelltaleLinkLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(0, 'Open', PChar(Link), '', nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.OpenFolder;
begin
  //Reset fChosenGame here - possible for this to get set if someone chooses a
  //game earlier and its path isnt found fChosenGame will still be set
  fChosenGame := UnknownGame;

  if Win32MajorVersion >= 6 then //Vista and above
  begin
    FileOpenDialogFolder.Title := strOpenDialogTitle;
    if FileOpenDialogFolder.Execute then
      editSourcePath.Text := FileOpenDialogFolder.FileName;
  end
  else
  begin
    dlgBrowseForFolder.Title := strOpenDialogTitle;
    if dlgBrowseForFolder.Execute then
      editSourcePath.Text := dlgBrowseForFolder.Directory;
  end;
end;

procedure TfrmMain.btnChooseSourceClick(Sender: TObject);
var
  popupPoint : TPoint;
begin
  popupPoint.X := btnChooseSource.Left;
  popupPoint.Y := btnChooseSource.Top + (btnChooseSource.Height div 2) ;
  popupPoint := ClientToScreen(popupPoint) ;

  btnChooseSource.DropDownMenu.Popup(popupPoint.X, popupPoint.Y);
end;

procedure TfrmMain.btnChooseDestClick(Sender: TObject);
begin
  if Win32MajorVersion >= 6 then //Vista and above
  begin
    FileOpenDialogFolder.Title := strSaveDialogTitle;
    if FileOpenDialogFolder.Execute then
      editDestPath.Text := FileOpenDialogFolder.FileName;
  end
  else
  begin
    dlgBrowseForFolder.Title := strSaveDialogTitle;
    if dlgBrowseForFolder.Execute then
      editDestPath.Text := dlgBrowseForFolder.Directory;
  end;
end;

procedure TfrmMain.btnGoClick(Sender: TObject);
var
  CopyCount: integer;
  AllFiles: TStringList;
  SoundTrack: TSoundTrackManager;
begin
  CopyCount:=0;

  if DirectoryExists(EditDestPath.Text)=false then
  begin
    MessageDlg(strInvalidFolder, mtError, [mbOk], 0);
    exit;
  end;

  if FileExists(EditSourcePath.Text) then //single file open
    fMusicDumper := TTelltaleMusicDumper.Create( EditDestPath.Text, fChosenGame, EditSourcePath.Text)
  else //folder open
    fMusicDumper := TTelltaleMusicDumper.Create(EditSourcePath.Text, EditDestPath.Text, fChosenGame);

  try
    try
      EnableControls(false);
      fMusicDumper.OnProgress := OnProgress;

      //Build a list of all the files in fBundle so the Soundtrack Manager can scan them
      AllFiles := TStringList.Create;
      try

        try
          fMusicDumper.GetListOfFilesInBundleWithoutExt(AllFiles);
          //Create the soundtrack manager so it can see if any valid ini files exist
          SoundTrack := TSoundTrackManager.Create(ExtractFilePath(Application.ExeName) + strSoundTrackDir, AllFiles);
          try
            if MessageDlg(strDumpSoundtrack, mtConfirmation, mbYesNo, 0) = mrYes then
              CopyCount := fMusicDumper.SaveFiles(Soundtrack)
            else
              CopyCount := fMusicDumper.SaveFiles;

          finally
            SoundTrack.Free;
          end;
        except on E: EInvalidIniFile do
          begin
            CopyCount := fMusicDumper.SaveFiles;
          end;
        end;

      finally
        AllFiles.Free;
      end;

    finally
      fMusicDumper.Free;
      EnableControls(true);
      Progressbar1.Position:=0;
    end;
  except on E: EMusicDumpError do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      EnableControls(true);
      Progressbar1.Position:=0;
    end;
  end;



  if CopyCount = 0 then
    MessageDlg(strNoFilesCreated, mtError, [mbOk], 0)
  else
    MessageDlg(strAllDone + inttostr(CopyCount) + strXFilesCreated, mtInformation, [mbOk], 0);
end;

end.
