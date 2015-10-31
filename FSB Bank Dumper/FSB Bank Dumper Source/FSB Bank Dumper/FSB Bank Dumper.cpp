/*******************************************************
Extract from Fmod Bank
Copyright (c) 2015 Bennyboy
Http://quickandeasysoftware.net
*******************************************************/

/*******************************************************
THIS CODE IS HACKY AND PROBABLY VERY WONKY
My knowledge of C++ is poor so there may be errors.
Please send me corrections and fixes.

Looks in current dir for .FSB files and dumps each sound in them as a wav
*******************************************************/

//#include "fmod_studio.hpp"
#include "fmod.hpp"
#include "fmod_errors.h"
#include "common.h"
//#include "stdafx.h"
#include <vector>
#include <string>
#include <iostream>
#include <shlwapi.h>
#include <direct.h>
using namespace std;



//Find all .fsb files in a given directory and store them in a vector
void GetFSBFilesInDirectory(std::vector<std::string> &out, const std::string &directory)
{
	HANDLE dir;
	WIN32_FIND_DATA file_data;

	if ((dir = FindFirstFile((directory + "/*").c_str(), &file_data)) == INVALID_HANDLE_VALUE)
		return; /* No files found */

	do {
		const std::string file_name = file_data.cFileName;
		const std::string full_file_name = directory + "/" + file_name;
		const bool is_directory = (file_data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != 0;

		if (file_name[0] == '.')
			continue;

		if (is_directory)
			continue;

		if (strstr(file_data.cFileName, ".fsb"))
			out.push_back(full_file_name);
	} while (FindNextFile(dir, &file_data));

	FindClose(dir);
}

string ExePath() {
	char buffer[MAX_PATH];
	GetModuleFileName(NULL, buffer, MAX_PATH);
	string::size_type pos = string(buffer).find_last_of("\\/");
	return string(buffer).substr(0, pos);
}


bool saveSubsoundToFile(FMOD::System* system, const char* FSBName, std::string SoundName, int SubSoundIndex)
{
	FMOD_RESULT       result;
	FMOD::Sound      *sound, *subsound;
	FMOD::Channel    *channel = 0;
	bool			playing = 0;

	result = FMOD::System_Create(&system);
	ERRCHECK(result);


	auto begin = SoundName.find_first_of(" {");
	auto end = SoundName.find_last_of("}") +1 ;
	if (std::string::npos != begin && std::string::npos != end && begin <= end)
		SoundName.erase(begin, end - begin);
	else
	{
		cout << "Couldnt remove {} chars from string! " << SoundName << endl << endl;
		Common_Fatal("%s: Error Couldnt remove {} chars from string! %s", SoundName);
	}



	//Make the output file
	std::string filename(SoundName);
	int li = filename.find_last_of(".");
	std::string wavfile = filename.substr(0, li) + ".wav";
	char *outfile = new char[wavfile.length() + 1];
	std::strcpy(outfile, wavfile.c_str());

	result = system->setOutput(FMOD_OUTPUTTYPE_WAVWRITER_NRT);
	ERRCHECK(result);

	result = system->init(32, FMOD_INIT_STREAM_FROM_UPDATE, outfile);
	ERRCHECK(result);

	result = system->createSound(FSBName, FMOD_CREATECOMPRESSEDSAMPLE | FMOD_LOOP_OFF | FMOD_2D , 0, &sound);
	ERRCHECK(result);

	sound->getSubSound(SubSoundIndex, &subsound);
	ERRCHECK(result);

	//unsigned int SoundLength;
	//subsound->getLength(&SoundLength, FMOD_TIMEUNIT_MS);
	
	//float rate = 1024.0f / 48000.0f;
	//float totalCalls = (SoundLength / 1000) / rate; // SoundLength in seconds
	//double totalCalls = SoundLength / 21.33;
	//int newcalls = (int)ceil(totalCalls);
	//result = system->playSound(subsound, 0, false, &channel);
	//for (int i = 0; i <=  newcalls; i++)
	//{
	//	system->update();
	//}


	channel->setLoopCount(0);
	result = system->playSound(subsound, 0, false, &channel);
	ERRCHECK(result);
	
	do {
		system->update();

		result = channel->isPlaying(&playing);
		if ((result != FMOD_OK) && (result != FMOD_ERR_INVALID_HANDLE) && (result != FMOD_ERR_CHANNEL_STOLEN)) {
			ERRCHECK(result);
		}	

	} while (channel && playing);

	result = subsound->release();
	ERRCHECK(result);
	result = sound->release();
	ERRCHECK(result);
	result = system->release();
	ERRCHECK(result);

	return true;
}


int FMOD_Main(int argc, char** argv)
{
	void             *extradriverdata = 0;
	FMOD::System     *system;
	FMOD::Sound      *sound, *subsound;
	FMOD_RESULT       result;
	//unsigned int      version;
	int               numsubsounds;

	cout << "Tellale Music Extractor" << endl;
	cout << "FMOD Bank Extractor" << endl;
	cout << "Version 0.2" << endl;
	cout << "Copyright (c) 2015 Bennyboy" << endl;
	cout << "Http://quickandeasysoftware.net" << endl << endl;

	if (argc <= 1)
	{
		cout << "No command line output dir! Exiting...";
		exit(EXIT_FAILURE);
	}

	if (PathIsDirectory(argv[1]) == false)  //(DirectoryExists(argv[1]) =false) 
	{
		cout << "Directory is invalid! " << argv[1] << endl << endl;
		cout << "Exiting....";
		exit(EXIT_FAILURE);
	}

	if (_chdir(argv[1]) < 0) 
	{
		cout << "Couldnt switch to output directory " << argv[1] << endl << endl;
		cout << "Exiting....";
		exit(EXIT_FAILURE);
	}

	cout << "Dumping to " << argv[1] << endl << endl;
	cout << "Dumping will take some time, please be patient." << endl << endl;
	cout << "Exe path is " << ExePath() << endl;


	Common_Init(&extradriverdata);

	//result = system->getVersion(&version);
	//ERRCHECK(result);

	//if (version < FMOD_VERSION)
	//{
	//	Common_Fatal("FMOD lib version %08x doesn't match header version %08x", version, FMOD_VERSION);
	//}

	
	//Load all .fsb files from current dir into vector
	std::vector<std::string> FilesInDir;
	GetFSBFilesInDirectory(FilesInDir, ExePath()); 
	int FileArraySize = FilesInDir.size();

	//Loop through each FSB file
	for (int i = 0; i <= FileArraySize - 1; i++)
	{
		result = FMOD::System_Create(&system);
		ERRCHECK(result);

		//Open the FSB - find how many sounds are in it
		result = system->init(32, FMOD_INIT_NORMAL, extradriverdata);
		ERRCHECK(result);

		//Create the sound object for the FSB
		result = system->createSound(FilesInDir[i].c_str(), FMOD_CREATECOMPRESSEDSAMPLE, 0, &sound);
		ERRCHECK(result);

		//Find how many subsounds are in the FSB (the actual music tracks)
		result = sound->getNumSubSounds(&numsubsounds);
		ERRCHECK(result);

		//Loop through all the subsounds and store their names
		std::vector<std::string> SoundNames;
		char name[256];
		for (int j = 0; j <= numsubsounds - 1; j++)
		{
			sound->getSubSound(j, &subsound);
			ERRCHECK(result);

			subsound->getName(name, 256);
			SoundNames.push_back(name); //add it as a new element at the end of the vector
			//cout << SoundNames[j] << endl;

			result = subsound->release();
			ERRCHECK(result);
		}

		//Reset the system object so we can open it with FMOD_OUTPUTTYPE_WAVWRITER_NRT next time
		result = sound->release();
		ERRCHECK(result);
		result = system->release();
		ERRCHECK(result);


		//Loop through each subsound and dump it
		bool saveresult;
		for (int j = 0; j <= numsubsounds - 1; j++)
		{
			cout << "Dumping " << SoundNames[j].c_str() << endl;
			saveresult = saveSubsoundToFile(system, FilesInDir[i].c_str(), SoundNames[j].c_str(), j);
		}
	}

	//result = system->release();
	//ERRCHECK(result);

	Common_Close();

	return 0;
}

