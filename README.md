# Telltale Music Extractor
Version 1.5.6<br>By Bennyboy<br>[Quick and Easy Software](http://quickandeasysoftware.net/)

A program that enables you to rip the music from the games developed by Telltale Games. This includes games produced by others using the Telltale engine such as Skunkape Games' Sam & Max Save the World.



## New in this version
-  Added support for Sam & Max Save the World
- Added support for The Walking Dead: The Definitive Series.
  
 ## What do I need to use this?  
Just the games themselves.

## How to use it
1. Click on the top folder icon and choose one of the games - the folder and correct music file will be found automatically. You can also click 'open folder' or 'open file' to choose yourself. 

3.  Click on the bottom folder icon and choose a destination folder.  
4. Click Go.  
5. If soundtrack dumping is available for a game then a messagebox will ask you if you want to dump as a soundtrack. See below for an explanation of what this means.

## What games are supported?
All games released so far by Telltale and Skunkape Games. Thats:

-   Back To The Future
-   Batman: The Telltale Series
-   Batman: The Enemy Within
-   Bone: Out From Boneville
-   Bone: The Great Cow Race
-   Crime Scene Investigation - 3 Dimensions of Murder
-   Crime Scene Investigation - Hard Evidence
-   Crime Scene Investigation - Deadly Intent
-   Crime Scene Investigation - Fatal Conspiracy
-   Game of Thrones
-   Guardians of the Galaxy
-   Hector: Badge Of Carnage
-   Jurassic Park
-   Law & Order: Legacies
-   Minecraft Story mode: Season 1
-   Minecraft Story mode: Season 2
-   Nelson Tethers - Puzzle Agent
-   Poker Night At The Inventory
-   Poker Night 2
-   Sam and Max: Season 1:
-   Sam and Max: Season 2:
-   Sam and Max: Season 3:
-   Sam and Max Save the World
-   Strong Bad: Season 1:
-   Tales From The Borderlands
-   Tales Of Monkey Island
-   The Walking Dead Season One (and 400 Days DLC)
-   The Walking Dead Season 2
-   The Walking Dead Michonne
-   The Walking Dead Season 3
-   The Walking Dead Season 4
-   The Walking Dead: The Definitive Series
-   The Wolf Among Us
-   Telltale Texas Hold’em
-   Wallace and Gromit’s Grand Adventure

## Soundtrack support 
Some games are able to be dumped as 'soundtracks'. This means that the music will be dumped as though it were a soundtrack cd, with better filenames and tracknames, tags in the dumped music and (optionally) album art.
  
Dumping as a soundtrack is optional and not available for every game. If its available then a messagebox will ask you if you want to dump the music as a soundtrack.  

## Creating soundtrack files 
Soundtrack support is activated by creating an .ini file and putting it in the 'Soundtracks' folder. At the moment only OGG files are supported for soundtracks, although support for MP3 and WAV files could be added if requested.

The format is fairly straightforward and you can get an idea from looking at the included soundtracks but the following is a brief guide to the structure of a soundtrack ini file.  
  
Each ini must have an \[Info Header\] section that will look something like this:  
  

    [Info Header]  
    Title=Launch of the Screaming Narwhal  
    UniqueFile1=town-glass  
    UniqueFile2=desinge-weird  
    UniqueFile3=restore-winds  
    Album=Tales Of Monkey Island: Launch of the Screaming Narwhal  
    Artist=Michael Land  
    Year=2009  
    Genre=Game  
    Coverart=Tales Of Monkey Island- Launch of the Screaming Narwhal.jpg  

  
UniqueFile 1, 2 and 3 are used to automatically identify the game that the ini corresponds to. These 3 entries should be filenames that are unique and only appear together in that game.  

Album, artist, year and genre are used to create the audio tags in the dumped files. Coverart is optional but should refer to the name of a coverart image in the 'Soundtracks' folder.  
  
The rest of the entries will look something like this:  
  
    [main-theme-short]  
    TrackNo=04  
    Title=Monkey Island Theme  

  
The text between \[\] should be the original filename of the track.  
  
If there are tracks that need to be merged then they need to look like this:  
  

    [jungle]  
    TrackNo=16  
    Title=Flotsam Jungle  
    File1=jungle-doro  
    File2=jungle-voodoo  
    File3=jungle-merfolk  
    File4=jungle-wind1  
    File5=jungle-wind2  
    File6=jungle-wind3  
    File7=jungle-machine  
    File8=jungle-machine-wind1  
    File9=jungle-machine-wind2  
    File10=jungle-machine-wind3  

  
The "File" entries are the original filenames of the tracks that need to be merged. So this example would merge the "jungle" track with the other 10 jungle files listed to make one track called "Flotsam Jungle".  
  
Certain characters arent allowed in Windows filenames (/\\:*?"|) so these are removed from filenames when dumping. They are included in the ID3/comment tags though.  

***There are two exceptions to this:***  

The forward slash character **/**
> If this is used then it becomes **-** in filenames. 
> Eg *Title=Guybrush/Elaine Theme* would become *Guybrush-Elaine Theme.ogg*

The colon character **:**
> If this is used then it becomes **-** in filenames. 
> Eg *Title=Chapter One : The Start* would become *Chapter One - The Start.ogg*

## Limitations and bugs
Originally each episode of a game stored its resources in separate folders. However more recent games store the resources for all episodes in the same folder. All games from The Wolf Among Us onwards do this. If you manually choose the game folder by clicking 'open folder' then the program cant know which episode you want. 
To fix this either choose the specific episode from the menu or choose *open file* and select the individual file that you want to extract the music from.  
  
The tool only rips music. If you want to rip speech then download Telltale Speech Extractor from my [website.](http://quickandeasysoftware.net)  
  
Soundtrack files: At the moment only OGG files are supported for the soundtracks feature, although support for MP3 and WAV files could be added if requested.  
  

## Source
Available from my [Github.](https://github.com/bgbennyboy/Telltale-Music-Extractor)

## Thanks
- [3delite](http://www.3delite.hu) for the Ogg Vorbis and Opus Tag Library.  
- [Anders Jakobsen](http://aezay.site11.com) for his help with the FSB files.  
- [Daniel Gaussmann](http://www.gausi.de) for his MP3FileUtils unit.  
- [Laserschwert](https://twitter.com/laserschwert_) for the soundtrack dumping idea and for providing the soundtrack support and album art for Tales of Monkey Island and Wallace and Gromit.  
- [Luigi Auriemma](http://aluigi.org/index.htm) for his work on the V7 ttarch format and his updated blowfish code.  

## Support 
[Contact me](http://quickandeasysoftware.net/contact).  
  
All my software is completely free. If you find this program useful please consider making a donation. This can be done on my [website.](http://quickandeasysoftware.net)

  

Bennyboy 29/12/20
