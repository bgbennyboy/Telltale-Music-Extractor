object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 360
  ClientWidth = 323
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  OnCreate = FormCreate
  DesignSize = (
    323
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 345
    Width = 323
    Height = 15
    Align = alBottom
    TabOrder = 5
  end
  object EditSourcePath: TLabeledEdit
    Left = 8
    Top = 237
    Width = 307
    Height = 21
    AutoSize = False
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Source folder:'
    ReadOnly = True
    TabOrder = 3
  end
  object btnChooseSource: TButton
    Left = 8
    Top = 8
    Width = 307
    Height = 65
    Caption = 'Choose a game'
    CommandLinkHint = 'Or select a folder'
    DisabledImageIndex = 1
    DropDownMenu = PopupMenuOpen
    HotImageIndex = 2
    ImageIndex = 0
    Images = ImageListLarge
    Style = bsCommandLink
    TabOrder = 0
    WordWrap = True
    OnClick = btnChooseSourceClick
  end
  object btnChooseDest: TButton
    Left = 8
    Top = 79
    Width = 307
    Height = 65
    Caption = 'Save to'
    CommandLinkHint = 'Select a destination folder for the music'
    DisabledImageIndex = 4
    HotImageIndex = 5
    ImageIndex = 3
    Images = ImageListLarge
    Style = bsCommandLink
    TabOrder = 1
    WordWrap = True
    OnClick = btnChooseDestClick
  end
  object btnGo: TButton
    Left = 8
    Top = 150
    Width = 307
    Height = 65
    Caption = 'Go!'
    CommandLinkHint = 'Begin dumping the music'
    DisabledImageIndex = 7
    HotImageIndex = 8
    ImageIndex = 6
    Images = ImageListLarge
    Style = bsCommandLink
    TabOrder = 2
    WordWrap = True
    OnClick = btnGoClick
  end
  object EditDestPath: TLabeledEdit
    Left = 8
    Top = 280
    Width = 307
    Height = 21
    AutoSize = False
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'Destination folder:'
    ReadOnly = True
    TabOrder = 4
  end
  object lblSupportTelltaleLink: TLinkLabel
    Left = 234
    Top = 307
    Width = 81
    Height = 30
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 
      'Support Telltale'#13'<a href="http://www.telltalegames.com/store/">B' +
      'uy their games</a>'
    TabOrder = 6
    OnLinkClick = lblSupportTelltaleLinkLinkClick
  end
  object lblByAuthorLink: TLinkLabel
    Left = 8
    Top = 307
    Width = 124
    Height = 30
    Anchors = [akTop, akRight]
    Caption = 
      'By Bennyboy'#13'<a href="http://quickandeasysoftware.net">Quick and ' +
      'Easy Software</a>'
    TabOrder = 7
    OnLinkClick = lblSupportTelltaleLinkLinkClick
  end
  object dlgBrowseForFolder: TJvBrowseForFolderDialog
    RootDirectory = fdDesktopDirectory
    Title = 'Choose a folder with .aud .ttarch  or .ttarch2 files'
    Left = 40
    Top = 432
  end
  object PopupMenuOpen: TPopupMenu
    Images = ImageListSmall
    Left = 136
    Top = 432
    object MenuOpenFolder: TMenuItem
      Caption = 'Open Folder'
      ImageIndex = 0
      OnClick = MenuOpenFolderClick
    end
    object MenuOpenFile: TMenuItem
      Caption = 'Open File'
      ImageIndex = 17
      OnClick = OpenPopupMenuHandler
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object BackToTheFuture2: TMenuItem
      Caption = 'Back To The Future'
      ImageIndex = 9
      object Menu_BackToTheFuture_ItsAboutTime: TMenuItem
        Caption = 'Back To The Future - It'#39's About Time'
        ImageIndex = 9
        OnClick = OpenPopupMenuHandler
      end
      object Menu_BackToTheFuture_GetTannen: TMenuItem
        Caption = 'Back To The Future - Get Tannen!'
        ImageIndex = 9
        OnClick = OpenPopupMenuHandler
      end
      object Menu_BackToTheFuture_CitizenBrown: TMenuItem
        Caption = 'Back To The Future - Citizen Brown'
        ImageIndex = 9
        OnClick = OpenPopupMenuHandler
      end
      object Menu_BackToTheFuture_DoubleVisions: TMenuItem
        Caption = 'Back To The Future - Double Visions'
        ImageIndex = 9
        OnClick = OpenPopupMenuHandler
      end
      object Menu_BackToTheFuture_OutaTime: TMenuItem
        Caption = 'Back To The Future - Outa Time'
        ImageIndex = 9
        OnClick = OpenPopupMenuHandler
      end
    end
    object Batman: TMenuItem
      Caption = 'Batman'
      ImageIndex = 8
      object Menu_Batman_RealmOfShadows: TMenuItem
        Caption = 'Realm of Shadows'
        ImageIndex = 8
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Batman_ChildrenOfArkham: TMenuItem
        Caption = 'Children of Arkham'
        ImageIndex = 8
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Batman_NewWorldOrder: TMenuItem
        Caption = 'New World Order'
        ImageIndex = 8
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Batman_GuardianOfGotham: TMenuItem
        Caption = 'Guardian of Gotham'
        ImageIndex = 8
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Batman_CityOfLights: TMenuItem
        Caption = 'City of Lights'
        ImageIndex = 8
        OnClick = OpenPopupMenuHandler
      end
    end
    object Bone1: TMenuItem
      Caption = 'Bone'
      ImageIndex = 1
      object Menu_Bone_Boneville: TMenuItem
        Caption = 'Bone: Out From Boneville'
        ImageIndex = 1
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Bone_CowRace: TMenuItem
        Caption = 'Bone: The Great Cow Race'
        ImageIndex = 1
        OnClick = OpenPopupMenuHandler
      end
    end
    object CrimeSceneInvestigation1: TMenuItem
      Caption = 'Crime Scene Investigation'
      ImageIndex = 5
      object Menu_CSI_3Dimensions: TMenuItem
        Caption = 'CSI: 3 Dimensions of Murder'
        ImageIndex = 5
        OnClick = OpenPopupMenuHandler
      end
      object Menu_CSI_HardEvidence: TMenuItem
        Caption = 'CSI: Hard Evidence'
        ImageIndex = 5
        OnClick = OpenPopupMenuHandler
      end
      object Menu_CSI_DeadlyIntent: TMenuItem
        Caption = 'CSI: Deadly Intent'
        ImageIndex = 5
        OnClick = OpenPopupMenuHandler
      end
      object Menu_CSI_FatalConspiracy: TMenuItem
        Caption = 'CSI: Fatal Conspiracy'
        ImageIndex = 5
        OnClick = OpenPopupMenuHandler
      end
    end
    object GameOfThrones1: TMenuItem
      Caption = 'Game Of Thrones'
      ImageIndex = 16
      object Menu_GameOfThrones_IronFromIce: TMenuItem
        Caption = 'Iron From Ice'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
      object Menu_GameOfThrones_TheLostLords: TMenuItem
        Caption = 'The Lost Lords'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
      object Menu_GameOfThrones_TheSwordInTheDarkness: TMenuItem
        Caption = 'The Sword in the Darkness'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
      object Menu_GameOfThrones_SonsOfWinter: TMenuItem
        Caption = 'Sons of Winter'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
      object Menu_GameOfThrones_ANestOfVipers: TMenuItem
        Caption = 'A Nest of Vipers'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
      object Menu_GameOfThrones_TheIceDragon: TMenuItem
        Caption = 'The Ice Dragon'
        ImageIndex = 16
        OnClick = OpenPopupMenuHandler
      end
    end
    object HectorBadgeOfCarnage1: TMenuItem
      Caption = 'Hector: Badge Of Carnage'
      ImageIndex = 10
      object Menu_Hector_WeNegotiateWithTerrorists: TMenuItem
        Caption = 'We Negotiate with Terrorists'
        ImageIndex = 10
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Hector_SenselessActsOfJustice: TMenuItem
        Caption = 'Senseless Acts Of Justice'
        ImageIndex = 10
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Hector_BeyondReasonableDoom: TMenuItem
        Caption = 'Beyond Reasonable Doom'
        ImageIndex = 10
        OnClick = OpenPopupMenuHandler
      end
    end
    object JurassicParkTheGame: TMenuItem
      Caption = 'Jurassic Park The Game'
      ImageIndex = 11
      object Menu_JurassicPark_EP1: TMenuItem
        Caption = 'Jurassic Park: Episode 1'
        ImageIndex = 11
        OnClick = OpenPopupMenuHandler
      end
      object Menu_JurassicPark_EP2: TMenuItem
        Caption = 'Jurassic Park: Episode 2'
        ImageIndex = 11
        OnClick = OpenPopupMenuHandler
      end
      object Menu_JurassicPark_EP3: TMenuItem
        Caption = 'Jurassic Park: Episode 3'
        ImageIndex = 11
        OnClick = OpenPopupMenuHandler
      end
      object Menu_JurassicPark_EP4: TMenuItem
        Caption = 'Jurassic Park: Episode 4'
        ImageIndex = 11
        OnClick = OpenPopupMenuHandler
      end
    end
    object MinecraftStoryMode1: TMenuItem
      Caption = 'Minecraft: Story Mode'
      ImageIndex = 18
      object Menu_Minecraft_TheOrderoftheStone: TMenuItem
        Caption = 'The Order of the Stone'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_AssemblyRequired: TMenuItem
        Caption = 'Assembly Required'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_TheLastPlaceYouLook: TMenuItem
        Caption = 'The Last Place You Look'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_ABlockAndAHardPlace: TMenuItem
        Caption = 'A Block and a Hard Place'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_OrderUp: TMenuItem
        Caption = 'Order Up!'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_APortalToMystery: TMenuItem
        Caption = 'A Portal To Mystery'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_AccessDenied: TMenuItem
        Caption = 'Access Denied'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Minecraft_AJourneysEnd: TMenuItem
        Caption = 'A Journey'#39's End'
        ImageIndex = 18
        OnClick = OpenPopupMenuHandler
      end
    end
    object Menu_LawAndOrder_Legacies: TMenuItem
      Caption = 'Law && Order: Legacies'
      ImageIndex = 5
      OnClick = OpenPopupMenuHandler
    end
    object MenuPoker: TMenuItem
      Caption = 'Poker Night'
      ImageIndex = 4
      object Menu_PokerNight_Inventory: TMenuItem
        Caption = 'Poker Night At The Inventory'
        ImageIndex = 4
        OnClick = OpenPopupMenuHandler
      end
      object Menu_PokerNight_2: TMenuItem
        Caption = 'Poker Night 2'
        ImageIndex = 4
        OnClick = OpenPopupMenuHandler
      end
    end
    object PuzzleAgent1: TMenuItem
      Caption = 'Puzzle Agent'
      ImageIndex = 19
      object Menu_PuzzleAgent_Scoggins: TMenuItem
        Caption = 'The Mystery of Scoggins'
        ImageIndex = 19
        OnClick = OpenPopupMenuHandler
      end
      object Menu_PuzzleAgent_2: TMenuItem
        Caption = 'Puzzle Agent 2'
        ImageIndex = 19
        OnClick = OpenPopupMenuHandler
      end
    end
    object SamAndMax1: TMenuItem
      Caption = 'Sam And Max'
      ImageIndex = 3
      object SamAndMaxSeason11: TMenuItem
        Caption = 'Season 1'
        ImageIndex = 3
        object Menu_SamAndMax_CultureShock: TMenuItem
          Caption = 'Culture Shock'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_SituationComedy: TMenuItem
          Caption = 'Situation Comedy'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_MoleMobMeatball: TMenuItem
          Caption = 'The Mole, the Mob and the Meatball'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_AbeLincoln: TMenuItem
          Caption = 'Abe Lincoln Must Die!'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_Reality20: TMenuItem
          Caption = 'Reality 2.0'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_BrightSideMoon: TMenuItem
          Caption = 'Bright Side Of The Moon'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
      end
      object SamAndMaxSeason21: TMenuItem
        Caption = 'Season 2'
        ImageIndex = 3
        object Menu_SamAndMax_IceStationSanta: TMenuItem
          Caption = 'Ice Station Santa'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_MoaiBetterBlues: TMenuItem
          Caption = 'Moai Better Blues'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_NightOfTheRavingDead: TMenuItem
          Caption = 'Night Of The Raving Dead'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_ChariotsOfTheDogs: TMenuItem
          Caption = 'Chariots of the Dogs'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_WhatsNewBeelzebub: TMenuItem
          Caption = 'What'#39's New Beelzebub'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
      end
      object SamAndMaxSeason31: TMenuItem
        Caption = 'Season 3'
        ImageIndex = 3
        object Menu_SamAndMax_PenalZone: TMenuItem
          Caption = 'The Penal Zone'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_TombOfSammunMak: TMenuItem
          Caption = 'The Tomb of Sammun-Mak'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_TheyStoleMaxsBrain: TMenuItem
          Caption = 'They Stole Max'#39's Brain!'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_BeyondAlleyOfDolls: TMenuItem
          Caption = 'Beyond the Alley of the Dolls'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
        object Menu_SamAndMax_CityThatDaresNotSleep: TMenuItem
          Caption = 'The City That Dares Not Sleep'
          ImageIndex = 3
          OnClick = OpenPopupMenuHandler
        end
      end
    end
    object StrongBadSeason11: TMenuItem
      Caption = 'Strong Bad'
      ImageIndex = 2
      object Menu_StrongBad_HomestarRuiner: TMenuItem
        Caption = 'Homestar Ruiner'
        ImageIndex = 2
        OnClick = OpenPopupMenuHandler
      end
      object Menu_StrongBad_StrongBadiaTheFree: TMenuItem
        Caption = 'Strong Badia The Free'
        ImageIndex = 2
        OnClick = OpenPopupMenuHandler
      end
      object Menu_StrongBad_BaddestOfTheBands: TMenuItem
        Caption = 'Baddest Of The Bands'
        ImageIndex = 2
        OnClick = OpenPopupMenuHandler
      end
      object Menu_StrongBad_Daneresque3: TMenuItem
        Caption = 'Dangeresque 3'
        ImageIndex = 2
        OnClick = OpenPopupMenuHandler
      end
      object Menu_StrongBad_8BitIsEnough: TMenuItem
        Caption = '8-Bit Is Enough'
        ImageIndex = 2
        OnClick = OpenPopupMenuHandler
      end
    end
    object TalesFromTheBorderlands1: TMenuItem
      Caption = 'Tales From The Borderlands'
      ImageIndex = 15
      object Menu_TalesFromBorderlands_Zer0Sum: TMenuItem
        Caption = 'Zer0 Sum'
        ImageIndex = 15
        OnClick = OpenPopupMenuHandler
      end
      object Menu_TalesFromBorderlands_AtlasMugged: TMenuItem
        Caption = 'Atlas Mugged'
        ImageIndex = 15
        OnClick = OpenPopupMenuHandler
      end
      object Menu_TalesFromBorderlands_CatchARide: TMenuItem
        Caption = 'Catch A Ride'
        ImageIndex = 15
        OnClick = OpenPopupMenuHandler
      end
      object Menu_TalesFromBorderlands_EscapePlanBravo: TMenuItem
        Caption = 'Escape Plan Bravo'
        ImageIndex = 15
        OnClick = OpenPopupMenuHandler
      end
      object Menu_TalesFromBorderlands_TheVaultOfTheTraveler: TMenuItem
        Caption = 'The Vault of the Traveler'
        ImageIndex = 15
        OnClick = OpenPopupMenuHandler
      end
    end
    object TalesOfMonkeyIsland1: TMenuItem
      Caption = 'Tales Of Monkey Island'
      ImageIndex = 7
      object Menu_Monkey_ScreamingNarwhal: TMenuItem
        Caption = 'Launch of the Screaming Narwhal'
        ImageIndex = 7
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Monkey_SpinnerCay: TMenuItem
        Caption = 'The Siege of Spinner Cay'
        ImageIndex = 7
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Monkey_LairLeviathan: TMenuItem
        Caption = 'Lair of the Leviathan'
        ImageIndex = 7
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Monkey_TrialExecution: TMenuItem
        Caption = 'The Trial and Execution of Guybrush Threepwood'
        ImageIndex = 7
        OnClick = OpenPopupMenuHandler
      end
      object Menu_Monkey_PirateGod: TMenuItem
        Caption = 'Rise of the Pirate God'
        ImageIndex = 7
        OnClick = OpenPopupMenuHandler
      end
    end
    object Menu_Texas_Holdem: TMenuItem
      Caption = 'Telltale Texas Hold'#39'em'
      ImageIndex = 4
      OnClick = OpenPopupMenuHandler
    end
    object heWalkingDead1: TMenuItem
      Caption = 'The Walking Dead'
      ImageIndex = 12
      object SeasonOne1: TMenuItem
        Caption = 'Season One'
        ImageIndex = 12
        object Menu_WalkingDead_ANewDay: TMenuItem
          Caption = 'The Walking Dead: A New Day'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_StarvedForHelp: TMenuItem
          Caption = 'The Walking Dead: Starved For Help'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_LongRoadAhead: TMenuItem
          Caption = 'The Walking Dead: Long Road Ahead'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_AroundEveryCorner: TMenuItem
          Caption = 'The Walking Dead: Around Every Corner'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_NoTimeLeft: TMenuItem
          Caption = 'The Walking Dead: No Time Left'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_400Days: TMenuItem
          Caption = 'The Walking Dead: 400 Days (DLC)'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
      end
      object SeasonTwo1: TMenuItem
        Caption = 'Season Two'
        ImageIndex = 12
        object Menu_WalkingDead_S2_AllThatRemains: TMenuItem
          Caption = 'The Walking Dead: All That Remains'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_S2_AHouseDivided: TMenuItem
          Caption = 'The Walking Dead: A House Divided'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_S2_InHarmsWay: TMenuItem
          Caption = 'The Walking Dead: In Harm'#39's Way'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_S2_AmidTheRuins: TMenuItem
          Caption = 'The Walking Dead: Amid The Ruins'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_S2_NoGoingBack: TMenuItem
          Caption = 'The Walking Dead: No Going Back'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
      end
      object Michonne1: TMenuItem
        Caption = 'Michonne'
        ImageIndex = 12
        object Menu_WalkingDead_Michonne_InTooDeep: TMenuItem
          Caption = 'In Too Deep'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_Michonne_GiveNoShelter: TMenuItem
          Caption = 'Give No Shelter'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
        object Menu_WalkingDead_Michonne_WhatWeDeserve: TMenuItem
          Caption = 'What We Deserve'
          ImageIndex = 12
          OnClick = OpenPopupMenuHandler
        end
      end
    end
    object TheWolfAmongUs1: TMenuItem
      Caption = 'The Wolf Among Us'
      ImageIndex = 13
      object Menu_WolfAmongUs_Faith: TMenuItem
        Caption = 'Episode 1: Faith'
        ImageIndex = 13
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WolfAmongUs_SmokeAndMirrors: TMenuItem
        Caption = 'Episode 2: Smoke And Mirrors'
        ImageIndex = 13
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WolfAmongUs_ACrookedMile: TMenuItem
        Caption = 'Episode 3: A Crooked Mile'
        ImageIndex = 13
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WolfAmongUs_InSheepsClothing: TMenuItem
        Caption = 'Episode 4: In Sheep'#39's Clothing'
        ImageIndex = 13
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WolfAmongUs_CryWolf: TMenuItem
        Caption = 'Episode 5: Cry Wolf'
        ImageIndex = 13
        OnClick = OpenPopupMenuHandler
      end
    end
    object WallaceandGromitsGrandAdventures1: TMenuItem
      Caption = 'Wallace and Gromits Grand Adventures'
      ImageIndex = 6
      object Menu_WallaceAndGromit_FrightOfTheBumblebees: TMenuItem
        Caption = 'Fright Of The Bumblebees'
        ImageIndex = 6
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WallaceAndGromit_TheLastResort: TMenuItem
        Caption = 'The Last Resort'
        ImageIndex = 6
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WallaceAndGromit_Muzzled: TMenuItem
        Caption = 'Muzzled!'
        ImageIndex = 6
        OnClick = OpenPopupMenuHandler
      end
      object Menu_WallaceAndGromit_TheBogeyMan: TMenuItem
        Caption = 'The Bogey Man'
        ImageIndex = 6
        OnClick = OpenPopupMenuHandler
      end
    end
  end
  object ImageListSmall: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 224
    Top = 432
    Bitmap = {
      494C010114006000380010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      000300000000000000000000000000000000000000000001011515323E8C1E46
      56A5286076C241A4CBFF41A4CBFF020708430000011600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000041A4CBFF41A4CBFF41A4
      CBFF41A4CBFF56D7F3FF41A4CBFF398FB1FF3D92B4FF41A4CBFF41A4CBFF41A4
      CBFF2A6981CC0A1A206600000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F01000227040009520C0118810E011D8F0800106C0200053B0000
      01200000000D0000000200000000000000000000000000000000000000000000
      00000000003D0D0700A8432404E6824709FD94510AFF6A3B08F6221302D00302
      0087000000270000000700000000000000000000000041A4CBFF62DBF4FF60DA
      F4FF5EDAF3FF5CD9F3FF41A4CBFF4DADC6FF4FB0C9FF58D0EAFF55D0EAFF53CF
      EAFF4DC6E3FF2A6981CC00000000000000000000000000000000000000000000
      00000000003D0D0009A8470032E68D0061FDA0006FFF740050F625001AD00400
      0287000000270000000700000000000000000000000000000000000000000000
      00000200053D190133A8420484E66406C9FD6C06DAFF5905B1F62D035BD00E01
      1D87010002270000000700000000000000000000000000000000000000000000
      0044412404E1D57510FFF0A34FFFF2AD63FFF2B069FFF2AC60FFEE9534FF9552
      0BFF120A01AD0000001400000000000000000000000041A4CBFF6BDEF4FF68DD
      F5FF66DCF4FF63DCF4FF41A4CBFF50AEC6FF51B0C9FF5DD1EBFF59D1EAFF56D0
      EAFFD3A548FF41A4CBFF00000000000000000000000000000000000000000100
      0044470031E1E700A1FFFF40C6FFFE57CCFFFF5DCEFFFF54CCFFFF23BDFFA200
      70FF14000EAD0000001400000000000000000000000000000000000000000300
      0744400381E18A23F7FFB06AF9FFB97BFAFFBB81FAFFB879FAFFA353F8FF6D06
      DCFF1D023AAD000000140000000000000000000000000000000000000030532E
      05ECEA8212FFEE9433FFE07B11FFC56C0EFFBD680EFFD1730FFFED8A20FFEF98
      3AFFAB5E0CFF1109019D00000001000000000000000041A4CBFF73E1F5FF70E0
      F6FF6EDFF6FF6BDEF5FF41A4CBFF53AEC6FF54B1C9FF60D2EBFF5DD2EBFF5AD0
      EAFFDDB95CFF41A4CBFF00000000000000000000000000000000000000305900
      3EECFE00B1FFFF22BDFFF300AAFFD40095FFCD008FFFE2009EFFFE0FB7FFFF2B
      BFFFB90081FF12000C9D00000001000000000000000000000000010003304A05
      97EC9435F7FFA352F8FF8F2DF7FF8215F6FF7E0FF6FF8820F6FF9B43F8FFA659
      F9FF7607EEFF1901319D00000001000000000000000000000004231302BEAF60
      0DFFC76E0FFF95520BFF8C4D0AFF8B4C0AFF874A0AFF894B0AFF9C550BFFB262
      0DFFE17C11FF824709FF02010051000000000000000041A4CBFF7CE4F7FF7AE3
      F6FF77E2F6FF74E1F6FF41A4CBFF2F8557FF2E834CFF309440FF44AD87FF5ED2
      EBFFFFFFFFFF41A4CBFF0000000000000000000000000000000426001BBEBE00
      85FFD80097FFA20070FF980069FF970068FF930065FF950067FFA90075FFC100
      87FFF300AAFF8D0061FF02000151000000000000000000000004280251BE7807
      F2FF8418F6FF6D06DCFF6906D4FF6906D3FF6706D0FF6806D1FF7007E1FF7907
      F4FF8F2EF7FF6506CBFF05000B510000000000000000010000406B3B07FF9C55
      0BFF804609FF834809FF8E4E0AFF8C4D0AFF854909FF784208FF794208FF7C44
      09FFA0570BFFB3620DFF231302BC000000020000000041A4CBFF86E7F7FF83E6
      F8FF80E5F7FF7DE4F6FF41A4CBFF58B0C7FF419782FF35AF43FF32A93EFF2F92
      3BFFF2F8F2FF41A4CBFF00000000000000000000000001000140740050FFA900
      75FF8B0060FF8E0062FF9A006AFF980069FF900063FF83005AFF83005BFF8800
      5EFFAD0078FFC20087FF26001BBC0000000200000000030006405B05B8FF7007
      E1FF6406CAFF6506CCFF6A06D5FF6906D4FF6606CEFF6106C3FF6106C4FF6306
      C7FF7107E4FF7A07F5FF280250BC00000002000000000A060182703E08FF7942
      08FF7E4509FF96520BFF9E560BFFA35A0CFF9F570BFF92500AFF7D4509FF733F
      08FF7D4509FFA55B0CFF593106ED000000200000000041A4CBFF8FEAF8FF8CE9
      F9FF89E8F8FF87E7F8FF41A4CBFF5CB1C7FF5DB4CBFF47AC7EFF35B043FF31AA
      3FFF319543FF41A4CBFF0000000000000000000000000B000882790055FF8300
      5BFF8A005FFFA30071FFAB0076FFB1007AFFAB0077FF9E006DFF89005EFF7D00
      57FF89005EFFB3007CFF610043ED0000002000000000100121825E05BDFF6106
      C4FF6406C9FF6D07DCFF7107E3FF7307E7FF7107E3FF6B06D9FF6306C8FF5F05
      BFFF6306C8FF7407E9FF4E059CED0000012000000000170C01A5613506FF7741
      08FF9D560BFFAE600DFFB4630DFFB5630DFFB7640DFFB3620DFFA35A0CFF8A4C
      0AFF794208FF99540BFF6F3D08FF000000390000000041A4CBFF98EDF9FF95EC
      F9FF93EBF9FF90EAF9FF41A4CBFF5FB2C8FF60B4CBFF73D7EDFF30923BFF3FD5
      5AFF2FA43BFF2B7860E3000000000000000000000000190012A5680049FF8200
      59FFAA0076FFBD0084FFC30088FFC30089FFC5008AFFC20087FFB1007AFF9500
      67FF83005BFFA60073FF780054FF00000039000000001D013AA55705B0FF6006
      C3FF7007E2FF7807F1FF7A07F5FF7A08F6FF7B0AF6FF7A07F5FF7307E7FF6806
      D2FF6106C4FF6F07DFFF5D05BCFF0200053900000000130A019C623607FF894B
      0AFFAC5F0DFFC46C0EFFDD7910FFE57E11FFE47D11FFDB7810FFC66D0FFFA95D
      0CFF8A4C0AFF904F0AFF653807FC000000340000000041A4CBFFA0F0FAFF9EEF
      FAFF9BEEF9FF99EDF9FF41A4CBFF62B3C8FF64B5CBFF78D8EEFF3DA05DFF41D2
      59FF3ECB55FF25792FEB00000000000000000000000015000E9C6B004AFF9400
      67FFBB0082FFD30094FFEF00A7FFF800ADFFF700ACFFED00A5FFD60096FFB700
      80FF960068FF9C006CFF6E004CFC00000034000000001901339C5805B1FF6806
      D1FF7707EFFF8215F6FF8D2AF7FF9131F7FF9130F7FF8D28F7FF8317F6FF7507
      ECFF6806D2FF6B06D7FF5805B1FC02000434000000000603006D683907FF904F
      0AFFBC670EFFE47D11FFED902CFFEF9B40FFF09E45FFEE9637FFEC8619FFC56D
      0FFF9E560BFF874A0AFF402304E0000000120000000041A4CBFFA8F3FBFFA5F2
      FAFFA4F1FBFFA1F0FAFF41A4CBFF65B4C8FF4FA197FF48A972FF359747FF5CE2
      73FF60E779FF2A892DFB0208034002080340000000000600046D70004EFF9C00
      6CFFCC008EFFF700ACFFFF1BBAFFFF30C1FFFF36C3FFFE26BEFFFF06B4FFD500
      95FFAB0076FF930065FF450030E000000012000000000B00166D5A05B6FF6B06
      D7FF7E0EF6FF9130F7FFA04CF8FFA95DF9FFAB62F9FFA555F8FF973CF7FF8316
      F6FF7107E3FF6706D0FF3F037EE0000000120000000000000025512C06F49451
      0AFFC86E0FFFED8D25FFF1AA5DFFF4BC81FFF5BF85FFF2B16AFFEF9738FFD575
      10FFAB5E0CFF7A4309FF1209019B000000000000000041A4CBFFAFF5FCFFADF4
      FCFFABF3FBFFA8F3FBFF41A4CBFF68B4C9FF409271FF37A040FF52CF67FF61EA
      7CFF64F080FF4DC65EFF359E3DFF2A892DFC000000000000002558003DF4A000
      6FFFD80097FFFF14B8FFFE50CAFFFF76D6FFFF7BD7FFFF5ECFFFFF28BFFFE600
      A1FFB90081FF86005CFF13000D9B0000000000000000010002254D059BF46C06
      DAFF8418F6FF9D47F8FFB675FAFFC694FBFFC898FBFFBC81FAFFA657F8FF8A23
      F7FF7607EEFF6206C6FF1801319B0000000000000000000000000C07018B7540
      08FFC36B0EFFEE9432FFF4BA7AFFF9DAB9FFFAE4CDFFF8D7B4FFF1A553FFDE7A
      10FF9B550BFF4E2B06F000000028000000000000000041A4CBFFB5F7FCFFB3F6
      FDFFB1F5FCFFAFF5FCFF41A4CBFF6CB5C9FF6CB7CCFF349542FF3BA746FF5BE0
      74FF63ED7EFF56D86CFF2B8B2EFE030D044E00000000000000000E00098B8000
      58FFD30093FFFF21BCFFFF70D4FFFFB4E8FFFFC8EEFFFFADE6FFFF45C7FFF000
      A8FFA80074FF55003BF0000000280000000000000000000000001301268B6006
      C1FF8214F6FFA352F8FFC390FAFFDFC4FCFFE8D4FDFFDDBFFCFFB26EF9FF8E2A
      F7FF6F07E0FF4B0596F001000228000000000000000000000000000000091D0F
      02B7854909FFE07B11FFF2B069FFF8D6B2FFFADFC3FFF6C692FFEE922EFFA35A
      0CFF5B3206F90301005700000000000000000000000041A4CBFFB9F8FDFFB8F7
      FDFFB6F7FDFF5DB8D7FF5EB6D9FF70BACCFF86D2E5FF85D9E3FF2F9036FF45B7
      54FF5ADE72FF3FB04AFF0512065C000000000000000000000000000000091F00
      16B7900063FFF300AAFFFF5DCEFFFFACE6FFFFBFEBFFFF89DBFFFF1EBBFFB100
      7AFF630044F90300025700000000000000000000000000000000000000092402
      48B76606CEFF8F2DF7FFBB81FAFFDCBEFCFFE4CCFDFFCEA3FBFFA14EF8FF7307
      E7FF5205A6F906000D5700000000000000000000000000000000000000000000
      000B0D0701905D3407F5AF600DFFE68011FFEB8312FFC36B0EFF814609FF311B
      03D30101004B0000000000000000000000000000000041A4CBFF62BBDAFF41A4
      CBFF41A4CBFF7EC6E0FFA5D0DCFFD4F0F7FFD8F4FAFFD7F3FAFFACDAC8FF2D8E
      30FF3AA744FF0B240C8200000000000000000000000000000000000000000000
      000B0F000A90660046F5BE0085FFF900AEFFFF00B2FFD30093FF8C0061FF3500
      25D30200014B0000000000000000000000000000000000000000000000000000
      000B140129905205A6F57807F2FF9231F7FF9436F7FF8214F6FF6406CAFF3403
      68D30400094B0000000000000000000000000000000000000000000000000000
      0000000000000000002E07030079130B01AA180D01B40D070198020100590000
      000F00000000000000000000000000000000000000005AA6C3F04C9EBDF04BAA
      D0FF41A4CBFF41A4CBFF41A4CBFF41A4CBFF41A4CBFF41A4CBFF41A4CBFF2A74
      6EDC14392A9D0000000000000000000000000000000000000000000000000000
      0000000000000000002E0700057915000FAA1A0012B40E000A98030002590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000100032E0D001A791D0139AA210242B416012C9806000D590000
      000F000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810001018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810100008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00000000003D050F0BA8143C2CE624674EFD287557FF1E5842F60C221AD00205
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D0F0505A83D1212E66B2021FD792426FF5B1B1CF6230A0AD00502
      0287000000270000000700000000000000000000000000000000000000000000
      00000000003D09050FA823143CE63E2467FD472875FF351E58F6150C22D00302
      0587000000270000000700000000000000000000000000000000000000000000
      00000000003D000A0DA8003547E600658DFD0074A0FF005474F6001B25D00002
      0487000000270000000700000000000000000000000000000000000000000102
      0244143B2CE13BAA80FF72CDABFF83D3B4FF87D5B7FF81D2B3FF5CC69EFF2976
      59FF061510AD0000001400000000000000000000000000000000000000000201
      01443D1313E1B03537FFD26D6FFFD77E80FFD98385FFD77B7DFFCB5759FF7A25
      26FF160606AD0000001400000000000000000000000000000000000000000201
      024424143BE1673BAAFF9772CDFFA383D3FFA687D5FFA181D2FF875CC6FF4829
      76FF0E0615AD0000001400000000000000000000000000000000000000000000
      0144003347E100A9E7FF40CCFFFF57D2FEFF5DD4FFFF54D1FFFF23C4FFFF0075
      A2FF000E14AD0000001400000000000000000000000000000000000200301847
      35EC41BB8DFF5BC69DFF3EB387FF369D75FF349770FF39A77CFF4DC094FF61C8
      A1FF2F8865FF0616119D00000001000000000000000000000000020000304A16
      17ECC23A3CFFCB5658FFB9383AFFA23132FF9C2F30FFAC3436FFC64749FFCD5C
      5EFF8D2A2CFF1606069D00000001000000000000000000000000000002302A18
      47EC7141BBFF865BC6FF6C3EB3FF5F369DFF5B3497FF6539A7FF7B4DC0FF8B61
      C8FF522F88FF0E06169D00000001000000000000000000000000000000300041
      59EC00BAFEFF22C4FFFF00B2F3FF009CD4FF0096CDFF00A5E2FF0FBFFEFF2BC6
      FFFF0087B9FF000D129D000000010000000000000000000000040C251CBE308C
      68FF379F77FF297659FF266F53FF266E52FF256B50FF256D51FF2A7C5CFF318E
      6AFF3EB487FF23674DFF01050451000000000000000000000004260B0CBE912B
      2DFFA53133FF7A2526FF732224FF722223FF6F2122FF702223FF812628FF932C
      2EFFBA383AFF6A2021FF06010151000000000000000000000004170C25BE5430
      8CFF60379FFF482976FF43266FFF43266EFF41256BFF42256DFF4B2A7CFF5631
      8EFF6D3EB4FF3E2367FF02010551000000000000000000000004001C26BE008B
      BEFF009ED8FF0075A2FF006E98FF006D97FF006A93FF006C95FF007AA9FF008D
      C1FF00B2F3FF00668DFF000102510000000000000000010403401D5540FF2A7C
      5CFF23654CFF23684DFF277054FF266F53FF24694FFF215F47FF216048FF2263
      4AFF2B805FFF318F6AFF0D261CBC000000020000000004010140581A1BFF8126
      28FF691F20FF6B2021FF742324FF732224FF6D2022FF631D1EFF631E1FFF671E
      20FF842729FF942C2EFF290B0DBC000000020000000002010440331D55FF4B2A
      7CFF3D2365FF3F2368FF442770FF43266FFF402469FF3A215FFF3A2160FF3C22
      63FF4D2B80FF56318FFF180D26BC000000020000000000010140005474FF007A
      A9FF00648BFF00678EFF006F9AFF006E98FF006890FF005F83FF005F83FF0062
      88FF007DADFF008EC2FF001B26BC000000020000000006100D821E5A43FF2160
      48FF22654BFF297759FF2B7D5EFF2D8261FF2B7E5EFF287356FF22644BFF1F5C
      45FF22644BFF2D8462FF1A4C39ED0001002000000000110506825D1B1CFF631E
      1FFF681F20FF7B2526FF822728FF87282AFF832728FF772425FF671F20FF5F1C
      1DFF671F20FF88292AFF4F1818ED01000020000000000A061082361E5AFF3A21
      60FF3D2265FF482977FF4C2B7DFF4F2D82FF4C2B7EFF462873FF3C2264FF371F
      5CFF3C2264FF4F2D84FF2F1A4CED000001200000000000080B82005979FF005F
      83FF00648AFF0076A3FF007CABFF0081B1FF007DABFF00729EFF006389FF005B
      7DFF006389FF0083B3FF004661ED0000002000000000091D15A51A4D39FF205F
      47FF2B7C5DFF308B68FF31906BFF31916BFF32926DFF318F6AFF2D8261FF256D
      52FF216048FF2A795BFF1E5942FF00020239000000001D0909A5501718FF621D
      1EFF822628FF902B2DFF952C2EFF952D2EFF972D2FFF942C2EFF87282AFF7122
      23FF631E1FFF7D2627FF5C1B1CFF020000390000000012091DA52E1A4DFF3920
      5FFF4B2B7CFF54308BFF573190FF573191FF583292FF56318FFF4F2D82FF4225
      6DFF3A2160FF4A2A79FF361E59FF0200023900000000001219A5004C68FF005E
      82FF007BAAFF008ABDFF008EC3FF008FC3FF0091C5FF008EC2FF0081B1FF006C
      95FF005F83FF0078A6FF005878FF0000003900000000091A149C1B4E3BFF256D
      51FF2F8A66FF369C74FF3DB084FF3FB789FF3FB689FF3CAF83FF369F76FF2E87
      64FF266E52FF277255FF1C513DFC01020234000000001A07099C511819FF7022
      23FF8F2A2CFFA23032FFB63739FFBD393BFFBC393BFFB53638FFA43133FF8B2A
      2BFF712223FF762325FF54191AFC02010134000000000F091A9C2F1B4EFF4225
      6DFF532F8AFF5E369CFF6B3DB0FF6F3FB7FF6E3FB6FF6A3CAFFF60369FFF512E
      87FF42266EFF452772FF321C51FC0101023400000000000F159C004E6BFF006C
      94FF0089BBFF009BD3FF00AFEFFF00B5F8FF00B5F7FF00ADEDFF009DD6FF0086
      B7FF006C96FF00719CFF004F6EFC0000003400000000030B086D1C533EFF2772
      55FF349670FF3FB689FF56C39AFF66C9A3FF6ACBA6FF5EC79FFF47BE91FF369E
      75FF2B7D5EFF256B50FF143A2BE000000012000000000B02036D56191AFF7623
      25FF9C2E30FFBC393BFFC95052FFCE6162FFD06567FFCC595BFFC44143FFA331
      33FF822728FF6F2122FF3C1113E0000000120000000006030B6D321C53FF4527
      72FF5B3496FF6E3FB6FF8256C3FF8E66C9FF916ACBFF895EC7FF7647BEFF5F36
      9EFF4C2B7DFF41256BFF23143AE000000012000000000005066D005270FF0071
      9CFF0095CCFF00B5F7FF1BC2FFFF30C8FFFF36C9FFFF26C5FEFF06BDFFFF009C
      D5FF007CABFF006A93FF003245E0000000120000000000010125174332F42875
      57FF37A077FF50C297FF7DD1B1FF9ADBC2FF9EDCC4FF88D5B7FF60C7A0FF3BAA
      80FF2F8865FF216249FF0917129B000000000000000001000025461415F47924
      26FFA63133FFC84A4DFFD6787AFFDF9698FFE09A9BFFD98486FFCC5B5CFFB035
      37FF8D2A2CFF651E1FFF1807079B000000000000000001000125281743F44728
      75FF6137A0FF7D50C2FF9F7DD1FFB49ADBFFB79EDCFFA788D5FF8A60C7FF673B
      AAFF522F88FF3B2162FF0F09179B000000000000000000000025004058F40074
      A0FF009FD8FF14C0FFFF50D0FEFF76DAFFFF7BDCFFFF5ED4FFFF28C6FFFF00A9
      E6FF0087B9FF006186FF000E139B00000000000000000000000007130E8B205D
      46FF359C74FF5BC59DFF95DABFFFC7EBDDFFD7F0E7FFC3E9DBFF75CFADFF3DB1
      85FF2A7B5CFF184231F0000000280000000000000000000000001305058B601D
      1EFFA13032FFCB5557FFDD9293FFEDC5C6FFF2D5D6FFEBC1C1FFD37172FFB737
      39FF802627FF451415F0000000280000000000000000000000000A07138B3820
      5DFF5E359CFF865BC5FFB195DAFFD5C7EBFFE1D7F0FFD2C3E9FF9A75CFFF6B3D
      B1FF4A2A7BFF281842F000000028000000000000000000000000000A0E8B005C
      80FF009AD3FF21C4FFFF70D9FFFFB4EBFFFFC8F0FFFFADE9FFFF45CDFFFF00AF
      F0FF007AA8FF003E55F000000028000000000000000000000000000000090A20
      17B724694FFF3EB387FF87D5B7FFC1E9DAFFCFEEE2FFA8E0CBFF58C49BFF2D82
      61FF1A4937F9020705570000000000000000000000000000000000000009210A
      0AB76D2022FFB9383AFFD98385FFEBBFC0FFEFCECEFFE3A5A6FFCA5254FF8728
      2AFF4C1718F9070202570000000000000000000000000000000000000009140A
      20B7402469FF6C3EB3FFA687D5FFD1C1E9FFDBCFEEFFBEA8E0FF8458C4FF4F2D
      82FF2D1A49F90402075700000000000000000000000000000000000000090016
      1FB7006890FF00B2F3FF5DD4FFFFACE8FFFFBFEDFFFF89DFFFFF1EC3FFFF0081
      B1FF004763F90002035700000000000000000000000000000000000000000000
      000B06130F901A4E3AF5308C68FF3FB88AFF41BC8DFF359C74FF23664CFF112E
      24D30204044B0000000000000000000000000000000000000000000000000000
      000B13060690501819F5912B2DFFBE393BFFC33A3DFFA13032FF6A1F21FF300E
      0FD30400004B0000000000000000000000000000000000000000000000000000
      000B0B0613902F1A4EF554308CFF6F3FB8FF7241BCFF5E359CFF3E2366FF1C11
      2ED30202044B0000000000000000000000000000000000000000000000000000
      000B000A0F90004A66F5008BBEFF00B6F9FF00BAFFFF009AD3FF00658CFF0026
      35D30001024B0000000000000000000000000000000000000000000000000000
      0000000000000101012E030B0879071711AA091C13B405110D98020504590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000100002E0B020379190707AA1C0707B413040598060202590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000101012E07030B790F0717AA10091CB40A051198030205590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000000002E00050779000F15AA00121AB4000A0E98000203590000
      000F000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810101018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810101008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810001018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00000000003D0B0B0BA8272727E6464646FD4F4F4FFF3B3B3BF6161616D00404
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D0F0D05A83C3812E6696321FD787125FF5A541BF622200AD00404
      0287000000270000000700000000000000000000000000000000000000000000
      00000000003D030511A80B1745E6142677FD172B88FF112065F6070D27D00102
      0587000000270000000700000000000000000000000000000000000000000000
      00000000003D011313A805484AE6098183FD0A9194FF086C6EF603292BD00106
      0687000000270000000700000000000000000000000000000000000000000202
      0244282828E1727272FFA0A0A0FFABABABFFAEAEAEFFAAAAAAFF929292FF5050
      50FF0E0E0EAD0000001400000000000000000000000000000000000000000202
      01443C3913E1AEA436FFD1C96DFFD6CF7EFFD7D184FFD5CE7DFFCAC158FF7973
      26FF151406AD0000001400000000000000000000000000000000000000000101
      02440A1544E1213FC4FF5D75E2FF7086E5FF758AE6FF6D84E5FF4460DEFF172C
      89FF040819AD0000001400000000000000000000000000000000000000000002
      024405484AE110D2D5FF4FEEF0FF63F0F2FF69F0F2FF60EFF2FF34EBEEFF0B93
      95FF021B1BAD0000001400000000000000000000000000000000000000302F2F
      2FEC7E7E7EFF919191FF787878FF686868FF656565FF707070FF878787FF9595
      95FF5B5B5BFF0E0E0E9D00000001000000000000000000000000020200304743
      17ECC0B53CFFC9C057FFB7AD39FFA09732FF9A9230FFABA135FFC5BA47FFCBC2
      5DFF8B832BFF1614069D00000001000000000000000000000000000002300D1A
      52EC2545D7FF435FDEFF2342CEFF1E3AB5FF1D38AEFF203DC0FF3251DBFF4A65
      DFFF1A329DFF0307199D00000001000000000000000000000000000202300558
      5AEC12E7EAFF33EBEEFF11DDE0FF0EC2C5FF0EBABDFF0FCDD1FF20E9EDFF3AEC
      EFFF0CA8ABFF011A1B9D00000001000000000000000000000004191919BE5E5E
      5EFF6B6B6BFF505050FF4B4B4BFF4A4A4AFF484848FF484848FF535353FF5F5F
      5FFF787878FF454545FF0404045100000000000000000000000426250BBE9088
      2CFFA39A33FF797326FF726B23FF706A23FF6D6722FF6F6822FF7E7727FF9189
      2DFFB7AD39FF696320FF06050151000000000000000000000004060E2BBE1B33
      A1FF1F3BB7FF172C89FF152981FF152980FF15277BFF15287DFF182E8FFF1B34
      A4FF2342CFFF142676FF00010651000000000000000000000004032E2FBE0DAD
      AFFF0FC4C7FF0B9395FF0A8A8CFF0A898BFF0A8587FF0A8789FF0B999CFF0DAF
      B2FF11DEE1FF098082FF00060651000000000000000003030340393939FF5353
      53FF444444FF464646FF4C4C4CFF4B4B4BFF474747FF404040FF404040FF4343
      43FF555555FF606060FF1B1B1BBC00000002000000000404014057521AFF7E77
      27FF676120FF6A6421FF736D24FF726B23FF6C6621FF615C1EFF615C1EFF6660
      1FFF827A28FF938A2DFF27260DBC000000020000000001010440101F62FF182E
      8FFF132575FF142677FF162982FF152981FF142779FF12236EFF12236FFF1324
      72FF182F93FF1C34A4FF060E2CBC00000002000000000005054007696BFF0B99
      9CFF097D80FF098183FF0A8C8EFF0A8A8CFF098385FF087678FF087779FF097A
      7CFF0B9DA0FF0DB0B3FF032F30BC00000002000000000C0C0C823B3B3BFF4040
      40FF444444FF505050FF545454FF575757FF545454FF4E4E4EFF434343FF3E3E
      3EFF434343FF585858FF333333ED0000002000000000100F06825B561CFF615C
      1EFF676120FF797326FF817827FF857D29FF817827FF767025FF66601FFF5E59
      1DFF66601FFF877E29FF4D4A18ED010100200000000003061382112167FF1223
      6FFF132574FF172C8AFF182E91FF193096FF182E92FF162A86FF132573FF1122
      6AFF132573FF193098FF0E1C58ED000001200000000002141482086F70FF0877
      79FF097C7EFF0B9496FF0B9B9EFF0CA1A3FF0B9C9FFF0A8F92FF097B7DFF0871
      73FF097B7DFF0CA3A5FF075E60ED0001012000000000131313A5333333FF4040
      40FF545454FF5D5D5DFF606060FF606060FF606060FF606060FF575757FF4848
      48FF404040FF525252FF3B3B3BFF02020239000000001D1B09A54F4A18FF615C
      1EFF817827FF8E862CFF938A2DFF938A2DFF948C2EFF938A2DFF857D29FF6F68
      22FF615C1EFF7C7527FF5A541BFF0202003900000000050A22A50E1C59FF1223
      6DFF182E90FF1B33A0FF1C35A5FF1C35A6FF1C36A8FF1C34A4FF193096FF1528
      7EFF12236FFF172D8DFF112066FF0000023900000000032424A5065F61FF0875
      77FF0B9A9DFF0DACAEFF0DB1B4FF0DB2B5FF0DB4B7FF0DB0B3FF0CA1A3FF0A88
      8AFF087779FF0B9799FF086E6FFF00020239000000001111119C353535FF4848
      48FF5C5C5CFF686868FF767676FF7B7B7BFF7A7A7AFF757575FF6A6A6AFF5A5A
      5AFF4A4A4AFF4D4D4DFF373737FC01010134000000001A18079C504C19FF6F68
      22FF8D852BFF9F9631FFB4AA38FFBCB13AFFBAB03AFFB3A937FFA29932FF8A82
      2AFF706A23FF756E24FF524E1AFC020201340000000004091D9C0F1D5AFF1528
      7DFF1B339EFF1E3AB4FF2241CBFF2444D2FF2443D1FF2240C9FF1F3AB6FF1A31
      9BFF15287EFF162A84FF0F1E5EFC0001023400000000011F1F9C076162FF0A87
      89FF0DAAACFF0EC1C4FF10D9DDFF11E1E5FF11E0E4FF10D7DBFF0FC3C6FF0CA6
      A9FF0A888AFF0A8E90FF076466FC00030334000000000808086D373737FF4D4D
      4DFF656565FF7A7A7AFF8D8D8DFF989898FF9B9B9BFF939393FF838383FF6868
      68FF545454FF484848FF262626E000000012000000000B0B036D534F1AFF756E
      24FF9A9230FFBAB03AFFC8BE50FFCDC461FFCEC666FFCAC15AFFC3B841FFA097
      32FF817827FF6D6722FF3B3811E0000000120000000002030E6D101E5FFF162A
      84FF1D37ADFF2443D1FF3D5ADCFF4F6AE0FF546EE1FF4762DEFF2C4BD9FF1F3A
      B5FF182E91FF15277BFF0B1543E00000001200000000000E0E6D076668FF0A8E
      90FF0EB9BCFF11E0E4FF2CEAEDFF40ECEFFF45EDF0FF37EBEEFF19E8ECFF0FC2
      C5FF0B9B9EFF0A8587FF054749E00000001200000000010101252D2D2DF44F4F
      4FFF6B6B6BFF8A8A8AFFA8A8A8FFBBBBBBFFBDBDBDFFAFAFAFFF939393FF7272
      72FF5B5B5BFF424242FF0F0F0F9B000000000000000001010025444015F47871
      25FFA39A33FFC6BC4CFFD5CD79FFDED897FFDFD99AFFD8D185FFCBC25BFFAEA4
      36FF8B832BFF645E1FFF1717079B0000000000000000000001250D184EF4172B
      88FF1F3BB8FF3755DBFF6A81E4FF8B9CEAFF8FA0EBFF768BE7FF4864DFFF213F
      C4FF1A329DFF132470FF04091A9B000000000000000000010225065354F40A91
      94FF0FC5C8FF25EAEDFF5DEFF1FF81F2F4FF85F3F5FF6AF0F2FF38ECEFFF10D2
      D5FF0CA8ABFF09797AFF011D1D9B0000000000000000000000000D0D0D8B3F3F
      3FFF686868FF919191FFB8B8B8FFD9D9D9FFE3E3E3FFD6D6D6FFA3A3A3FF7777
      77FF535353FF2D2D2DF0000000280000000000000000000000001310058B605A
      1DFF9F9631FFC9C057FFDCD693FFECE9C5FFF1EFD4FFEBE7C0FFD2CA72FFB6AB
      38FF7E7727FF433F15F0000000280000000000000000000000000307158B1222
      6BFF1E39B3FF425FDEFF8698E9FFBFC8F3FFD1D8F6FFBAC4F2FF6179E3FF2341
      CBFF182D8EFF0D184CF0000002280000000000000000000000000216168B0873
      75FF0EC0C3FF32EBEEFF7AF2F4FFB9F8F9FFCDFAFAFFB4F7F8FF53EEF1FF10DA
      DEFF0B999BFF065253F000020228000000000000000000000000000000091616
      16B7474747FF787878FFAEAEAEFFD5D5D5FFDFDFDFFFC3C3C3FF8F8F8FFF5757
      57FF323232F90505055700000000000000000000000000000000000000092120
      0AB76C6621FFB7AD39FFD7D184FFEAE7BFFFEFECCEFFE2DDA5FFC8BF54FF857D
      29FF4B4718F9070702570000000000000000000000000000000000000009050C
      25B7142779FF2342CEFF758AE6FFB8C3F2FFC8D0F5FF9BAAEDFF3F5CDDFF1930
      96FF0E1B55F90103075700000000000000000000000000000000000000090228
      28B7098385FF11DDE0FF69F0F2FFB2F7F8FFC3F9FAFF92F4F6FF2EEBEEFF0CA1
      A3FF065B5DF90108085700000000000000000000000000000000000000000000
      000B0C0C0C90343434F55E5E5EFF7B7B7BFF7E7E7EFF686868FF454545FF2020
      20D30404044B0000000000000000000000000000000000000000000000000000
      000B131206904F4A18F590882CFFBCB13AFFC0B53CFF9F9631FF696320FF302E
      0ED30404004B0000000000000000000000000000000000000000000000000000
      000B030615900F1C59F51B33A1FF2444D3FF2545D8FF1E39B3FF142576FF0911
      36D30002054B0000000000000000000000000000000000000000000000000000
      000B02181890076061F50DADAFFF11E2E6FF12E8EBFF0EC0C3FF097E81FF043A
      3CD30005054B0000000000000000000000000000000000000000000000000000
      0000000000000101012E080808790F0F0FAA121212B40D0D0D98030303590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000101002E0B0A0379171707AA1C1A07B411110598050502590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000001012E01030C7905091BAA04091FB404071498010206590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000001012E000E0F79011D1DAA022123B401171798000707590000
      000F000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00040000000F0000002700000052000001810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810000008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000000810001008F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00000000003D090B0DA824262CE6454548FD4E4E50FF393A3EF614161AD00304
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D07090BA823242AE6444448FD4D4D50FF37383DF614141AD00203
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D010B15A8032E51E6065392FD075EA7FF05477DF6011B30D00004
      0687000000270000000700000000000000000000000000000000000000000000
      00000000003D090F05A8223C13E63C6922FD447727FF335A1DF615230CD00304
      0287000000270000000700000000000000000000000000000000000000000202
      024424282BE177706EFFAD9C94FFBBA69CFFBEA89FFFB8A49CFF9B8E89FF504F
      51FF0C0E12AD0000001400000000000000000000000000000000000000000102
      024424242BE17E7976FFBEB2A7FFD1C4B6FFD4C7B9FFCBBFB3FFA79E97FF5250
      53FF0C0C10AD0000001400000000000000000000000000000000000000000002
      0344042F52E10B8AF1FF68B7F7FF80C2F8FF84C4F8FF79BFF8FF49A8F5FF075F
      A8FF00101DAD0000001400000000000000000000000000000000000000000202
      0144223C14E163AE39FF95D071FFA0D582FFA3D685FF9ED47DFF83C85AFF4578
      27FF0C1506AD0000001400000000000000000000000000000000000002302E2F
      33EC897774FFA28481FF89696CFF7A5962FF75565EFF816065FF987677FFA58A
      86FF5F585AFF0C0E119D00000001000000000000000000000000000000302E2F
      33ECA0968EFFCDBEB1FFBEB2A7FFB3A9A1FFB0A69FFFB8ACA3FFC8BBAEFFC8BB
      ADFF696464FF0B0B0F9D0000000100000000000000000000000000000230043A
      65EC1B92F3FF42A5F5FF1B92F3FF0B86E9FF0A81E2FF0B8AF1FF309CF4FF4BA9
      F5FF096DBFFF01111E9D00000001000000000000000000000000000200302A49
      17EC6ABA3DFF80C756FF6ABA3DFF60A937FF5DA335FF63AE39FF75C249FF84C9
      5BFF4F8B2DFF0B16069D0000000100000000000000000000000417191CBE6656
      58FF7B5B62FF604051FF5B3B4FFF5B3A51FF59384FFF5A394EFF644353FF704F
      59FF896A6EFF474348FF0202045100000000000000000000000414171ABE857D
      79FFB9AEA5FFA39D9AFFA19D9CFFA19E9EFFA09E9DFFA09C9AFFA69F9AFFB0A7
      A0FFB8ACA2FF4E4C4FFF01020251000000000000000000000004021C32BE0971
      C7FF0B86E9FF086BBDFF0868B7FF0868B7FF0865B2FF0866B4FF096FC3FF0A7B
      D8FF1A91F3FF065495FF0004065100000000000000000000000416250BBE5290
      2FFF60A937FF4E892CFF4B842BFF4B842BFF49812AFF4A822AFF508D2EFF599C
      33FF6AB93CFF3D6B23FF020501510000000000000000020303403B363DFF6344
      50FF55344CFF573551FF5E3A59FF5D395DFF593559FF522F4EFF523049FF5333
      47FF664553FF6A565CFF18191CBC00000002000000000102024048474CFFA49E
      99FF9E9C9CFFA1A1A1FFA8A8A9FFA9ABADFFA6A7AAFF9F9FA1FF9D9B9CFF9C99
      97FFADA6A0FF8E8783FF14161BBC00000002000000000003054005487EFF096F
      C3FF0862ADFF0865B2FF096EC1FF096FC3FF086ABBFF0760A9FF075EA7FF075E
      A7FF0971C7FF0A77D1FF021E37BC000000020000000002040140345B1DFF508D
      2EFF477D28FF49812AFF508C2DFF508D2EFF4D872CFF457927FF447727FF4477
      27FF52902FFF569731FF16270DBC00000002000000000B0C0D82443541FF5230
      4CFF553354FF623F61FF664168FF69426DFF664169FF5E3B61FF553156FF4E2E
      4DFF54334AFF664B55FF323136ED000101200000000009090B82676669FFA2A1
      A1FFA1A2A4FFACACAEFFB0B2B5FFB3B5B8FFB1B2B6FFABACB0FFA3A5A8FF9D9E
      A0FFA19E9EFF9F9894FF363639ED0000002000000000010D178206508EFF0861
      ABFF0866B4FF0974CDFF0A7AD7FF0A7EDEFF0A7AD6FF0971C8FF0867B5FF075E
      A7FF0861ABFF0971C7FF053E6BED00000120000000000A1106823A6621FF467B
      28FF4A822AFF559530FF599C32FF5BA034FF589B32FF53912FFF4A832AFF4477
      27FF467B28FF52902FFF2D4E19ED0001002000000000121215A53E2A3EFF522E
      52FF654167FF6E4972FF704A77FF714B77FF724C78FF6F4A76FF69436CFF5B38
      5CFF532F53FF624254FF3D393FFF0002023900000000101012A5707176FFA5A7
      AAFFB0B1B4FFB7B8BCFFBABDC0FFBBBDC1FFBCBEC1FFBABCBFFFB3B5B9FFA8AA
      ADFFA3A4A7FFA6A19EFF48474BFF0000023900000000011727A5064C86FF0863
      AEFF0A79D4FF0B85E8FF0B89EFFF0B8AF1FF0B8AF2FF0B88EDFF0A7EDEFF096D
      BFFF0863AFFF096FC3FF064B85FF0002043900000000101D09A537611FFF487D
      29FF579932FF60A837FF63AD38FF63AE39FF64AF39FF62AB38FF5BA034FF4F8B
      2DFF487E29FF508D2EFF365F1FFF00020039000000000F11149C3D2A40FF5B37
      5CFF6C4871FF795281FF885E90FF8B6295FF8B6195FF875C90FF7B5383FF6C46
      6FFF5C375DFF5E3C5BFF38333CFC01020234000000000C0E119C6E7176FFAEAF
      B2FFB7B9BCFFC2C4C7FFCDCFD2FFCFD2D5FFCFD2D5FFCCCFD2FFC4C5C9FFB6B8
      BBFFABADB0FFA7A6A8FF424348FC01010134000000000114229C064C86FF096D
      BFFF0B84E6FF1A91F3FF339EF4FF3BA1F4FF3BA1F4FF329DF4FF1C93F3FF0B82
      E3FF096FC3FF096FC4FF054377FC00020334000000000F1A099C37611FFF4F8B
      2DFF5FA736FF6AB93CFF77C34BFF7BC550FF7BC550FF76C34AFF6BBB3DFF5EA4
      36FF508D2EFF518E2EFF32571CFC01020134000000000608086D3C2F41FF5F3A
      60FF734F7BFF8B6195FF9D71A9FFA97AB6FFAB7DB9FFA475B1FF94689EFF7953
      82FF664069FF573958FF24242AE000000012000000000505066D5D5F65FFB1B3
      B6FFBDBFC2FFCFD1D5FFDCDFE2FFE3E6E9FFE4E6E9FFE0E3E5FFD6D8DBFFC1C4
      C7FFB5B7BAFF999A9DFF29292FE0000000120000000000080F6D064B85FF0971
      C8FF0F8CF2FF3BA1F4FF5AB0F6FF6DB9F7FF72BCF7FF65B5F6FF4AA9F5FF1A92
      F3FF0A7AD7FF0868B8FF042F52E00000001200000000060B036D365F1FFF5391
      2FFF66B23AFF7BC550FF8DCC67FF97D175FF99D277FF92CF6EFF84C85BFF6AB9
      3DFF599C32FF4C852BFF223C14E00000001200000000010101252B2833F45E3D
      61FF7D5484FF9A6EA5FFB88CC4FFCE9FD7FFD1A0DBFFC091CDFFA678B0FF845B
      8BFF6E4671FF48374DFF0F0F129B00000000000000000000002534353CF4A5A7
      ABFFC8CACCFFD9DBDEFFEAEDEEFFF4F6F7FFF4F6F8FFEDEFF2FFE0E2E5FFC9CB
      CEFFBEC0C3FF707177FF0C0C0F9B000000000000000000010225043660F40971
      C7FF1F94F3FF53ADF6FF88C6F8FFA5D4FAFFA8D5FAFF8FC9F9FF66B6F7FF2C9A
      F3FF0B85E8FF07589CFF0112209B000000000000000001010025284616F45290
      2FFF6CBD3EFF89CB62FFA5D788FFB5DE9DFFB6DF9FFFA9D98DFF93CF70FF72C1
      45FF60A837FF407025FF0D17079B0000000000000000000000000A0D0E8B4235
      49FF7A5181FFA174ADFFC89CD4FFE8C5EEFFEFD4F4FFE3C3EAFFB387BFFF8A5E
      91FF5F4363FF292931F00000002800000000000000000000000009090B8B6062
      68FFC7C9CCFFE2E4E8FFF1F3F5FFFEFFFFFFFFFFFFFFFAFAFCFFE8EAECFFD5D7
      DAFF9B9CA0FF2D2E34F000000028000000000000000000000000010F1A8B0652
      92FF1B92F3FF61B3F6FFA0D1FAFFD5EAFCFFD9EDFDFFCFE8FCFF80C2F8FF369F
      F4FF0973CAFF04355CF0000002280000000000000000000000000A13058B3C69
      22FF6ABA3DFF91CE6CFFB2DD99FFCFEAC0FFD3ECC5FFCBE8BBFFA0D582FF78C4
      4DFF53932FFF284316F000000028000000000000000000000000000000091416
      17B74A3C52FF876092FFC090CDFFE5BEEDFFECCBF3FFD5AADFFFA072ABFF6246
      69FF2F2D37F90405055700000000000000000000000000000000000000091212
      16B7686A71FFC9CBCFFFF6F9FBFFFFFFFFFFFFFFFFFFFEFFFFFFE2E4E7FF999B
      A0FF37393FF90303045700000000000000000000000000000000000000090219
      2DB7075CA2FF339EF4FF93CBF9FFCFE8FCFFD4EAFCFFB7DCFBFF60B3F6FF0A78
      D3FF043C69F90005095700000000000000000000000000000000000000091221
      0AB7437526FF77C34BFFABDA90FFCBE8BBFFCFEABFFFBEE2AAFF8FCE6BFF5799
      31FF2B4C19F90407025700000000000000000000000000000000000000000000
      000B0B0E0F90322F3AF5624E6EFF856692FF8A6896FF6F567BFF453B4FFF1D1E
      22D30204044B0000000000000000000000000000000000000000000000000000
      000B0A0A0B903B3C43F584868CFFAFB1B7FFB5B8BDFF999CA1FF5D6066FF1D1E
      24D30202024B0000000000000000000000000000000000000000000000000000
      000B010F1C90053F6DF50A77D2FF2C9AF3FF339EF4FF0B87EBFF075799FF0326
      44D30004074B0000000000000000000000000000000000000000000000000000
      000B0A1306902D501AF5569831FF72C145FF77C34BFF61AA37FF3F6E24FF1C31
      11D30204024B0000000000000000000000000000000000000000000000000000
      0000000000000101012E070808790F1111AA101215B40A0D0D98030404590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000001012E060608790D0D11AA0E1013B40A0A0D98020203590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000001012E00081079011321AA021728B4010E1A98000407590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000101012E070B03790F1907AA101E09B40A140798030502590000
      000F00000000000000000000000000000000022B394D068DBEFF068DBEFF068D
      BEFF068DBEFF068DBEFF068DBEFF068DBEFF068DBEFF068DBEFF068DBEFF068D
      BEFF068DBEFF068DBEFF00000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000200000008000000100000001500000016000000100000000A0000
      000300000000000000000000000000000000068DBEFF24A1D1FF3DB2DFFF65CD
      F9FF65CDF9FF64CDF9FF64CDF9FF64CDF9FF64CDF8FF64CDF9FF64CDF8FF65CE
      F9FF38ADD8FF068DBEFF022B394D000000000000000000000000000000000000
      00040000000F0000002700000052000001810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000001810000018F0000006C0000003B0000
      00200000000D0000000200000000000000000000000000000000000000000000
      00040000000F0000002700000052000001810000018F0000006C0000003B0000
      00200000000D000000020000000000000000068DBEFF4BBCE7FF1D9CCBFF6ED4
      FAFF6ED4FAFF6ED4F9FF6DD4FAFF6ED4F9FF6ED4FAFF6ED4FAFF6ED4FAFF6DD4
      F9FF3DB1D9FF84D7EBFF068DBEFF000000000000000000000000000000000000
      00000000003D09090DA824252CE6454549FD4E4E51FF393A3FF614161AD00304
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D090B0BA824262BE6454548FD4E4E50FF3A3A3EF615161AD00304
      0487000000270000000700000000000000000000000000000000000000000000
      00000000003D09090BA824252AE6454448FD4E4D50FF3A3A3EF615151AD00304
      048700000027000000070000000000000000068DBEFF71D6FAFF068DBEFF78DC
      FBFF78DCFBFF78DCFBFF78DCFBFF78DCFBFF78DCFBFF79DCFBFF78DCFAFF78DC
      FAFF43B5D9FFAEF1F9FF068DBEFF000000000000000000000000000000000202
      024424262BE178716EFFAFA193FFBEAC9AFFC1AF9CFFBAAA99FF9D9187FF504F
      51FF0C0E12AD0000001400000000000000000000000000000000000000000202
      024425262BE1757171FFA69D9DFFB1A7A9FFB3A9ACFFAEA5A7FF968E90FF4F4E
      52FF0E0E10AD0000001400000000000000000000000000000000000000000202
      024425262BE1757272FFA6A39FFFB1B0ABFFB3B3AEFFAFADA9FF969391FF4F4F
      52FF0E0E10AD000000140000000000000000068DBEFF78DDFBFF1799C7FF65CF
      EEFF83E4FBFF84E4FBFF83E4FCFF83E4FCFF84E4FCFF83E4FCFF83E4FBFF84E5
      FCFF47B9DAFFB3F4F9FF068DBEFF022B394D0000000000000000000002302E2F
      33EC8C7D71FFA79179FF917A63FF836D56FF7E6953FF89735BFF9E886EFFAA95
      80FF615B59FF0C0E119D00000001000000000000000000000000000000302F2F
      33EC807880FF8E8699FF6F6C8CFF5D5D84FF595980FF656385FF807993FF958C
      9AFF5C595FFF0E0E0F9D00000001000000000000000000000000000000302F2F
      33EC818082FF8E979EFF6E8591FF5B798AFF577487FF647C8BFF7E9099FF949B
      9EFF5B5C60FF0E0E0F9D0000000100000000068DBEFF82E3FCFF42B7DCFF3DB4
      D8FF8DEBFCFF8DEBFCFF8DEBFCFF8DEBFDFF8DEBFDFF8DEBFCFF59BDA2FF0D78
      18FF3EADB3FFB6F7F9FF6CCAE0FF068DBEFF000000000000000417191CBE6A5E
      54FF856F56FF6A5842FF67553EFF66553EFF64533CFF65533EFF6E5A44FF7964
      4DFF907A65FF484547FF0202045100000000000000000000000417191CBE5A57
      68FF5F5D84FF3D4378FF353E7AFF333D7CFF313B7AFF343D78FF424679FF5152
      7EFF726D89FF44434CFF0202045100000000000000000000000417171CBE5A60
      6BFF5E798BFF3A6881FF326782FF306985FF2D6683FF326380FF406881FF4F70
      87FF70838EFF44464CFF0202045100000000068DBEFF8AEAFCFF76DCF3FF1396
      C3FF93EFFDFF92F0FDFF93F0FDFF93F0FDFF93F0FEFF5CC0A2FF0D8016FF25AF
      3DFF0D7C25FFB2ECE8FFB7EFF5FF068DBEFF00000000020303403D3A3BFF6D59
      44FF615039FF64533BFF6C5940FF6C5B42FF67573FFF5F4D38FF5E4C37FF5E4C
      38FF715C46FF706255FF18181CBC000000020000000003030340353744FF4447
      76FF2D3779FF2B3981FF2F3D8BFF2C3C90FF28398CFF23327EFF283477FF2D37
      72FF45497AFF595870FF18191BBC000000020000000003020340363C45FF4265
      7DFF296583FF266C8AFF287591FF257998FF217494FF1E6588FF255F80FF2B5B
      7AFF436983FF596874FF18181BBC00000002068DBEFF93F0FEFF93F0FDFF1597
      C5FF068DBEFF068DBEFF068DBEFF068DBEFF058279FF0F821AFF36C255FF33C2
      51FF26AF3DFF077A2FFF068BB3FF068DBEFF000000000A0B0D8249413AFF604E
      37FF62523BFF705F46FF75634AFF78654DFF75644AFF6D5D44FF64523CFF5C4D
      37FF604F39FF6E5C4AFF333235ED00010120000000000C0C0C82323756FF2833
      7CFF283685FF334393FF34459BFF3547A0FF32459CFF2C3E95FF253589FF2232
      7DFF2C3878FF4B4D74FF313137ED00010120000000000C0B0C8231485AFF2463
      86FF226D8DFF2C7E9AFF2B86A2FF2C8BA6FF2A88A3FF257C9BFF1E6E90FF1D63
      86FF296181FF4A677BFF313337ED00000120068DBEFF9BF5FEFF9AF6FEFF9AF6
      FEFF9BF5FDFF9BF6FEFF9AF6FEFF62C3A2FF12841EFF42CC67FF40CD64FF3AC8
      5BFF33C352FF26B03EFF045B08CF0007011000000000101217A5473C33FF6150
      39FF73634AFF7D6D52FF816F55FF817056FF827156FF7E6E54FF78674DFF6A59
      41FF62513AFF6C5A44FF3E3B3DFF0002023900000000121214A5242D5DFF2132
      87FF32449AFF3A4DA5FF3C4FAAFF3D4FABFF3D50ACFF3A4EAAFF3547A0FF293B
      90FF223387FF3E457DFF393A45FF0202023900000000121212A5234862FF1B6C
      90FF2A86A1FF3292AAFF3296AFFF3397B0FF3399B0FF3196AEFF2D8BA6FF2178
      97FF1C6D8FFF3B6B85FF393E46FF02020239068DBEFFFEFEFEFFA0FBFFFFA0FB
      FEFFA0FBFEFFA1FAFEFF6FD0B1FF047009FF12851EFF168A24FF3AC05AFF40CD
      65FF34BD52FF0F851BFF07750DFF045B08CF000000000F11149C453C33FF6B5B
      3FFF7B6B50FF89785DFF968669FF9A8A6CFF99896CFF958569FF8B795EFF7B6A
      50FF6B5941FF6B5A43FF393738FC01010234000000001111119C222C5FFF273B
      92FF394CA5FF4357B3FF4E62C1FF5166C5FF5166C5FF4D61C0FF4458B5FF384A
      A3FF2A3A92FF32408BFF313443FC0202013400000000110F119C204B64FF207B
      9AFF2F91AAFF39A2B7FF43B2C5FF46B7C8FF45B6C8FF42B1C4FF3AA4B9FF2F8F
      A9FF217999FF2C7592FF303B43FC02010134022B394D068DBEFFFEFEFEFFA5FE
      FFFFA5FEFFFFA5FEFFFF068DBEFF068DBEFF068DBEFF057E63FF3ABE5BFF47D3
      6FFF2EB14AFF033905800000000000000000000000000608096D423C37FF6F5E
      43FF837258FF99896CFFAB9C7CFFB7A687FFB8A889FFB3A283FFA49274FF8978
      5DFF756449FF625340FF24262AE000000012000000000808086D283056FF2A3E
      97FF3F52AEFF5266C4FF6074D4FF6A80DDFF6C82DEFF647AD9FF586CCCFF4457
      B3FF31449EFF2E3C83FF23242DE000000012000000000806086D26475AFF2281
      9FFF359BB2FF47B6C7FF53C9D6FF5DD3DEFF5DD5DFFF57CFDAFF4BBFCEFF39A2
      B8FF2988A5FF296D89FF23282DE00000001200000000022B394D068DBEFF068D
      BEFF068DBEFF068DBEFF022B394D0000000000000000033905803FC263FF4ED9
      79FF1E9630FF00150230000000000000000000000000010101252D2D30F46C5D
      46FF8C7B5EFFA79677FFC0B293FFD4CBA9FFD9D1AFFFCCBF9DFFB3A181FF9281
      65FF7C6A4EFF4F473EFF0C0F129B000000000000000001010125262A38F42F40
      91FF4458B8FF5E73D0FF7A91E5FF8CA4F0FF8DA7F1FF7D96E9FF687DD8FF4B5F
      BCFF374AA9FF2F3867FF0F0F0F9B000000000000000001010125253038F4287C
      97FF39A6BDFF53C5D2FF6DDDE5FF7CEBF0FF7CEEF1FF6EE3EAFF5BD0DAFF40AD
      C0FF2D92AFFF2C576BFF0F0C0F9B000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035406BF52D97EFF4FD7
      7BFF08680FDF00000000000000000000000000000000000000000A0B0F8B4842
      3EFF8A795BFFAF9E7CFFCFC4A4FFE9E6D0FFEDEAD7FFDDD6B6FFBDAC8BFF9886
      66FF675B47FF29292FF0000000280000000000000000000000000D0D0D8B2F37
      5DFF4155B6FF6278D9FF89A1EEFFAECBFDFFB3D0FFFFACC2F8FF758BE2FF4D63
      C5FF37468CFF282933F0000000280000000000000000000000000D0A0D8B2C4F
      60FF36A3BBFF55CFDBFF7AE9EEFF9FFCFCFFA2FEFEFF9FF5F8FF68DAE3FF42B5
      C9FF317991FF262B33F000000028000000000000000000000000000000000000
      000000000000000000000000000000000000011C0340239B38FF57E087FF1E94
      30FF012303500000000000000000000000000000000000000000000000091414
      19B74F4A44FF96876AFFCCBF9BFFE8E2C8FFECE6CFFFD9CFADFFAE9E7CFF6D61
      50FF313134F90405065700000000000000000000000000000000000000091616
      16B7353D67FF5064BFFF7A95F0FFA5C2FFFFABC8FFFF93ACFAFF6177D8FF3B49
      90FF2A2D3CF90505055700000000000000000000000000000000000000091614
      16B7315A69FF45B1C2FF6CE9F1FF96FFFFFF9AFFFFFF85F5FAFF54CDDAFF3480
      94FF29343CF90504045700000000000000000000000000000000000000000000
      000000000000000000000015023003390580148620FF4DD276FF239B38FF0345
      069F000000000000000000000000000000000000000000000000000000000000
      000B0A0B0F90343336F5696258FF8F8672FF938A75FF797062FF4A4643FF1D1D
      24D30202044B0000000000000000000000000000000000000000000000000000
      000B0E0E0E902B2F41F5455085FF596AAEFF5C6CB3FF4A5998FF343C5FFF1D1E
      24D30404024B0000000000000000000000000000000000000000000000000000
      000B0E0A0C902A3942F53F7985FF50A5AEFF52AAB4FF438D99FF315461FF1D1E
      24D30402024B0000000000000000000000000000000000000000000000000000
      000000000000046208DF047009FF097711FF198D28FF045B08CF012303500000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101012E070809790D0F13AA101217B40A0B1098030305590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000101012E08080879111111AA121213B40D0D0D98040403590000
      000F000000000000000000000000000000000000000000000000000000000000
      0000000000000101012E08060879110D11AA131013B40D0A0D98040303590000
      000F00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object FileOpenDialogFolder: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Title = 'Choose a folder with .aud .ttarch  or .ttarch2 files'
    Left = 40
    Top = 480
  end
  object ImageListLarge: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 224
    Top = 480
    Bitmap = {
      494C010109000D00140020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000080000
      0015000000220000002B0000002F00000030000000300000002F0000002C0000
      0024000000160000000900000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000020000000D000000230000003D0000
      005A00000075000000870000008E0000008F0000008F0000008E000000880000
      00780000005D00000040000000250000000E0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000080000001F0000004600030083001200C20023
      01E9002B01FA002C01FF002801FF002600FF002500FF002400FC001D01F10011
      00D8000400B20000009400000074000000480000002000000009000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000D0000003100050081002301E4003902FF015204FF0164
      05FF016A06FF016A07FF016206FF015C06FF015805FF004C04FF004003FF0030
      02FF002300FF001D00F1000700C20000009400000067000000330000000D0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010000000D00000044001700C3003B02FF016505FF028F09FF028A09FF0280
      08FF027C08FF017A08FF017908FF017808FF017308FF016A07FF016106FF0155
      05FF004A04FF003302FF002200FF001600E5000200AD000000790000003A0000
      000D000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      000D00000044002701E6014D04FF02970BFF029D0BFF02980AFF02950AFF0293
      0AFF02960AFF02970AFF02980AFF02980AFF02960AFF02920AFF028A09FF027C
      08FF016907FF015605FF004904FF002902FF001F00F5000200B20000007C0000
      00390000000D0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000080000
      003E002701E5025A08FF05A114FF04A010FF039E0CFF029D0BFF029D0BFF029D
      0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E0BFF029D0BFF0299
      0AFF028F09FF027C08FF016306FF004F05FF002E02FF001F00F5000200B20000
      0079000000320000000900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000020000002D0026
      01E2035B0BFF08A41CFF07A318FF05A115FF04A011FF039F0EFF029E0BFF029E
      0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E0BFF029E
      0BFF029D0BFF02970AFF028609FF016A07FF015205FF003102FF002101F50002
      00AC000000660000001F00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000D001400AE024F
      09FF0CA726FF0AA621FF09A51DFF07A419FF06A115FF04A012FF039F0EFF029E
      0BFF029E0BFF039F0CFF2DB538FF9EE0A4FF8CD993FF0AA414FF029E0BFF029E
      0BFF029E0BFF029E0BFF029A0BFF028A09FF016A07FF015405FF002F02FF0017
      00E300000094000000460000000D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000010003004C013C03FF0EA1
      2CFF0EA92BFF0CA727FF0BA622FF09A51EFF08A41AFF06A316FF05A112FF03A0
      0FFF029E0CFF2DB538FFFFFFFFFFFFFFFFFFFFFFFFFFC4EDC7FF0AA414FF029E
      0BFF029E0BFF029E0BFF029E0BFF029A0BFF028709FF016506FF015405FF002B
      01FF000700BF0000007300000024000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000008002501CE086F19FF12AC
      35FF10AA30FF0EA92CFF0CA727FF0BA623FF09A51FFF08A41BFF06A317FF07A3
      15FF04A010FF6ACE74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4EDC7FF0AA4
      14FF029E0BFF029E0BFF029E0BFF029E0BFF02980AFF027E08FF015F06FF0043
      03FF002201EF000000920000003E000000080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000010032024905FF14A73BFF14AD
      3BFF12AC36FF10AB31FF0EAA2CFF0DA928FF0BA724FF0AA520FF0AA51EFF07A3
      18FF05A115FF17AC27FFEBF8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4ED
      C7FF0AA414FF029E0BFF029E0BFF029E0BFF029D0BFF029109FF017208FF0162
      06FF003101FF000400B10000005B000000150000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000100183086D18FF17B045FF16AF
      40FF14AD3CFF12AC37FF10AB33FF0FAA2EFF0DA92AFF0CA725FF0AA621FF09A5
      1DFF07A419FF06A115FF24B133FFEBF8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9EE0A4FF029E0BFF029E0BFF029E0BFF029E0BFF029A0BFF028309FF016D
      07FF004803FF001300D400000075000000220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000013003CA119132FF1AB24BFF18B1
      47FF16B041FF15AD3DFF12AC38FF11AB34FF0FAA2FFF0EA92BFF0CA727FF0BA6
      22FF09A51EFF08A41AFF06A316FF24B234FFEBF8EDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8CD993FF029E0BFF029E0BFF029E0BFF029D0BFF028F09FF0179
      08FF016405FF002401EE000000870000002B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000024E05F217A642FF1BB24EFF1BB2
      4DFF19B148FF17B043FF15AF3FFF13AD3AFF12AC34FF10AA30FF0EA92CFF0CA7
      27FF0BA623FF09A51FFF08A41BFF06A317FF25B235FFEBF8EDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF8CD993FF029E0BFF029E0BFF029E0BFF02970AFF0287
      09FF017A08FF003101FB0000008E0000002F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000025C06FF1CB44FFF21B553FF21B5
      53FF1BB24DFF46C471FFBBEACBFFBAEAC9FFBAEAC7FFB8EAC6FFB7E9C5FFB7E9
      C2FFB6E9C1FFB6E9C0FFB5E7BDFFB4E7BCFFB4E7BBFFD8F3DCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF8CD993FF029E0BFF029E0BFF029A0BFF0292
      0AFF02920AFF003401FF0000008F000000300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000026306FF20B552FF2EBB5FFF2EBB
      5FFF1BB24DFFDDF6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF69CE72FF029E0BFF029D0BFF029A
      0BFF029A0BFF003401FF0000008F000000300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000026807FF23B655FF40C16DFF43C4
      71FF1BB24DFFEEFAF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EE0A4FF029E0BFF029E0BFF029D
      0BFF029D0BFF003501FF0000008E0000002F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000036E08FF25B756FF4CC678FF5CCC
      86FF33BC63FF8EDDABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4EDC7FF0AA415FF029E0BFF029E0BFF029E
      0BFF029E0BFF003501FF000000860000002B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000036708F11FAD4BFF50C77CFF77D5
      9AFF4AC676FF1BB24DFF48C575FF48C575FF48C575FF48C574FF47C572FF45C4
      6DFF43C269FF41C165FF40C062FF3EBF5DFF3CBF59FFC9EED1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC5EDCBFF0DA61BFF05A010FF029E0BFF029E0BFF029E
      0BFF029009FF003101FA00000074000000220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000024506C417A33AFF48C575FF89DA
      A7FF6ED395FF2BBA5CFF1BB24DFF1BB24DFF1BB24DFF1BB24DFF1BB24DFF1AB1
      4AFF17B045FF16AF40FF14AD3CFF1CB141FFCAEFD3FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC6EECEFF10A923FF06A115FF04A012FF039F0EFF029E0BFF029E
      0BFF017907FF002401E80000005A000000150000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001902740D9221FF39BF68FF86DA
      A5FF9AE1B5FF53C97EFF22B553FF1BB24DFF1BB24DFF1BB24DFF1BB24DFF1BB2
      4DFF1AB24BFF18B146FF37BD5FFFDCF4E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC7EED0FF14AB2CFF09A51EFF08A41AFF06A316FF05A112FF039F0FFF029E
      0CFF015904FF001100C10000003D000000080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000002002105870EFF27B555FF69D0
      90FFAFE7C4FF8BDCAAFF41C26EFF1FB551FF1BB24DFF1BB24DFF1BB24DFF1BB2
      4DFF1BB24DFF3BC069FFEEFAF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97DE
      A9FF0EA92CFF0CA727FF0BA622FF09A51EFF08A41BFF06A317FF05A113FF0398
      0EFF003B02FF0003008300000023000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000034D06C2129E2CFF46C4
      73FF98E0B4FFBAEACCFF7ED8A0FF3EC16BFF21B553FF1BB24DFF1BB24DFF1BB2
      4DFF1BB24DFF80D8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99E0ADFF12AC
      35FF10AB31FF0EAA2CFF0CA928FF0BA624FF09A520FF08A41BFF06A317FF0268
      09FF002301E4000000460000000D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000050032068E10FF29B7
      57FF64CF8BFFB5E9C9FFBFEDD0FF82D9A1FF44C472FF25B756FF1BB24DFF1BB2
      4DFF1BB24DFF48C575FFFFFFFFFFFFFFFFFFFFFFFFFF9CE1B4FF16AF40FF14AD
      3CFF12AC36FF10AB32FF0FAA2DFF0DA929FF0CA725FF0AA621FF089D1BFF003B
      02FF000500810000001F00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000012C04930E9A
      20FF35BD65FF78D59CFFC1EDD1FFC7EFD7FF95DEB0FF57CA81FF33BC63FF1FB5
      51FF1BB24DFF1BB24DFF55CA80FF80D8A0FF63CF8AFF1AB24BFF18B146FF17AF
      42FF16AF3EFF14AD39FF12AB34FF0FAA2EFF0EA92AFF0CA726FF024E08FF0017
      00C3000000310000000800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000011035D
      08D1109E26FF3CC06AFF7AD79DFFBBEBCEFFCFF0DCFFB2E9C6FF82D9A3FF57CB
      82FF38BF67FF2ABA5BFF24B656FF20B552FF20B552FF21B653FF27B858FF29B8
      56FF27B751FF1DB245FF15AF3BFF11AB34FF10AA30FF045F0EFF002801E60000
      00440000000D0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0011035D08D1109E26FF36BF66FF68D08FFFA3E3BBFFCAEFD8FFCEF0DAFFB7EA
      CAFF99E0B4FF7ED8A0FF6BD191FF5FCE88FF5BCB84FF5ACB84FF58CB82FF50C7
      7AFF3BC067FF24B650FF17B040FF13AD3AFF066612FF002D02E5000100440000
      000D000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000011035D08D10C981DFF2AB758FF4AC676FF77D59AFF9EE2B7FFB7EA
      CAFFBFEBD0FFBAEACCFFAFE7C5FFA4E3BCFF96E0B1FF82D9A1FF68D08FFF4AC6
      76FF2FBB5FFF1EB44FFF17AA40FF05620FFF013303E20000003E0000000D0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000011012C0493069010FF15A32FFF2DB85AFF42C271FF5ACB
      84FF6DD193FF77D59AFF77D59CFF71D396FF62CE8AFF4DC678FF38BF67FF27B8
      59FF1DAF4CFF0D8425FF025908FF001E02AE0000002D00000008000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000050032034F07C2068F10FF0E9D24FF1AAA
      3EFF25B250FF2CBA5CFF2DBB5DFF2BBA5CFF27B758FF1CAC49FF149D35FF0A82
      1DFF036609FF013804CE0005004C0000000D0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020021001B02740350
      07C4047A0BF104860BFF04820BFF037D0AFF037809FF036708F2024105CA0118
      0283000200320000000800000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000040000
      0013020202280303033003030330030303300303033003030330030303300303
      0330030303300303033003030330030303300303033003030330030303300303
      0330030303300303033003030330030303300303033003030330030303300303
      0330020202280000001300000004000000000000000000000000000000040000
      0013000000280000003000000030000000300000003000000030000000300000
      0030000000300000003000000030000000300000003000000030000000300000
      0030000000300000003000000030000000300000003000000030000000300000
      0030000000280000001300000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000080000
      0015000000220000002B0000002F00000030000000300000002F0000002C0000
      0024000000160000000900000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000080000
      0015010101220303032B0303032F03030330030303300303032F0303032C0202
      0224000000160000000900000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000130606
      064A1414147F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A
      1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A
      1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A1A8F1A1A
      1A8F1414147F0606064A00000013000000000000000000000000000000130000
      004A0000007F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000008F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000008F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000007F0000004A00000013000000000000000000000000000000000000
      0000000000000000000000000000000000020000000D000000230000003D0000
      005A00000075000000870000008E0000008F0000008F0000008E000000880000
      00780000005D00000040000000250000000E0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000020000000D020202230606063D0D0D
      0D5A161616751E1E1E872121218E2222228F2222228F2121218E1E1E1E881717
      17780E0E0E5D06060640020202250000000E0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000161616699595
      95FF959595FF959595FF959595FF959595FF959595FFA7A7A7FFBABABAFFBABA
      BAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABA
      BAFFBABABAFF9E9E9EFF959595FF959595FF959595FF959595FF959595FF9595
      95FF464646CD1414147F020202280000000000000000000000000F0606698132
      33FF813233FF813233FF813233FF813233FF813233FF916565FFA19F9FFFA19F
      9FFFA19F9FFFA19F9FFFA19F9FFFA19F9FFFA19F9FFFA19F9FFFA19F9FFFA19F
      9FFFA19F9FFF894A4BFF813233FF813233FF813233FF813233FF813233FF8132
      33FF1F0C0CCD0000007F00000028000000000000000000000000000000000000
      00000000000000000001000000080000001F0000004600050083011A02C20234
      04E9034305FA024405FF024005FF023D04FF023C04FF023904FC022F04F1011B
      02D8000600B20000009400000074000000480000002000000009000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000080101011F080808461E1E1E83474747C26B6B
      6BE97E7E7EFA838383FF828282FF818181FF818181FF7C7C7CFC707070F15656
      56D8373737B22424249416161674080808480101012000000009000000010000
      0000000000000000000000000000000000000000000000000000959595FFA8A8
      A8FFA6A6A6FFA5A5A5FFA5A5A5FFA5A5A5FF989898FF9F9F9FFFE7E7E7FFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFE7E7E7FFE1E1E1FFDADADAFFD3D3
      D3FFD3D3D3FF9D9D9DFF8F8F8FFF8F8F8FFF8F8F8FFF979797FFA3A3A3FFA1A1
      A1FF959595FF1A1A1A8F03030330000000000000000000000000813233FFAF53
      4FFFAF4746FFAD4444FFAD4444FFAD4444FF8B3637FF884E4EFFF8F3EFFFFCF7
      F3FFFCF7F3FFFCF7F3FFFCF7F3FFFCF7F3FFF7F3EFFFEBE9E6FFE0DDDCFFD4D3
      D3FFD4D3D3FF8F4141FF812222FF812222FF812222FF912E2EFFAB4242FFA140
      40FF813233FF0000008F00000030000000000000000000000000000000000000
      0000000000010000000D0000003100070181023504E4035307FF056D0CFF057E
      0FFF058511FF068512FF057C11FF057710FF05730FFF04670DFF035A0BFF0349
      08FF023A04FF022E03F1000A01C20000009400000067000000330000000D0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000010000000D040404311E1E1E81676767E4888888FF909090FF9595
      95FF979797FF979797FF949494FF939393FF929292FF8E8E8EFF8A8A8AFF8585
      85FF808080FF707070F1414141C22424249411111167040404330000000D0000
      0001000000000000000000000000000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFF9B9B9BFFE7E7E7FF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFE7E7E7FFEAEAEAFFE7E7E7FFE1E1E1FFDADA
      DAFFD3D3D3FF9E9E9EFF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF834546FFF8F3EFFF811E
      1EFF811E1EFF811E1EFF811E1EFFF8F3EFFFFCF7F3FFF7F3EFFFEBE9E6FFE0DD
      DCFFD4D3D3FF934141FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F00000030000000000000000000000000000000000000
      00010000000D00010044012203C3035507FF06800FFF08A516FF07A116FF0798
      14FF079514FF069414FF069314FF069213FF068D13FF068512FF057B10FF0570
      0FFF04650DFF034C09FF023904FF012303E5000300AD000000790000003A0000
      000D000000010000000000000000000000000000000000000000000000000000
      00010000000D080808444A4A4AC3888888FF969696FFA2A2A2FFA0A0A0FF9D9D
      9DFF9C9C9CFF9C9C9CFF9C9C9CFF9B9B9BFF9A9A9AFF979797FF949494FF9191
      91FF8D8D8DFF858585FF7E7E7EFF626262E5333333AD181818790505053A0000
      000D000000010000000000000000000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFF9C9C9CFFE3E3E3FF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFE3E3E3FFE8E8E8FFEBEBEBFFE7E7E7FFDFDF
      DFFFD9D9D9FF9F9F9FFF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF864647FFF3EBE7FF811E
      1EFF811E1EFF811E1EFF811E1EFFEFEBE7FFFAF4F0FFFCF7F4FFF6F0EEFFEAE6
      E3FFDEDCDAFF964343FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F00000030000000000000000000000000000000010000
      000D00010044033A04E605680DFF09AC19FF08B118FF08AD17FF08AA17FF08A9
      17FF08AB17FF08AC17FF08AD17FF08AD17FF08AB17FF07A817FF07A116FF0795
      14FF068412FF05710FFF04640DFF024107FF023103F5000300B20000007C0000
      00390000000D0000000100000000000000000000000000000000000000010000
      000D080808446A6A6AE68E8E8EFFA4A4A4FFA5A5A5FFA4A4A4FFA3A3A3FFA3A3
      A3FFA3A3A3FFA3A3A3FFA4A4A4FFA4A4A4FFA3A3A3FFA2A2A2FFA0A0A0FF9C9C
      9CFF979797FF919191FF8D8D8DFF828282FF737373F5363636B21919197C0505
      05390000000D0000000100000000000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFF9C9C9CFFDDDDDDFF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFDBDBDBFFE4E4E4FFE9E9E9FFEAEAEAFFE5E5
      E5FFDFDFDFFFA0A0A0FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF874748FFEAE1DCFF811E
      1EFF811E1EFF811E1EFF811E1EFFE2DEDCFFF2EEEAFFFBF6F2FFFCF7F3FFF3EF
      EBFFE7E5E2FF984444FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F00000030000000000000000000000000000000080001
      003E033A04E5087514FF0FB526FF0CB421FF0AB21BFF08B118FF08B118FF08B1
      18FF08B218FF08B218FF08B218FF08B218FF08B218FF08B218FF08B118FF08AE
      17FF07A516FF079514FF057D11FF046A0EFF034708FF023203F5000300B20000
      0079000000320000000900000000000000000000000000000000000000080606
      063E6A6A6AE5939393FFA8A8A8FFA7A7A7FFA6A6A6FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4
      A4FFA1A1A1FF9C9C9CFF959595FF8F8F8FFF848484FF737373F5363636B21818
      1879040404320000000900000000000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFF9E9E9EFFD7D7D7FF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFD0D0D0FFDDDDDDFFE5E5E5FFEAEAEAFFEAEA
      EAFFE4E4E4FFA1A1A1FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF894949FFE1D4D0FF811E
      1EFF811E1EFF811E1EFF811E1EFFD0CCCBFFE6E2DEFFF4EFEBFFFBF7F3FFFBF7
      F3FFF2EDEAFF9A4646FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F000000300000000000000000000000020000002D0339
      04E20A7618FF14B731FF12B62CFF0FB527FF0DB422FF0AB31DFF08B219FF08B2
      18FF08B218FF08B218FF08B218FF08B218FF08B218FF08B218FF08B218FF08B2
      18FF08B118FF08AC17FF079D15FF068512FF056D0EFF034A08FF023404F50003
      00AC000000660000001F000000020000000000000000000000020303032D6868
      68E2949494FFABABABFFA9A9A9FFA8A8A8FFA8A8A8FFA6A6A6FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA3A3A3FF9F9F9FFF979797FF909090FF858585FF747474F53333
      33AC111111660101011F00000002000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFF9F9F9FFFCFCFCFFF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFC2C2C2FFD3D3D3FFDFDFDFFFE6E6E6FFEAEA
      EAFFE9E9E9FFA2A2A2FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF8B4A4BFFD7C7C4FF811E
      1EFF811E1EFF811E1EFF811E1EFFBAB7B5FFD4D1CFFFE9E5E1FFF6F0EDFFFCF7
      F3FFFAF6F2FF9C4847FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F0000003000000000000000000000000D011E02AE096A
      15FF1ABA3DFF17B937FF15B832FF12B72DFF10B528FF0DB423FF0BB31EFF09B2
      19FF08B218FF0AB31AFF46C552FFB2E7B7FFA3E2A9FF17B726FF08B218FF08B2
      18FF08B218FF08B218FF08AF18FF07A116FF068512FF056F0FFF024807FF0225
      03E300000094000000460000000D00000000000000000000000D3C3C3CAE9090
      90FFADADADFFACACACFFABABABFFAAAAAAFFA9A9A9FFA8A8A8FFA6A6A6FFA6A6
      A6FFA5A5A5FFA6A6A6FFBEBEBEFFE8E8E8FFE2E2E2FFABABABFFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA0A0A0FF979797FF919191FF848484FF6161
      61E324242494080808460000000D000000000000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFFA0A0A0FFCACACAFF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFB0B0B0FFC5C5C5FFD5D5D5FFE0E0E0FFE7E7
      E7FFEAEAEAFFA3A3A3FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF8F4C4CFFCFBDBAFF811E
      1EFF811E1EFF811E1EFF811E1EFF9E9D9CFFBFBCBBFFD9D5D3FFEBE7E3FFF7F2
      EFFFFCF7F3FF9E4949FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F0000003000000000000000010004004C05560BFF1EB5
      44FF1DBB43FF1BBA3EFF18B939FF16B834FF13B72EFF11B629FF0EB524FF0BB4
      1FFF09B21AFF46C552FFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D4FF17B726FF08B2
      18FF08B218FF08B218FF08B218FF08AF18FF079E15FF058011FF056F0FFF0243
      05FF000B00BF000000730000002400000001000000010B0B0B4C898989FFADAD
      ADFFAEAEAEFFAEAEAEFFACACACFFABABABFFAAAAAAFFA9A9A9FFA8A8A8FFA7A7
      A7FFA6A6A6FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFABABABFFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF9F9F9FFF969696FF919191FF8282
      82FF404040BF1616167302020224000000010000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFFA2A2A2FFC6C6C6FF8E8E
      8EFF8E8E8EFF8E8E8EFF8E8E8EFFA3A3A3FFB4B4B4FFC8C8C8FFD7D7D7FFE2E2
      E2FFE8E8E8FFA3A3A3FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF924E4EFFCAB6B2FF811E
      1EFF811E1EFF811E1EFF811E1EFF8B8A8AFFA4A3A1FFC4C1BFFFDDD9D7FFEEEA
      E6FFF8F4F0FF9E4949FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F000000300000000000000008033504CE148A2DFF23BE
      4FFF20BC49FF1EBB44FF1BBA3FFF19B93AFF16B835FF14B730FF11B62BFF12B6
      28FF0CB420FF85D98EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D4FF17B7
      26FF08B218FF08B218FF08B218FF08B218FF08AD17FF079714FF057A10FF045E
      0BFF023404EF000000920000003E0000000800000008575757CE9D9D9DFFB1B1
      B1FFAFAFAFFFAFAFAFFFAEAEAEFFACACACFFABABABFFABABABFFA9A9A9FFA9A9
      A9FFA7A7A7FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFABAB
      ABFFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FF9D9D9DFF949494FF8B8B
      8BFF707070EF232323920606063E000000080000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFF9B9B9BFFA2A2A2FFC6C6C6FFBDBD
      BDFFB5B5B5FFAFAFAFFFA8A8A8FFA4A4A4FFA5A5A5FFB8B8B8FFCBCBCBFFDADA
      DAFFE3E3E3FFA2A2A2FF8E8E8EFF8E8E8EFF8E8E8EFF989898FFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFF903838FF954F4FFFCAB6B2FFBAAB
      A7FFABA09EFF9E9897FF939090FF8C8B8AFF8C8C8CFFAAA9A7FFC9C6C4FFE1DC
      D9FFF0EBE9FF9D4848FF811E1EFF811E1EFF811E1EFF972D2DFFBA4848FFAD44
      44FF813233FF0000008F00000030000000000002003207640FFF26BA55FF26BF
      55FF23BE50FF21BD4AFF1EBC45FF1CBB40FF19BA3BFF17B836FF17B834FF12B6
      2CFF0FB527FF2BBE3EFFF0FAF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1
      D4FF17B726FF08B218FF08B218FF08B218FF08B118FF07A716FF068C13FF067C
      11FF024A06FF000600B10000005B00000015040404328E8E8EFFB1B1B1FFB2B2
      B2FFB1B1B1FFB0B0B0FFAFAFAFFFAEAEAEFFADADADFFACACACFFACACACFFA9A9
      A9FFA8A8A8FFB4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FFABABABFFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA2A2A2FF999999FF9595
      95FF858585FF363636B10D0D0D5B000000150000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
      AAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
      AAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFA9A9A9FFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A
      4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A
      4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBB4949FFAD44
      44FF813233FF0000008F00000030000000000117038314882CFF2BC160FF29C0
      5BFF26BF56FF24BE51FF21BD4CFF1FBC47FF1CBB42FF1ABA3CFF17B937FF15B8
      32FF12B72DFF10B528FF3BC24CFFF0FAF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB2E7B7FF08B218FF08B218FF08B218FF08B218FF08AF18FF079B15FF0688
      12FF04630BFF011C02D40000007500000022242424839C9C9CFFB4B4B4FFB4B4
      B4FFB2B2B2FFB1B1B1FFB0B0B0FFAFAFAFFFAEAEAEFFADADADFFACACACFFABAB
      ABFFAAAAAAFFA9A9A9FFBABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE8E8E8FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF9E9E9EFF9898
      98FF8D8D8DFF545454D416161675010101220000000000000000959595FFA9A9
      A9FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
      AAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
      AAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A
      4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A
      4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFBC4A4AFFAD44
      44FF813233FF0000008F0000003000000000044007CA22A74BFF2EC366FF2CC2
      62FF29C15CFF27BF57FF24BE52FF22BD4DFF1FBC48FF1DBB43FF1ABA3EFF18B9
      39FF15B833FF13B72EFF10B629FF3BC34EFFF0FAF1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFA3E2A9FF08B218FF08B218FF08B218FF08B118FF07A516FF0693
      14FF057E0FFF023605EE000000870000002B585858CAAAAAAAFFB6B6B6FFB5B5
      B5FFB4B4B4FFB2B2B2FFB1B1B1FFB1B1B1FFAFAFAFFFAEAEAEFFADADADFFACAC
      ACFFABABABFFAAAAAAFFA9A9A9FFBABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE2E2E2FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA1A1A1FF9C9C
      9CFF959595FF6F6F6FEE1E1E1E870303032B0000000000000000959595FFA9A9
      A9FFA7A7A7FFA4A4A4FFA6A6A6FFA8A8A8FFABABABFFAFAFAFFFB0B0B0FFB1B1
      B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1
      B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFB1B1B1FFAFAFAFFFAAAAAAFFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFB64645FFB04240FFB14342FFB54B4AFFB85352FFBC5959FFBF5E5DFFC061
      5FFFC0615FFFC0615FFFC0615FFFC0615FFFC0615FFFC0615FFFC0615FFFC061
      5FFFC0615FFFC0615FFFC0615FFFC0615FFFC0615FFFBF5A5AFFBC4A4AFFAD44
      44FF813233FF0000008F000000300000000007660DF22AB95DFF30C369FF30C3
      68FF2DC263FF2AC15EFF28C059FF25BF54FF23BE4EFF20BC49FF1DBB44FF1BBA
      3FFF19B93AFF16B835FF14B730FF11B62AFF3CC34FFFF0FAF1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA3E2A9FF08B218FF08B218FF08B218FF08AC17FF079E
      15FF069414FF034706FB0000008E0000002F838383F2B2B2B2FFB7B7B7FFB7B7
      B7FFB5B5B5FFB4B4B4FFB3B3B3FFB2B2B2FFB1B1B1FFAFAFAFFFAEAEAEFFAEAE
      AEFFACACACFFABABABFFABABABFFA9A9A9FFBABABAFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE2E2E2FFA5A5A5FFA5A5A5FFA5A5A5FFA3A3A3FF9F9F
      9FFF9C9C9CFF818181FB2121218E0303032F0000000000000000959595FFA9A9
      A9FF9F9F9FFF949494FF979797FFA3A3A3FFB1B1B1FFBBBBBBFFC2C2C2FFC5C5
      C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5
      C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFBEBEBEFFAAAAAAFFA5A5
      A5FF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FF8C2C27FF90312CFFA04F4BFFB0716CFFBD8C8AFFC6A1A0FFCAAA
      A9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAA
      A9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFCAAAA9FFC69190FFBC4A4AFFAD44
      44FF813233FF0000008F0000003000000000087710FF31C46AFF37C56EFF37C5
      6EFF2FC368FF61D18BFFCAEFD7FFC9EFD5FFC9EFD4FFC8EFD3FFC7EED2FFC7EE
      D0FFC6EECFFFC6EECEFFC5EDCCFFC4EDCBFFC4EDCAFFE1F6E4FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA3E2A9FF08B218FF08B218FF08AF18FF07A8
      17FF07A817FF034D06FF0000008F00000030949494FFB7B7B7FFB9B9B9FFB9B9
      B9FFB6B6B6FFC9C9C9FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFEFEFEFFFEFEFEFFFFAFAFAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2FFA5A5A5FFA5A5A5FFA5A5A5FFA2A2
      A2FFA2A2A2FF868686FF2222228F030303300000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000097D11FF36C56DFF47CA7AFF47CA
      7AFF2FC368FFE5F8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84D98CFF08B219FF08B118FF08AF
      18FF08AF18FF034E06FF0000008F00000030969696FFB9B9B9FFC0C0C0FFC0C0
      C0FFB6B6B6FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FF868686FF2222228F030303300000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000098312FF3AC670FF5ACF88FF5ED1
      8BFF2FC368FFF2FBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2E7B7FF08B219FF08B218FF08B1
      18FF08B118FF034F06FF0000008E0000002F979797FFBABABAFFC7C7C7FFC9C9
      C9FFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FF878787FF2121218E0303032F0000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F00000030000000000A8914FF3CC771FF67D392FF77D8
      9DFF4CCB7DFFA4E5BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D4FF17B727FF08B219FF08B218FF08B2
      18FF08B218FF034F06FF000000860000002B9A9A9AFFBBBBBBFFCCCCCCFFD2D2
      D2FFC1C1C1FFE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFABABABFFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FF878787FF1D1D1D860303032B0000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000097E13F135BF66FF6BD495FF91DF
      AFFF65D390FF2FC368FF63D28FFF63D28FFF63D28FFF63D28EFF62D28CFF60D1
      88FF5ED084FF5CCF80FF5ACE7CFF58CD78FF56CD74FFD5F2DCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD2F1D7FF1CB92FFF0EB420FF08B219FF08B218FF08B2
      18FF07A616FF034906FA00000074000000228A8A8AF1B7B7B7FFCDCDCDFFDCDC
      DCFFCBCBCBFFB6B6B6FFCACACAFFCACACAFFCACACAFFCACACAFFCACACAFFC9C9
      C9FFC8C8C8FFC7C7C7FFC6C6C6FFC6C6C6FFC5C5C5FFF6F6F6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF4F4F4FFAEAEAEFFA8A8A8FFA5A5A5FFA5A5A5FFA5A5
      A5FFA2A2A2FF7F7F7FFA16161674010101220000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F000000300000000006540DC42BB654FF63D28FFFA0E3
      BAFF89DDAAFF43C977FF2FC368FF2FC368FF2FC368FF2FC368FF2FC368FF2EC2
      65FF2BC160FF29C05BFF26BF56FF31C25CFFD6F3DDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD3F2D9FF21BB3AFF10B527FF0DB423FF0BB31DFF09B219FF08B2
      18FF069312FF023604E80000005A000000155B5B5BC4B1B1B1FFCACACAFFE1E1
      E1FFD9D9D9FFBEBEBEFFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB5B5
      B5FFB4B4B4FFB4B4B4FFB2B2B2FFB7B7B7FFF6F6F6FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FFAFAFAFFFA9A9A9FFA8A8A8FFA6A6A6FFA6A6A6FFA5A5
      A5FF9C9C9CFF6A6A6AE80D0D0D5A000000150000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000021E04741CA837FF53CD83FF9DE3
      B8FFAFE8C5FF6ED597FF38C56EFF2FC368FF2FC368FF2FC368FF2FC368FF2FC3
      68FF2EC366FF2CC261FF51CC7AFFE4F7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD4F2DBFF26BD45FF15B833FF13B72EFF10B629FF0EB524FF0BB31FFF09B2
      1AFF05740DFF011A02C10000003D0000000820202074A8A8A8FFC4C4C4FFE1E1
      E1FFE7E7E7FFCFCFCFFFBABABAFFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
      B6FFB6B6B6FFB5B5B5FFC3C3C3FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6FFB2B2B2FFABABABFFAAAAAAFFA9A9A9FFA8A8A8FFA6A6A6FFA6A6
      A6FF929292FF464646C10606063D000000080000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000000200210E9E1DFF3FC570FF84DB
      A6FFC0EDD1FFA2E4BCFF5CD089FF35C56CFF2FC368FF2FC368FF2FC368FF2FC3
      68FF2FC368FF55CE84FFF2FBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACE6
      BBFF1DBB44FF1BBA3FFF18B939FF16B834FF13B72FFF11B62AFF0EB525FF0BAD
      1EFF035507FF00050083000000230000000102020221A1A1A1FFBBBBBBFFD6D6
      D6FFEEEEEEFFE2E2E2FFC7C7C7FFB8B8B8FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
      B6FFB6B6B6FFC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
      E6FFAEAEAEFFAEAEAEFFACACACFFABABABFFAAAAAAFFA9A9A9FFA8A8A8FFA5A5
      A5FF888888FF1E1E1E8302020223000000010000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F000000300000000000000000085A0FC224B245FF61D1
      8DFFADE7C4FFC9EFD8FF97E1B4FF58CF86FF37C56EFF2FC368FF2FC368FF2FC3
      68FF2FC368FF98E1B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEE7BFFF23BE
      4FFF21BD4AFF1EBC45FF1BBB40FF19B93BFF16B836FF14B730FF11B62BFF0983
      16FF023504E4000000460000000D00000000000000005C5C5CC2AEAEAEFFC9C9
      C9FFE7E7E7FFF1F1F1FFDEDEDEFFC6C6C6FFB9B9B9FFB6B6B6FFB6B6B6FFB6B6
      B6FFB6B6B6FFDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFB1B1
      B1FFB0B0B0FFAFAFAFFFAEAEAEFFACACACFFABABABFFABABABFFA9A9A9FF9797
      97FF676767E4080808460000000D000000000000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000000000000006003210A420FF41C7
      72FF7EDAA2FFC5EED5FFCDF1DBFF9AE2B5FF5FD18CFF3CC771FF2FC368FF2FC3
      68FF2FC368FF63D28FFFFFFFFFFFFFFFFFFFFFFFFFFFB0E8C4FF29C05BFF26BF
      56FF24BE50FF21BD4BFF1FBC46FF1CBB41FF1ABA3CFF17B937FF13B12FFF0455
      08FF000701810000001F00000002000000000000000006060632A3A3A3FFBDBD
      BDFFD5D5D5FFF0F0F0FFF3F3F3FFDFDFDFFFC9C9C9FFBBBBBBFFB6B6B6FFB6B6
      B6FFB6B6B6FFCACACAFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8FFB4B4B4FFB2B2
      B2FFB1B1B1FFB0B0B0FFAFAFAFFFAEAEAEFFADADADFFACACACFFA8A8A8FF8888
      88FF1E1E1E810101011F00000002000000000000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
      AFFFAFAFAFFFAFAFAFFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F00000030000000000000000000000000043408931DAF
      36FF4FCC80FF92DFB0FFCFF1DCFFD4F3E0FFAAE6C1FF72D699FF4CCB7DFF35C5
      6CFF2FC368FF2FC368FF70D698FF98E1B4FF7DDAA1FF2EC366FF2CC261FF2AC0
      5DFF29C058FF26BF53FF23BD4EFF1FBC47FF1DBB42FF1ABA3DFF086913FF0122
      03C300000031000000080000000000000000000000000000000035353593ABAB
      ABFFC3C3C3FFDCDCDCFFF4F4F4FFF6F6F6FFE5E5E5FFD0D0D0FFC1C1C1FFB8B8
      B8FFB6B6B6FFB6B6B6FFCFCFCFFFDEDEDEFFD5D5D5FFB6B6B6FFB5B5B5FFB4B4
      B4FFB4B4B4FFB2B2B2FFB1B1B1FFAFAFAFFFAEAEAEFFADADADFF909090FF4A4A
      4AC3040404310000000800000000000000000000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1A1A1A8F03030330000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000008F0000003000000000000000000000000000000011086D
      11D121B23DFF56CE85FF94E0B1FFCAF0D9FFDAF4E4FFC3EED3FF9AE2B6FF72D7
      9AFF52CD82FF42C976FF3BC671FF36C56DFF36C56DFF37C66EFF3EC873FF41C8
      71FF3EC76CFF32C360FF28C055FF22BD4EFF20BC49FF0D7A1EFF033B04E60001
      00440000000D0000000100000000000000000000000000000000000000116D6D
      6DD1ADADADFFC5C5C5FFDDDDDDFFF2F2F2FFF8F8F8FFEFEFEFFFDFDFDFFFD0D0
      D0FFC4C4C4FFBEBEBEFFBBBBBBFFB9B9B9FFB9B9B9FFBABABAFFBCBCBCFFBDBD
      BDFFBCBCBCFFB7B7B7FFB3B3B3FFB1B1B1FFAFAFAFFF969696FF6A6A6AE60808
      08440000000D0000000100000000000000000000000000000000959595FFA9A9
      A9FF9F9F9FFFA7A7A7FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBEBEBEFFA6A6A6FF9E9E
      9EFF959595FF1414147F02020228000000000000000000000000813233FFB551
      4EFFA43B38FFA65550FFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC69190FFB24343FF9F39
      3AFF813233FF0000007F00000028000000000000000000000000000000000000
      0011086D11D121B23DFF50CD81FF83DBA5FFB6EACAFFD6F3E1FFD9F4E3FFC7EF
      D6FFAEE7C4FF97E1B4FF86DCA7FF7AD99FFF76D79CFF75D79CFF73D79AFF6BD4
      94FF55CE82FF3BC66BFF2BC15BFF25BF54FF108123FF034106E5000100440000
      000D000000010000000000000000000000000000000000000000000000000000
      00116D6D6DD1ADADADFFC3C3C3FFD6D6D6FFEAEAEAFFF6F6F6FFF7F7F7FFF1F1
      F1FFE7E7E7FFDEDEDEFFD8D8D8FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCDCD
      CDFFC5C5C5FFBBBBBBFFB4B4B4FFB2B2B2FF999999FF6C6C6CE5080808440000
      000D000000010000000000000000000000000000000000000000959595FFA8A8
      A8FF9D9D9DFFA5A5A5FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBDBDBDFFA2A2A2FF9C9C
      9CFF959595FF0606064A00000013000000000000000000000000813233FFAF53
      4FFF9E3A36FFA1514DFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EF
      EEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFF8EFEEFFC28F8EFFA63F3FFF9737
      38FF813233FF0000004A00000013000000000000000000000000000000000000
      000000000011086D11D11BAD32FF42C773FF65D390FF91DFAFFFB2E9C7FFC7EF
      D6FFCDF0DBFFC9EFD8FFC0EDD2FFB7EACBFFABE7C2FF9AE2B5FF83DBA5FF65D3
      90FF48CA7AFF34C46AFF2ABC5BFF0E7C1FFF044707E20001003E0000000D0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000116D6D6DD1A9A9A9FFBDBDBDFFCBCBCBFFDCDCDCFFE8E8E8FFF1F1
      F1FFF3F3F3FFF1F1F1FFEEEEEEFFEAEAEAFFE6E6E6FFDFDFDFFFD6D6D6FFCBCB
      CBFFC0C0C0FFB8B8B8FFB2B2B2FF979797FF6B6B6BE20606063E0000000D0000
      00010000000000000000000000000000000000000000000000000E0E0E509595
      95FF959595FF9F9F9FFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
      BEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
      BEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFC3C3C3FFB9B9B9FF959595FF9595
      95FF1616166900000013000000040000000000000000000000000C0405508132
      33FF813233FF964844FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1
      B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1
      B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFCAAAA9FFB78989FF813233FF8132
      33FF0F0606690000001300000004000000000000000000000000000000000000
      000000000000000000110434089311A621FF27B648FF46C875FF5DD08BFF75D7
      9CFF88DCA9FF91DFAFFF91DFB0FF8BDDABFF7CD9A1FF68D392FF52CD82FF3FC8
      74FF32C067FF1C9C3CFF097413FF022805AE0001002D00000008000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001135353593A5A5A5FFB0B0B0FFBEBEBEFFC8C8C8FFD1D1
      D1FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD4D4D4FFCCCCCCFFC4C4C4FFBDBD
      BDFFB6B6B6FFA5A5A5FF939393FF3F3F3FAE0303032D00000008000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000060032085C0FC210A520FF1EB13BFF2EBC
      58FF3CC36BFF44C977FF46CA78FF43C977FF3EC773FF31BE64FF26B14FFF179A
      32FF0B8116FF04480ACE0006004C0000000D0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000060606325D5D5DC2A4A4A4FFACACACFFB4B4
      B4FFBABABAFFBEBEBEFFBFBFBFFFBEBEBEFFBCBCBCFFB5B5B5FFAEAEAEFFA3A3
      A3FF979797FF5E5E5ECE0B0B0B4C0000000D0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000002002102200574085D
      0FC40C8F18F10C9D19FF0C9A18FF0B9617FF0B9216FF097E13F206500CCA021E
      0483000300320000000800000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020221212121745E5E
      5EC4909090F1A0A0A0FF9F9F9FFF9E9E9EFF9D9D9DFF8A8A8AF25E5E5ECA2626
      2683050505320000000800000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000400000013000000280000
      00300000002E0000002900000020000000160000000B00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000400000013020202280303
      03300303032E0202022901010120000000160000000B00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000400000013000000280000
      00300000002E0000002900000020000000160000000B00000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000040000
      0013000000280000003000000030000000300000003000000030000000300000
      0030000000300000003000000030000000300000003000000030000000300000
      0030000000300000003000000030000000300000003000000030000000300000
      003000000028000000130000000400000000000000130000004B0000007F0000
      008F0000008D00000082000000700000005B0000004600000034000000290000
      0020000000160000000B00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000130808084B1717177F1D1D
      1D8F1D1D1D8D18181882121212700C0C0C5B0707074603030334020202290101
      0120000000160000000B00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000130000004B0000007F0000
      008F0000008D00000082000000700000005B0000004600000034000000290000
      0020000000160000000B00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000130000
      004A0000007F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000008F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000008F0000008F0000008F0000008F0000008F0000008F0000008F0000
      008F0000007F0000004A000000130000000003131A6B1898CAFF1797C9FF1797
      C9FF1481ABF70E5F80E9093648D2041B25BC0000009A0000008F000000820000
      00700000005B0000004600000034000000270000001D00000013000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001919196BA3A3A3FFA2A2A2FFA2A2
      A2FF929292F7797979E9585858D23F3F3FBC2222229A1D1D1D8F181818821212
      12700C0C0C5B0707074603030334020202270101011D00000013000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000110186B0B80BBFF0A7EBAFF0A7E
      BAFF096C9FF7065177E9042D43D2021721BC0000009A0000008F000000820000
      00700000005B0000004600000034000000270000001D00000013000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000012090969994B
      4CFF994B4CFF994B4CFF994B4CFF994B4CFF994B4CFFA78080FFB5B3B3FFB5B3
      B3FFB5B3B3FFB5B3B3FFB5B3B3FFB5B3B3FFB5B3B3FFB5B3B3FFB5B3B3FFB5B3
      B3FFB5B3B3FFA06566FF994B4CFF994B4CFF994B4CFF994B4CFF994B4CFF994B
      4CFF251212CD0000007F00000028000000001797C9FF42AAD3FFC9EDFBFF5BC4
      ECFF4DBBE5FF3CB0DCFF28A2D2FF1B99CAFF1797C9FF1481ABF70E5F80E90936
      48D2041B25BC0000009A0000008E0000007E0000006A00000055000000410000
      0031000000260000001B0000000F000000050000000100000000000000000000
      000000000000000000000000000000000000A2A2A2FFB3B3B3FFE7E7E7FFC2C2
      C2FFBBBBBBFFB3B3B3FFAAAAAAFFA4A4A4FFA2A2A2FF929292F7797979E95858
      58D23F3F3FBC2222229A1D1D1D8E1717177E1010106A0A0A0A55060606410303
      0331020202260101011B0000000F000000050000000100000000000000000000
      0000000000000000000000000000000000000A7EBAFF2A95C6FFBAE7FAFF40B4
      E6FF34A9DDFF259CD1FF158BC5FF0C81BBFF0A7EBAFF096C9FF7065177E9042D
      43D2021721BC0000009A0000008E0000007E0000006A00000055000000410000
      0031000000260000001B0000000F000000050000000100000000000000000000
      0000000000000000000000000000000000000000000000000000994B4CFFC06E
      6AFFC06261FFBF5F5FFFBF5F5FFFBF5F5FFFA25051FF9F6969FFFAF6F3FFFDF9
      F6FFFDF9F6FFFDF9F6FFFDF9F6FFFDF9F6FFF9F6F3FFF0EEECFFE7E5E4FFDEDD
      DDFFDEDDDDFFA55C5CFF993939FF993939FF993939FFA74747FFBD5D5DFFB55A
      5AFF994B4CFF0000008F00000030000000001797C9FF32A7D3FFE6F4F9FF71D4
      F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF60C8EFFF4CBAE5FF3BAFDCFF28A1
      D1FF1B99CAFF1797C9FF13779FF40D526DE3072D3CCB02131AB4000000970000
      008C0000007C000000660000004E000000390000002B0000001A000000070000
      000000000000000000000000000000000000A2A2A2FFAEAEAEFFEFEFEFFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFC4C4C4FFBBBBBBFFB3B3B3FFAAAA
      AAFFA4A4A4FFA2A2A2FF8C8C8CF46F6F6FE3505050CB383838B4212121971C1C
      1C8C1616167C0F0F0F660808084E040404390202022B0101011A000000070000
      0000000000000000000000000000000000000A7EBAFF1D91C6FFDEF0F7FF56C7
      F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF45B8EAFF33A7DDFF249AD1FF158A
      C4FF0C81BBFF0A7EBAFF096493F4064565E3032637CB011018B4000000970000
      008C0000007C000000660000004E000000390000002B0000001A000000070000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FF9B6061FFFAF6F3FF9933
      33FF993333FF993333FF993333FFFAF6F3FFFDF9F6FFF9F6F3FFF0EEECFFE7E5
      E4FFDEDDDDFFA95C5CFF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF55C5E6FFA7D7EAFFA6E3
      F9FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4
      F8FF70D3F7FF5BC4ECFF47B7E2FF36ACDAFF28A1D1FF1797C9FF1691C0FD1276
      9EF30C4A63DF062430C5000608A40000009200000082000000580000001E0000
      000100000000000000000000000000000000A2A2A2FFBEBEBEFFD7D7D7FFDBDB
      DBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCBCBCBFFC2C2C2FFB9B9B9FFB1B1B1FFAAAAAAFFA2A2A2FF9F9F9FFD8B8B
      8BF3696969DF494949C52A2A2AA41E1E1E92181818820B0B0B580101011E0000
      0001000000000000000000000000000000000A7EBAFF3BB5DEFF91CBE3FF90DA
      F7FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7
      F6FF55C6F4FF40B4E6FF2EA4D9FF2097CFFF158AC4FF0A7EBAFF0A79B3FD0963
      92F3053E5BDF021E2DC5000507A40000009200000082000000580000001E0000
      0001000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FF9D6162FFF6F0EDFF9933
      33FF993333FF993333FF993333FFF3F0EDFFFBF7F4FFFDF9F7FFF8F4F2FFEFEC
      EAFFE6E4E3FFAB5E5EFF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF60C9E8FF65BCDCFFD1F0
      FBFF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4
      F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF71D4F8FF70D3F7FF56C1E9FF43B4
      E0FF31A8D7FF1F9BCCFF1797C9FF1688B5FA0D536FE40000008B0000003D0000
      000900000000000000000000000000000000A2A2A2FFC2C2C2FFC0C0C0FFE9E9
      E9FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFFBFBFBFFFB7B7
      B7FFAEAEAEFFA6A6A6FFA2A2A2FF989898FA717171E41C1C1C8B0505053D0000
      0009000000000000000000000000000000000A7EBAFF45BAE1FF4AAAD1FFC4EB
      FAFF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7
      F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF56C7F6FF55C6F4FF3CB0E2FF2BA0
      D7FF1C92CBFF0F83BEFF0A7EBAFF0973A8FA064767E40000008B0000003D0000
      0009000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FF9E6263FFEFE8E4FF9933
      33FF993333FF993333FF993333FFE9E6E4FFF5F2EFFFFCF8F5FFFDF9F6FFF6F3
      F0FFEDEBE9FFAD5F5FFF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF5FC7E6FF3CB2DAFFEFF7
      FAFF7AD7F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5
      F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5F8FF72D5
      F8FF72D5F8FF72D5F8FF69CEF3FF42ABD4FC1797C9FF020C11AF0000005E0000
      001800000000000000000000000000000000A2A2A2FFC1C1C1FFB3B3B3FFF2F2
      F2FFCECECEFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFC8C8C8FFB1B1B1FCA2A2A2FF323232AF0C0C0C5E0000
      0018000000000000000000000000000000000A7EBAFF44B7DEFF259ECFFFEAF4
      F8FF5FCBF6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9
      F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9F6FF57C9
      F6FF57C9F6FF57C9F6FF4EC0EFFF2B98CCFC0A7EBAFF000A0FAF0000005E0000
      0018000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FFA06464FFE8DEDBFF9933
      33FF993333FF993333FF993333FFDBD8D7FFECE9E6FFF7F3F0FFFCF9F6FFFCF9
      F6FFF5F1EFFFAF6161FF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF5FC7E6FF4FBDE1FFA7D7
      EAFFA9E5F9FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8
      F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8F8FF75D8
      F8FF75D8F8FF75D8F8FF75D8F8FF5AC4EBFF2996C0FA0A4056DA000000800000
      002E00000004000000000000000000000000A2A2A2FFC1C1C1FFBABABAFFD7D7
      D7FFDDDDDDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFC1C1C1FFA2A2A2FA616161DA181818800303
      032E000000040000000000000000000000000A7EBAFF44B7DEFF35ABD8FF91CB
      E3FF93DDF7FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACC
      F6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACCF6FF5ACC
      F6FF5ACCF6FF5ACCF6FF5ACCF6FF40B4E5FF1882B5FA04364FDA000000800000
      002E000000040000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FFA26566FFE0D4D1FF9933
      33FF993333FF993333FF993333FFC9C7C5FFDEDCDAFFEEEBE8FFF8F4F1FFFDF9
      F6FFFBF8F5FFB06362FF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF60C8E8FF58C0E3FF65BC
      DCFFD4F2FBFF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADB
      F8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADBF8FF7ADB
      F8FF7ADBF8FF7ADBF8FF7ADBF8FF5FC7EBFF59C2E9FF1480A9F70000009B0000
      004D00000010000000000000000000000000A2A2A2FFC2C2C2FFBEBEBEFFC0C0
      C0FFEAEAEAFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFC2C2C2FFC0C0C0FF929292F72323239B0808
      084D000000100000000000000000000000000A7EBAFF45B8E1FF3EAFDAFF4AAA
      D1FFC7EEFAFF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0
      F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0F6FF5FD0
      F6FF5FD0F6FF5FD0F6FF5FD0F6FF44B7E5FF3FB1E2FF096B9EF70000009B0000
      004D000000100000000000000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FFA56767FFDACCC9FF9933
      33FF993333FF993333FF993333FFB2B1B0FFCDCBCAFFE2DFDDFFF0EDEAFFF9F5
      F3FFFDF9F6FFB26464FF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF62C9E9FF58BFE3FF3AB0
      D9FFEFF7FAFF86E0F8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDF
      F8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDFF8FF7DDF
      F8FF7DDFF8FF7DDFF8FF7DDFF8FF63CBEBFF7ADAF6FF1C96C7FE062431C80000
      007100000023000000010000000000000000A2A2A2FFC3C3C3FFBEBEBEFFB2B2
      B2FFF2F2F2FFD2D2D2FFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFC3C3C3FFCECECEFFA2A2A2FE4B4B4BC81212
      1271010101230000000100000000000000000A7EBAFF47BAE2FF3EADDAFF239C
      CEFFEAF4F8FF6BD7F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5
      F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5F6FF63D5
      F6FF63D5F6FF63D5F6FF63D5F6FF48BCE5FF5FCFF3FF0D7EB8FE021F2DC80000
      0071000000230000000100000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FFA86969FFD6C6C3FF9933
      33FF993333FF993333FF993333FFA2A1A1FFB7B6B5FFD1CFCDFFE5E2E0FFF2EF
      ECFFFAF7F4FFB26464FF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF64CAECFF5AC1E6FF4FBD
      E2FF99D0E6FFB0ECFAFF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2
      F9FF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2F9FF82E2
      F9FF82E2F9FF82E2F9FF82E2F9FF66CEECFF7DDDF7FF44B6DDFF0F5F7FEA0000
      00910000003E000000090000000000000000A2A2A2FFC4C4C4FFBFBFBFFFBBBB
      BBFFD2D2D2FFDFDFDFFFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFC5C5C5FFCFCFCFFFB6B6B6FF7B7B7BEA1E1E
      1E910505053E0000000900000000000000000A7EBAFF49BBE6FF40B0DEFF35AB
      D9FF81C2DEFF9CE6F8FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9
      F7FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9F7FF67D9
      F7FF67D9F7FF67D9F7FF67D9F7FF4BC0E6FF63D3F4FF2CA3D3FF064F75EA0000
      00910000003E0000000900000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFA65252FFAA6A6AFFD6C6C3FFC9BD
      BAFFBDB4B2FFB2ADACFFA9A6A6FFA3A2A1FFA3A3A3FFBCBBBAFFD5D3D1FFE8E4
      E2FFF4F0EEFFB16363FF993333FF993333FF993333FFAC4646FFC96363FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF66CBEEFF5DC2E9FF5FC5
      EAFF49AFD6FFE7F8FCFF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5
      F9FF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5F9FF86E5
      F9FF86E5F9FF86E5F9FF86E5F9FF6AD1ECFF82E0F7FF75D7F1FF1797C9FF020D
      11B200000060000000180000000000000000A2A2A2FFC5C5C5FFC1C1C1FFC2C2
      C2FFB6B6B6FFF0F0F0FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFD2D2D2FFD2D2D2FFC6C6C6FFD0D0D0FFCBCBCBFFA2A2A2FF3434
      34B20D0D0D600000001800000000000000000A7EBAFF4BBCE9FF42B1E2FF44B5
      E3FF309ACAFFE0F6FBFF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDD
      F7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDDF7FF6BDD
      F7FF6BDDF7FF6BDDF7FF6BDDF7FF4FC4E6FF67D7F4FF5ACBEDFF0A7EBAFF000B
      10B2000000600000001800000000000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB65
      65FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB65
      65FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCA6464FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF68CCEFFF5FC4EBFF5FC4
      EBFF3BB1DAFFE0F0F7FF99EBFAFF8AE9F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9
      F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9F9FF8AE9
      F9FF8AE9F9FF8AE9F9FF8AE9F9FF6FD5ECFF87E4F7FF87E4F7FF33ABD4FF0A41
      55DB000000810000002E0000000400000000A2A2A2FFC6C6C6FFC2C2C2FFC2C2
      C2FFB3B3B3FFECECECFFD8D8D8FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFC8C8C8FFD2D2D2FFD2D2D2FFAEAEAEFF6262
      62DB181818810303032E00000004000000000A7EBAFF4DBDEAFF44B4E5FF44B4
      E5FF249DCFFFD7EBF4FF81E5F8FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2
      F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2F7FF6FE2
      F7FF6FE2F7FF6FE2F7FF6FE2F7FF54C9E6FF6CDCF4FF6CDCF4FF1E96C7FF0436
      50DB000000810000002E00000004000000000000000000000000994B4CFFC56C
      69FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB65
      65FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB65
      65FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFCB6565FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF6BCDF2FF62C5EEFF62C5
      EEFF57C1E8FF7BC4E0FFDAF8FCFF8EECFAFF8EECFAFF8EECFAFF8EECFAFF8EEC
      FAFF8EECFAFF8EECFAFF8EECFAFF8EECFAFF8EECFAFF8EECFAFF8EECFAFF8EEC
      FAFF8EECFAFF8EECFAFF8EECFAFF72D8EDFF8EE8F8FF8DE8F8FF60CAE7FF1480
      A9F70000009A0000004C0000000F00000000A2A2A2FFC8C8C8FFC4C4C4FFC4C4
      C4FFBFBFBFFFC8C8C8FFECECECFFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFC9C9C9FFD4D4D4FFD4D4D4FFC2C2C2FF9292
      92F72222229A0808084C0000000F000000000A7EBAFF50BFEEFF47B5E9FF47B5
      E9FF3DB0E1FF61B4D7FFCFF6FBFF74E6F8FF74E6F8FF74E6F8FF74E6F8FF74E6
      F8FF74E6F8FF74E6F8FF74E6F8FF74E6F8FF74E6F8FF74E6F8FF74E6F8FF74E6
      F8FF74E6F8FF74E6F8FF74E6F8FF57CCE7FF74E1F6FF73E1F6FF45BBE0FF096B
      9EF70000009A0000004C0000000F000000000000000000000000994B4CFFC56C
      69FFC66160FFC15D5BFFC25E5DFFC56665FFC86E6DFFCB7474FFCD7978FFCE7B
      7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B
      7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCE7B7AFFCD7575FFCB6565FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF76D0F4FF64C6F1FF64C6
      F1FF64C6F1FF27A2D1FFA7D7EAFFE9FAFCFFC7F6FBFFC7F6FBFFB3F3FBFFACF2
      FAFFA0F1FAFF92EFFAFF92EFFAFF92EFFAFF92EFFAFF92EFFAFF92EFFAFF92EF
      FAFF92EFFAFF92EFFAFF92EFFAFF77DBEDFF97EDF8FF96EDF8FF95ECF8FF1D97
      C7FE062530C70000006D0000002000000001A2A2A2FFCCCCCCFFC6C6C6FFC6C6
      C6FFC6C6C6FFAAAAAAFFD7D7D7FFF0F0F0FFE6E6E6FFE6E6E6FFE0E0E0FFDEDE
      DEFFDADADAFFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFD6D6D6FFD6D6D6FFD6D6D6FFCACACAFFD7D7D7FFD7D7D7FFD6D6D6FFA2A2
      A2FE494949C71111116D01010120000000010A7EBAFF5BC2F0FF49B6EDFF49B6
      EDFF49B6EDFF158BC4FF91CBE3FFE2F8FBFFB7F3FAFFB7F3FAFF9FEFFAFF97EE
      F8FF89EDF8FF78EAF8FF78EAF8FF78EAF8FF78EAF8FF78EAF8FF78EAF8FF78EA
      F8FF78EAF8FF78EAF8FF78EAF8FF5CD0E7FF7EE7F6FF7DE7F6FF7CE6F6FF0E7F
      B8FE021F2DC70000006D00000020000000010000000000000000994B4CFFC56C
      69FFB75552FFA3443EFFA64A44FFB46A66FFC18B87FFCCA3A1FFD3B5B4FFD6BC
      BBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BC
      BBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD6BCBBFFD3A7A6FFCB6565FFBF5F
      5FFF994B4CFF0000008F00000030000000001797C9FF84D4F6FF67C8F3FF67C8
      F3FF67C8F3FF5DC2EEFF26A0D1FF50B1D6FF5FB7D9FF8BCAE3FF8BCAE3FFC4E4
      F0FFD2EAF3FFF0FBFDFFBDF5FBFFA2F1FBFFA2F1FBFFA2F1FBFFA2F1FBFFA2F1
      FBFF84D7CCFF006500FF78CEBCFF88DDEEFFABF1F9FFABF1F9FFAAF0F9FF57BE
      DEFF0D5470E50000008D0000003900000007A2A2A2FFD1D1D1FFC7C7C7FFC7C7
      C7FFC7C7C7FFC3C3C3FFAAAAAAFFB7B7B7FFBDBDBDFFCDCDCDFFCDCDCDFFE2E2
      E2FFE7E7E7FFF3F3F3FFE3E3E3FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDB
      DBFFC7C7C7FF7D7D7DFFC1C1C1FFCFCFCFFFDDDDDDFFDDDDDDFFDDDDDDFFBCBC
      BCFF737373E51D1D1D8D04040439000000070A7EBAFF69C7F3FF4CB8EFFF4CB8
      EFFF4CB8EFFF42B1E9FF1489C4FF369DCAFF44A4CEFF71BBDAFF71BBDAFFB4DC
      EBFFC5E3EFFFEBFAFCFFABF2FAFF8BEDFAFF8BEDFAFF8BEDFAFF8BEDFAFF8BED
      FAFF69CBBDFF004A00FF5DC0AAFF6DD3E9FF96EDF7FF96EDF7FF95EBF7FF3DAC
      D4FF064667E50000008D00000039000000070000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FF90D8F7FF6CCCF5FF6CCC
      F5FF6CCCF5FF6CCCF5FF6CCCF5FF6CCCF5FF57BFEAFF57BFEAFF48B7E2FF44B5
      E0FF34AAD7FF42AAD3FFE0F0F7FFD7F7FCFFB4F3FBFFB4F3FBFFB4F3FBFF92D8
      CCFF006500FF61F791FF006500FF7CC8C1FFC2F4F9FFC1F4F9FFC1F3F9FFA1E1
      F0FF1797C9FF000608AB0000005B00000016A2A2A2FFD4D4D4FFC9C9C9FFC9C9
      C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC0C0C0FFC0C0C0FFB9B9B9FFB7B7
      B7FFB0B0B0FFB3B3B3FFECECECFFEBEBEBFFE0E0E0FFE0E0E0FFE0E0E0FFCCCC
      CCFF7D7D7DFFC6C6C6FF7D7D7DFFC0C0C0FFE4E4E4FFE4E4E4FFE4E4E4FFD7D7
      D7FFA2A2A2FF2D2D2DAB0C0C0C5B000000160A7EBAFF76CCF4FF51BDF2FF51BD
      F2FF51BDF2FF51BDF2FF51BDF2FF51BDF2FF3DADE3FF3DADE3FF2FA4D9FF2CA1
      D7FF1E95CBFF2A95C6FFD7EBF4FFCBF4FBFFA0EFFAFFA0EFFAFFA0EFFAFF78CC
      BDFF004A00FF46F477FF004A00FF62B8B0FFB1F0F7FFB0F0F7FFB0EFF7FF8AD8
      EBFF0A7EBAFF000508AB0000005B000000160000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FF95DDF7FF72D2F5FF72D2
      F5FF72D2F5FF72D2F5FF72D2F5FF72D2F5FF72D2F5FF72D2F5FF72D2F5FF72D2
      F5FF72D2F5FF61C7EDFF31A6D3FFB5DDEDFFF1FBFDFFCFF6FBFFA1D9CCFF0065
      00FF71EB92FF6AF091FF61F892FF006500FFB0DCCBFFD8F7FAFFD7F6FAFFD7F6
      FAFF3CA8D2FF093749D60000007C00000026A2A2A2FFD6D6D6FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFC3C3C3FFADADADFFDDDDDDFFF3F3F3FFE9E9E9FFD1D1D1FF7D7D
      7DFFC8C8C8FFC7C7C7FFC7C7C7FF7D7D7DFFD6D6D6FFEBEBEBFFEAEAEAFFEAEA
      EAFFB0B0B0FF5B5B5BD61616167C020202260A7EBAFF7CD3F4FF57C5F2FF57C5
      F2FF57C5F2FF57C5F2FF57C5F2FF57C5F2FF57C5F2FF57C5F2FF57C5F2FF57C5
      F2FF57C5F2FF46B7E7FF1C90C6FFA1D3E7FFEDFAFCFFC1F3FAFF8ACEBDFF004A
      00FF56E578FF4FEB77FF46F678FF004A00FF9CD1BCFFCCF4F8FFCBF3F8FFCBF3
      F8FF2592C5FF042D43D60000007C000000260000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FF9AE1F8FF78D7F6FF78D7
      F6FF78D7F6FF78D7F6FF78D7F6FF78D7F6FF78D7F6FF78D7F6FF78D7F6FF78D7
      F6FF78D7F6FF78D7F6FF72D3F3FF3CB0DAFF5FB7D9FFB6D6C9FF006500FF8DE6
      9EFF8CEAA2FF79EC97FF69F191FF61F892FF006500FFB8DDCBFFE3F9FBFFE2F8
      FAFF96D4E8FF1480A9F70000008B0000002EA2A2A2FFD8D8D8FFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCBCBCBFFB3B3B3FFBDBDBDFFD6D6D6FF7D7D7DFFCECE
      CEFFCFCFCFFFCBCBCBFFC7C7C7FFC7C7C7FF7D7D7DFFD8D8D8FFEFEFEFFFEEEE
      EEFFD2D2D2FF929292F71C1C1C8B0303032E0A7EBAFF82D8F6FF5DCBF3FF5DCB
      F3FF5DCBF3FF5DCBF3FF5DCBF3FF5DCBF3FF5DCBF3FF5DCBF3FF5DCBF3FF5DCB
      F3FF5DCBF3FF5DCBF3FF57C6EFFF259CCFFF44A4CEFFA3CABAFF004A00FF73DE
      87FF72E38BFF5EE67EFF4EED77FF46F678FF004A00FFA5D3BCFFDAF7FAFFD9F6
      F8FF7DC7E1FF096B9EF70000008B0000002E0000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FF9EE4F8FF7EDCF6FF7EDC
      F6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDC
      F6FF7EDCF6FF7EDCF6FF7EDCF6FF7EDCF6FF51B8BFFF006500FF9AE2A3FFB6EC
      BFFF9FEAAEFF8CEAA1FF78EC97FF69F191FF61F892FF006500FFC9E0CDFFF4FC
      FCFFE2F4F8FF1797C9FF0000006800000022A2A2A2FFD9D9D9FFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFB1B1B1FF7D7D7DFFD1D1D1FFDDDD
      DDFFD5D5D5FFCFCFCFFFCACACAFFC7C7C7FFC7C7C7FF7D7D7DFFDEDEDEFFF4F4
      F4FFEDEDEDFFA2A2A2FF0F0F0F68010101220A7EBAFF87DCF6FF64D1F3FF64D1
      F3FF64D1F3FF64D1F3FF64D1F3FF64D1F3FF64D1F3FF64D1F3FF64D1F3FF64D1
      F3FF64D1F3FF64D1F3FF64D1F3FF64D1F3FF37A5ADFF004A00FF82D98CFFA3E6
      ADFF88E399FF72E38AFF5DE67EFF4EED77FF46F678FF004A00FFBAD7BFFFF0FB
      FBFFD9F0F6FF0A7EBAFF00000068000000220000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FFA3E8F9FF85E1F7FF85E1
      F7FF85E1F7FF85E1F7FF85E1F7FF85E1F7FF85E1F7FF85E1F7FF85E1F7FF85E1
      F7FF85E1F7FF85E1F7FF85E1F7FF6BCAC9FF006500FF92D997FFDDF4DFFFCFF1
      D3FFB6ECBFFF9FE9AEFF8BEAA1FF78EC97FF69F191FF5BEF89FF006500FF4BAC
      C9FF42AAD3FF1587B4F3000000220000000BA2A2A2FFDBDBDBFFD1D1D1FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFBCBCBCFF7D7D7DFFCCCCCCFFEAEAEAFFE6E6
      E6FFDDDDDDFFD5D5D5FFCFCFCFFFCACACAFFC7C7C7FFC2C2C2FF7D7D7DFFB2B2
      B2FFB3B3B3FF929292F3010101220000000B0A7EBAFF8CE1F7FF6AD8F4FF6AD8
      F4FF6AD8F4FF6AD8F4FF6AD8F4FF6AD8F4FF6AD8F4FF6AD8F4FF6AD8F4FF6AD8
      F4FF6AD8F4FF6AD8F4FF6AD8F4FF50BBBAFF004A00FF78CE7EFFD3F0D5FFC1ED
      C6FFA3E6ADFF88E299FF71E38AFF5DE67EFF4EED77FF40EA6EFF004A00FF3297
      BAFF2A95C6FF0970A6F3000000220000000B0000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FFA7ECF9FF8AE7F8FF8AE7
      F8FF8AE7F8FF8AE7F8FF8AE7F8FF8AE7F8FF8AE7F8FF8AE7F8FF8AE7F8FF8AE7
      F8FF8AE7F8FF8AE7F8FF8AE7F8FF006500FF006500FF006500FF006500FF149B
      1FFFA1E4AAFFB5ECBEFF9EEAADFF6AE487FF006500FF006500FF006500FF0065
      00FF000000240000000C0000000000000000A2A2A2FFDCDCDCFFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF9494
      94FFD4D4D4FFDCDCDCFFD5D5D5FFC3C3C3FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D
      7DFF010101240000000C00000000000000000A7EBAFF91E6F7FF6FE0F6FF6FE0
      F6FF6FE0F6FF6FE0F6FF6FE0F6FF6FE0F6FF6FE0F6FF6FE0F6FF6FE0F6FF6FE0
      F6FF6FE0F6FF6FE0F6FF6FE0F6FF004A00FF004A00FF004A00FF004A00FF0883
      0FFF8ADC95FFA1E6ACFF87E398FF4FDC6CFF004A00FF004A00FF004A00FF004A
      00FF000000240000000C00000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FFB2F1FAFF90ECF8FF90EC
      F8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90EC
      F8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF90ECF8FF2192
      37FFACE4B2FFCDF1D2FFACE6B5FF43B452FF002200C6000000430000000A0000
      000000000000000000000000000000000000A2A2A2FFE0E0E0FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FF9595
      95FFD7D7D7FFE5E5E5FFD8D8D8FFAAAAAAFF444444C6060606430000000A0000
      0000000000000000000000000000000000000A7EBAFF9EEDF8FF76E6F6FF76E6
      F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6
      F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF76E6F6FF1078
      21FF97DC9EFFBFEDC5FF97DEA1FF2BA038FF001900C6000000430000000A0000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F00000030000000001797C9FFDDF9FCFF96F1F9FF96F1
      F9FF96F1F9FF96F1F9FF96F1F9FF96F1F9FF96F1F9FF96F1F9FF96F1F9FFA9F3
      FAFFAFF4FAFFAFF4FAFFA9F3FAFF96F1F9FF96F1F9FF96F1F9FF96F1F9FF1688
      24FFC3EAC6FFDCF4DFFFB7E3BCFF2D9D36FF000B00A000000031000000020000
      000000000000000000000000000000000000A2A2A2FFEDEDEDFFD7D7D7FFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFDDDD
      DDFFDEDEDEFFDEDEDEFFDDDDDDFFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FF8F8F
      8FFFE0E0E0FFEAEAEAFFDADADAFF9C9C9CFF282828A003030331000000020000
      0000000000000000000000000000000000000A7EBAFFD3F7FBFF7DEDF7FF7DED
      F7FF7DEDF7FF7DEDF7FF7DEDF7FF7DEDF7FF7DEDF7FF7DEDF7FF7DEDF7FF93EF
      F8FF9AF0F8FF9AF0F8FF93EFF8FF7DEDF7FF7DEDF7FF7DEDF7FF7DEDF7FF096D
      12FFB2E3B6FFD1F0D5FFA4DAAAFF198620FF000800A000000031000000020000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F0000003000000000093B4FA3B5DDEDFFB1F6FAFF98F3
      F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF88E8F3FF8BCA
      E3FF8BCAE3FF8BCAE3FF8BCAE3FFB5DDEDFFC4E4F0FFBEE3F0FFB0E0F0FF1088
      11FFDBF2DCFFDCF3DEFFA4D6A7FF0A7E22FF000000690000001D000000000000
      000000000000000000000000000000000000414141A3DDDDDDFFDFDFDFFFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD1D1D1FFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFDDDDDDFFE2E2E2FFE0E0E0FFDCDCDCFF8D8D
      8DFFE9E9E9FFEAEAEAFFD1D1D1FF898989FF0F0F0F690101011D000000000000
      000000000000000000000000000000000000043249A3A1D3E7FF9DF3F8FF80EF
      F7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF6DE1EFFF71BB
      DAFF71BBDAFF71BBDAFF71BBDAFFA1D3E7FFB4DCEBFFACDAEBFF9CD7EBFF066D
      06FFD0EED1FFD1EFD4FF8ECA91FF036411FF000000690000001D000000000000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F000000300000000000020321228BB4F0DCF5F9FF98F3
      F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF98F3F9FF5FCBE4FF0B43
      5ACC0210156F010B0F4E010A0E49062835870629368B062B3A94064331CA43A7
      43FFDAF0DAFFD2EDD3FF47AA4BFF024019D8000000390000000A000000000000
      00000000000000000000000000000000000002020221959595F0ECECECFFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFC0C0C0FF5A5A
      5ACC1919196F0E0E0E4E0C0C0C492C2C2C872E2E2E8B33333394515151CAA5A5
      A5FFE9E9E9FFE5E5E5FFA8A8A8FF575757D8040404390000000A000000000000
      000000000000000000000000000000000000000202211276A6F0D1F2F7FF80EF
      F7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF80EFF7FF44BCDCFF0438
      53CC010D146F00090E4E00090D49022131870222328B03253594013423CA2B91
      2BFFCFEBCFFFC5E7C6FF2E9532FF00300DD8000000390000000A000000000000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000008F000000300000000000000000020F145350B1D6FFBDE3
      F0FFB9E7F2FFE4FBFCFFE4FBFCFFD7F9FCFFCBF8FBFFCBF8FBFF2DA3CFFF0107
      0A6A0000002800000019000000190000001D0000002B00020056005F00EFA3DA
      A3FFD9F0D9FF8CCA8DFF026A03F9000200570000001300000001000000000000
      0000000000000000000000000000000000000000000010101053B7B7B7FFE0E0
      E0FFDFDFDFFFEFEFEFFFEFEFEFFFEBEBEBFFE7E7E7FFE7E7E7FFABABABFF1313
      136A0202022800000019000000190101011D0202022B0B0B0B56707070EFD1D1
      D1FFE8E8E8FFC6C6C6FF7A7A7AF90B0B0B570000001300000001000000000000
      00000000000000000000000000000000000000000000010C1253369DCAFFABDA
      EBFFA6E0EEFFDCFAFBFFDCFAFBFFCBF7FBFFBCF6FAFFBCF6FAFF198CC1FF0006
      096A0000002800000019000000190000001D0000002B00010056004900EF8CCF
      8CFFCEEBCEFF72BB73FF005100F9000100570000001300000001000000000000
      0000000000000000000000000000000000000000000000000000994B4CFFC56C
      69FFB75552FFB9706BFFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD3A7A6FFC35E5EFFB353
      54FF994B4CFF0000007F00000028000000000000000000000000020F14530627
      3486093D52A80D5776C70E5876C80E5876C83092B8F142AAD3FF041A23790000
      001F0000002A000000430000005A0000006A000B0096005500EC5EBC5EFFD9F0
      D9FF9DD39EFF0A7B0AFF000E00810000001B0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000101010532B2B
      2B86444444A8616161C7616161C8616161C89B9B9BF1B3B3B3FF212121790101
      011F0202022A060606430B0B0B5A1010106A242424966A6A6AECB4B4B4FFE8E8
      E8FFCECECEFF878787FF1C1C1C810101011B0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000010C12530321
      318604334CA806496DC7074B6EC8074B6EC81D7FABF12A95C6FF011621790000
      001F0000002A000000430000005A0000006A00080096004000EC43AA43FFCEEB
      CEFF86C687FF036103FF000A00810000001B0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000994B4CFFC06E
      6AFFB25450FFB56C68FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3
      F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFFAF3F2FFD0A5A4FFB95959FFAC51
      52FF994B4CFF0000004A00000013000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000014
      0073001B008C001F00A0002C00BE005600E61A911BFF84CC84FFB9DFBAFF59B1
      59FF006C00F70012008100000017000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      19732525258C2E2E2EA0424242BE676767E6939393FFC4C4C4FFDADADAFFAFAF
      AFFF797979F71D1D1D8100000017000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000000E
      00730014008C001700A0002100BE004200E60C770CFF69BD69FFA6D5A7FF3F9D
      3FFF005200F7000D008100000017000000040000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E070750994B
      4CFF994B4CFFAB635FFFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2
      C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2
      C2FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFD6BCBBFFC7A0A0FF994B4CFF994B
      4CFF120909690000001300000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000E0062006500FF006500FF006500FF006500FF006500FF006000EB0031
      00B90003003D0000000B00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000121212627D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF6D6D6DEB4040
      40B90606063D0000000B00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000A0062004A00FF004A00FF004A00FF004A00FF004A00FF004900EB0024
      00B90002003D0000000B00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialogFile: TOpenDialog
    Filter = 'Ttarch and Ttarch2 Bundles|*.ttarch;*.ttarch2'
    Left = 184
    Top = 304
  end
end
