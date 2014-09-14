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

unit formMain;

interface

uses
  Windows, Menus, Forms, ImgList, Controls, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, Classes, SysUtils, ShellApi,

  JvBaseDlg, JvBrowseFolder, JCLSysInfo,

  uTelltaleFuncs, uTelltaleMusicExtractorConst, uTelltaleMusicDumper,
  uSoundTrackManager;

type
  TfrmMain = class(TForm)
    ProgressBar1: TProgressBar;
    EditSourcePath: TLabeledEdit;
    dlgBrowseForFolder: TJvBrowseForFolderDialog;
    PopupMenuOpen: TPopupMenu;
    MenuItemOpenFolder: TMenuItem;
    N2: TMenuItem;
    Bone1: TMenuItem;
    MenuItemOpenBone1: TMenuItem;
    MenuItemOpenBone2: TMenuItem;
    CrimeSceneInvestigation1: TMenuItem;
    MenuItemOpenCSI: TMenuItem;
    MenuItemOpenCSIHardEvidence: TMenuItem;
    SamAndMaxSeason11: TMenuItem;
    MenuItemOpenCultureShock: TMenuItem;
    MenuItemOpenSituationComedy: TMenuItem;
    MenuItemOpenMoleMobMeatball: TMenuItem;
    MenuItemOpenAbeLincoln: TMenuItem;
    MenuItemOpenReality20: TMenuItem;
    MenuItemOpenBrightSideOfTheMoon: TMenuItem;
    SamAndMaxSeason21: TMenuItem;
    MenuItemOpenIceStationSanta: TMenuItem;
    MenuItemOpenMoaiBetterBlues: TMenuItem;
    MenuItemOpenNightOfTheRavingDead: TMenuItem;
    MenuItemOpenChariotsoftheDogs: TMenuItem;
    MenuItemOpenWhatsNewBeelzebub: TMenuItem;
    StrongBadSeason11: TMenuItem;
    MenuItemOpenStrongBadEP1: TMenuItem;
    MenuItemOpenStrongBadEP2: TMenuItem;
    MenuItemOpenStrongBadEP3: TMenuItem;
    MenuItemOpenStrongBadEP4: TMenuItem;
    MenuItemOpenStrongBadEP5: TMenuItem;
    MenuItemOpenTexas: TMenuItem;
    WallaceandGromitsGrandAdventures1: TMenuItem;
    MenuItemOpenWallaceEP4: TMenuItem;
    MenuItemOpenWallaceEP3: TMenuItem;
    MenuItemOpenWallaceEP2: TMenuItem;
    MenuItemOpenWallaceEP1: TMenuItem;
    TalesOfMonkeyIsland1: TMenuItem;
    MenuItemOpenMonkeyEP1: TMenuItem;
    MenuItemOpenMonkeyEP2: TMenuItem;
    MenuItemOpenMonkeyEP3: TMenuItem;
    MenuItemOpenMonkeyEP4: TMenuItem;
    MenuItemOpenMonkeyEP5: TMenuItem;
    MenuItemOpenCSIDeadlyIntent: TMenuItem;
    SamAndMaxSeason31: TMenuItem;
    MenuItemOpenSamAndMax305: TMenuItem;
    MenuItemOpenSamAndMax304: TMenuItem;
    MenuItemOpenSamAndMax303: TMenuItem;
    MenuItemOpenSamAndMax302: TMenuItem;
    MenuItemOpenSamAndMax301: TMenuItem;
    PuzzleAgent1: TMenuItem;
    MenuItemOpenPuzzleAgent101: TMenuItem;
    MenuItemOpenCSIFatalConspiracy: TMenuItem;
    MenuItemOpenPokerInventory: TMenuItem;
    BackToTheFuture2: TMenuItem;
    MenuItemOpenBTTF5: TMenuItem;
    MenuItemOpenBTTF4: TMenuItem;
    MenuItemOpenBTTF3: TMenuItem;
    MenuItemOpenBTTF2: TMenuItem;
    MenuItemOpenBTTF1: TMenuItem;
    HectorBadgeOfCarnage1: TMenuItem;
    MenuItemOpenHector101: TMenuItem;
    MenuItemOpenPuzzleAgent102: TMenuItem;
    MenuItemOpenHector102: TMenuItem;
    MenuItemOpenHector103: TMenuItem;
    JurassicParkTheGame: TMenuItem;
    MenuItemOpenJurassicParkEP4: TMenuItem;
    MenuItemOpenJurassicParkEP3: TMenuItem;
    MenuItemOpenJurassicParkEP2: TMenuItem;
    MenuItemOpenJurassicParkEP1: TMenuItem;
    heWalkingDead1: TMenuItem;
    MenuItemOpenWalkingDeadEP1: TMenuItem;
    MenuItemOpenLawAndOrderLegacies: TMenuItem;
    MenuItemOpenWalkingDeadEP2: TMenuItem;
    MenuItemOpenWalkingDeadEP3: TMenuItem;
    MenuItemOpenWalkingDeadEP4: TMenuItem;
    MenuItemOpenWalkingDeadEP5: TMenuItem;
    MenuPoker: TMenuItem;
    MenuItemOpenPoker2: TMenuItem;
    TheWolfAmongUs1: TMenuItem;
    MenuItemOpenWolfAmongUs1: TMenuItem;
    SeasonOne1: TMenuItem;
    SeasonTwo1: TMenuItem;
    MenuItemOpenWalkingDeadEP6: TMenuItem;
    MenuItemOpenWalkingDead_S2_E1: TMenuItem;
    MenuItemOpenWalkingDead_S2_E2: TMenuItem;
    MenuItemOpenWalkingDead_S2_E3: TMenuItem;
    MenuItemOpenWalkingDead_S2_E4: TMenuItem;
    MenuItemOpenWalkingDead_S2_E5: TMenuItem;
    MenuItemOpenWolfAmongUs2: TMenuItem;
    MenuItemOpenWolfAmongUs3: TMenuItem;
    MenuItemOpenWolfAmongUs4: TMenuItem;
    MenuItemOpenWolfAmongUs5: TMenuItem;
    ImageListSmall: TImageList;
    FileOpenDialog1: TFileOpenDialog;
    btnChooseSource: TButton;
    btnChooseDest: TButton;
    btnGo: TButton;
    ImageListLarge: TImageList;
    EditDestPath: TLabeledEdit;
    lblSupportTelltaleLink: TLinkLabel;
    lblByAuthorLink: TLinkLabel;
    procedure FormCreate(Sender: TObject);
    procedure OpenPopupMenuHandler(Sender: TObject);
    procedure MenuItemOpenFolderClick(Sender: TObject);
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
  lblByAuthorLink.Caption := strAuthorLink
end;

{*****************************Popup Menu Handlers*****************************}
procedure TfrmMain.OnProgress(ProgressMax, ProgressPos: integer);
begin
  Progressbar1.Max := ProgressMax;
  Progressbar1.Position := ProgressPos;
end;

procedure TfrmMain.OpenPopupMenuHandler(Sender: TObject);
var
  SenderName, strFolder: string;
begin
  SenderName := tmenuitem(sender).Name;
  fChosenGame := UnknownGame; //Only need to know the game for latest games

  if SenderName = 'MenuItemOpenFolder' then
    strFolder:=''
  else
  if SenderName = 'MenuItemOpenBone1' then
  begin
    strFolder:=GetTelltaleGamePath(Bone_Boneville);
  end
  else
  if SenderName = 'MenuItemOpenBone2' then
  begin
    strFolder:=GetTelltaleGamePath(Bone_CowRace);
  end
  else
  if SenderName = 'MenuItemOpenCSI' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_3Dimensions, Music);
  end
  else
  if SenderName = 'MenuItemOpenCSIHardEvidence' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_HardEvidence, Music);
  end
  else
  if SenderName = 'MenuItemOpenCSIDeadlyIntent' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_DeadlyIntent);

    dlgBrowseForFolder.Directory := strFolder;
    FileOpenDialog1.DefaultFolder := strFolder;

    ShowMessage(strCSIDeadlyIntent);
  end
  else
  if SenderName = 'MenuItemOpenCultureShock' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_CultureShock);
  end
  else
  if SenderName = 'MenuItemOpenSituationComedy' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_SituationComedy);
  end
  else
  if SenderName = 'MenuItemOpenMoleMobMeatball' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_MoleMobMeatball);
  end
  else
  if SenderName = 'MenuItemOpenAbeLincoln' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_AbeLincoln);
  end
  else
  if SenderName = 'MenuItemOpenReality20' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_Reality20);
  end
  else
  if SenderName = 'MenuItemOpenBrightSideOfTheMoon' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_BrightSideMoon);
  end
  else
  if SenderName = 'MenuItemOpenIceStationSanta' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_IceStationSanta, Music);
  end
  else
  if SenderName = 'MenuItemOpenMoaiBetterBlues' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_MoaiBetterBlues, Music);
  end
  else
  if SenderName = 'MenuItemOpenNightOfTheRavingDead' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_NightOfTheRavingDead, Music);
  end
  else
  if SenderName = 'MenuItemOpenChariotsoftheDogs' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_ChariotsOfTheDogs, Music);
  end
  else
  if SenderName = 'MenuItemOpenWhatsNewBeelzebub' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_WhatsNewBeelzebub, Music);
  end
  else
  if SenderName = 'MenuItemOpenStrongBadEP1' then
  begin
    strFolder:=GetTelltaleGamePath(StrongBad_HomestarRuiner);
  end
  else
  if SenderName = 'MenuItemOpenStrongBadEP2' then
  begin
    strFolder:=GetTelltaleGamePath(StrongBad_StrongBadiaTheFree);
  end
  else
  if SenderName = 'MenuItemOpenStrongBadEP3' then
  begin
    strFolder:=GetTelltaleGamePath(StrongBad_BaddestOfTheBands);
  end
  else
  if SenderName = 'MenuItemOpenStrongBadEP4' then
  begin
    strFolder:=GetTelltaleGamePath(StrongBad_Daneresque3);
  end
  else
  if SenderName = 'MenuItemOpenStrongBadEP5' then
  begin
    strFolder:=GetTelltaleGamePath(StrongBad_8BitIsEnough);
  end
  else
  if SenderName = 'MenuItemOpenTexas' then
  begin
    strFolder:=GetTelltaleGamePath(Texas_Holdem);
  end
  else
  if SenderName = 'MenuItemOpenWallaceEP1' then
  begin
    strFolder:=GetTelltaleGamePath(WallaceAndGromit_FrightOfTheBumblebees);
  end
  else
  if SenderName = 'MenuItemOpenWallaceEP2' then
  begin
    strFolder:=GetTelltaleGamePath(WallaceAndGromit_TheLastResort);
  end
  else
  if SenderName = 'MenuItemOpenWallaceEP3' then
  begin
    strFolder:=GetTelltaleGamePath(WallaceAndGromit_Muzzled);
  end
  else
  if SenderName = 'MenuItemOpenWallaceEP4' then
  begin
    strFolder:=GetTelltaleGamePath(WallaceAndGromit_TheBogeyMan);
  end
  else
  if SenderName = 'MenuItemOpenMonkeyEP1' then
  begin
    strFolder:=GetTelltaleGamePath(Monkey_ScreamingNarwhal);
  end
  else
  if SenderName = 'MenuItemOpenMonkeyEP2' then
  begin
    strFolder:=GetTelltaleGamePath(Monkey_SpinnerCay);
  end
  else
  if SenderName = 'MenuItemOpenMonkeyEP3' then
  begin
    strFolder:=GetTelltaleGamePath(Monkey_LairLeviathan);
  end
  else
  if SenderName = 'MenuItemOpenMonkeyEP4' then
  begin
    strFolder:=GetTelltaleGamePath(Monkey_TrialExecution);
  end
  else
  if SenderName = 'MenuItemOpenMonkeyEP5' then
  begin
    strFolder:=GetTelltaleGamePath(Monkey_PirateGod);
  end
  else
  if SenderName = 'MenuItemOpenSamAndMax301' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_PenalZone);
  end
  else
  if SenderName = 'MenuItemOpenSamAndMax302' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_TombOfSammunMak);
  end
  else
  if SenderName = 'MenuItemOpenSamAndMax303' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_TheyStoleMaxsBrain);
  end
  else
  if SenderName = 'MenuItemOpenSamAndMax304' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_BeyondAlleyOfDolls);
  end
  else
  if SenderName = 'MenuItemOpenSamAndMax305' then
  begin
    strFolder:=GetTelltaleGamePath(SamAndMax_CityThatDaresNotSleep);
  end
  else
  if SenderName = 'MenuItemOpenPuzzleAgent101' then
  begin
    strFolder:=GetTelltaleGamePath(PuzzleAgent_Scoggins);
  end
  else
  if SenderName = 'MenuItemOpenPuzzleAgent102' then
  begin
    strFolder:=GetTelltaleGamePath(PuzzleAgent_2);
  end
  else
  if SenderName = 'MenuItemOpenCSIFatalConspiracy' then
  begin
    strFolder:=GetTelltaleGamePath(CSI_FatalConspiracy);

    dlgBrowseForFolder.Directory := strFolder;
    FileOpenDialog1.DefaultFolder := strFolder;

    ShowMessage(strCSIFatalConspiracy);
  end
  else
  if SenderName = 'MenuItemOpenPokerInventory' then
  begin
    strFolder:=GetTelltaleGamePath(PokerNight_Inventory);
  end
  else
  if SenderName = 'MenuItemOpenPoker2' then
  begin
    strFolder:=GetTelltaleGamePath(PokerNight_2);
  end
  else
  if SenderName = 'MenuItemOpenBTTF1' then
  begin
    strFolder:=GetTelltaleGamePath(BackToTheFuture_ItsAboutTime);
  end
  else
  if SenderName = 'MenuItemOpenBTTF2' then
  begin
    strFolder:=GetTelltaleGamePath(BackToTheFuture_GetTannen);
  end
  else
  if SenderName = 'MenuItemOpenBTTF3' then
  begin
    strFolder:=GetTelltaleGamePath(BackToTheFuture_CitizenBrown);
  end
  else
  if SenderName = 'MenuItemOpenBTTF4' then
  begin
    strFolder:=GetTelltaleGamePath(BackToTheFuture_DoubleVisions);
  end
  else
  if SenderName = 'MenuItemOpenBTTF5' then
  begin
    strFolder:=GetTelltaleGamePath(BackToTheFuture_OutaTime);
  end
  else
  if SenderName = 'MenuItemOpenHector101' then
  begin
    strFolder:=GetTelltaleGamePath(Hector_WeNegotiateWithTerrorists);
  end
  else
  if SenderName = 'MenuItemOpenHector102' then
  begin
    strFolder:=GetTelltaleGamePath(Hector_SenselessActsOfJustice);
  end
  else
  if SenderName = 'MenuItemOpenHector103' then
  begin
    strFolder:=GetTelltaleGamePath(Hector_BeyondReasonableDoom);
  end
  else
  if SenderName = 'MenuItemOpenJurassicParkEP1' then
  begin
    strFolder:=GetTelltaleGamePath(JurassicPark_EP1);
  end
  else
  if SenderName = 'MenuItemOpenJurassicParkEP2' then
  begin
    strFolder:=GetTelltaleGamePath(JurassicPark_EP2);
  end
  else
  if SenderName = 'MenuItemOpenJurassicParkEP3' then
  begin
    strFolder:=GetTelltaleGamePath(JurassicPark_EP3);
  end
  else
  if SenderName = 'MenuItemOpenJurassicParkEP4' then
  begin
    strFolder:=GetTelltaleGamePath(JurassicPark_EP4);
  end
  else
  if SenderName = 'MenuItemOpenLawAndOrderLegacies' then
  begin
    strFolder:=GetTelltaleGamePath(LawAndOrder_Legacies);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP1' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_ANewDay);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP2' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_StarvedForHelp);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP3' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_LongRoadAhead);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP4' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_AroundEveryCorner);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP5' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_NoTimeLeft);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDeadEP6' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_400Days);
  end
  else
  if SenderName = 'MenuItemOpenWalkingDead_S2_E1' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_S2_AllThatRemains);
    fChosenGame := WalkingDead_S2_AllThatRemains;
  end
  else
  if SenderName = 'MenuItemOpenWalkingDead_S2_E2' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_S2_AHouseDivided);
    fChosenGame := WalkingDead_S2_AHouseDivided;
  end
  else
  if SenderName = 'MenuItemOpenWalkingDead_S2_E3' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_S2_InHarmsWay);
    fChosenGame := WalkingDead_S2_InHarmsWay;
  end
  else
  if SenderName = 'MenuItemOpenWalkingDead_S2_E4' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_S2_AmidTheRuins);
    fChosenGame := WalkingDead_S2_AmidTheRuins;
  end
  else
  if SenderName = 'MenuItemOpenWalkingDead_S2_E5' then
  begin
    strFolder:=GetTelltaleGamePath(WalkingDead_S2_NoGoingBack);
    fChosenGame := WalkingDead_S2_NoGoingBack;
  end
  else
  if SenderName = 'MenuItemOpenWolfAmongUs1' then
  begin
    strFolder:=GetTelltaleGamePath(WolfAmongUs_Faith);
    fChosenGame := WolfAmongUs_Faith;
  end
  else
  if SenderName = 'MenuItemOpenWolfAmongUs2' then
  begin
    strFolder:=GetTelltaleGamePath(WolfAmongUs_SmokeAndMirrors);
    fChosenGame := WolfAmongUs_SmokeAndMirrors;
  end
  else
  if SenderName = 'MenuItemOpenWolfAmongUs3' then
  begin
    strFolder:=GetTelltaleGamePath(WolfAmongUs_ACrookedMile);
    fChosenGame := WolfAmongUs_ACrookedMile;
  end
  else
  if SenderName = 'MenuItemOpenWolfAmongUs4' then
  begin
    strFolder:=GetTelltaleGamePath(WolfAmongUs_InSheepsClothing);
    fChosenGame := WolfAmongUs_InSheepsClothing;
  end
  else
  if SenderName = 'MenuItemOpenWolfAmongUs5' then
  begin
    strFolder:=GetTelltaleGamePath(WolfAmongUs_CryWolf);
    fChosenGame := WolfAmongUs_CryWolf;
  end;

  if directoryexists(strFolder) = false then
  begin
    ShowMessage(strGameNotFound);
    EditSourcePath.Text:='';
  end
  else
    EditSourcePath.Text:=strFolder;

end;


procedure TfrmMain.MenuItemOpenFolderClick(Sender: TObject);
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
  if Win32MajorVersion >= 6 then //Vista and above
  begin
    FileOpenDialog1.Title := strOpenDialogTitle;
    if FileOpenDialog1.Execute then
      editSourcePath.Text := FileOpenDialog1.FileName;
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
    FileOpenDialog1.Title := strSaveDialogTitle;
    if FileOpenDialog1.Execute then
      editDestPath.Text := FileOpenDialog1.FileName;
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
    ShowMessage(strInvalidFolder);
    exit;
  end;

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
      ShowMessage(E.Message);
      EnableControls(true);
      Progressbar1.Position:=0;
    end;
  end;



  if CopyCount = 0 then
    ShowMessage(strNoFilesCreated)
  else
    ShowMessage(strAllDone + inttostr(CopyCount) + strXFilesCreated);
end;

end.
