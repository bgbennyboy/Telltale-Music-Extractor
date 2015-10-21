/*******************************************************
Extract from Fmod Bank
Copyright (c) 2015 Bennyboy
Http://quickandeasysoftware.net
*******************************************************/

/*******************************************************
THIS CODE IS HACKY AND PROBABLY VERY WONKY
My knowledge of C++ is very poor so there will be errors.
Please send me corrections and fixes.

Some sounds require callbacks in the original program - to load the data - these wont work as they are for the game to load an external sound and have fmod play them back. Probably just voices. eg:
[WRN] ShadowEventInstance::createProgrammerSound : Programmer sound callback is not set for instrument '{82cc3934-350c-4c29-8160-642000c30dbf}'.
[WRN] EventInstance::createProgrammerSoundImpl : Programmer sound callback for instrument '{82cc3934-350c-4c29-8160-642000c30dbf}' returned no sound.
*******************************************************/

#include "fmod_studio.hpp"
#include "fmod.hpp"
#include "fmod_errors.h"
#include "common.h"
//#include "stdafx.h"
#include <vector>
#include <string>
#include <iostream>
using namespace std;



//Find all .bank files in a given directory and store them in a vector
void GetBankFilesInDirectory(std::vector<std::string> &out, const std::string &directory)
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

		if (strstr(file_data.cFileName, ".bank"))
			out.push_back(full_file_name);
	} while (FindNextFile(dir, &file_data));

	FindClose(dir);
}


void outputEventByID(FMOD::Studio::System* system, const char* ID)
{
	FMOD_RESULT result;

	FMOD::Studio::ID eventID = { 0 };
	ERRCHECK(system->lookupID(ID, &eventID));  //Lookup the ID string from the banks

											   //Use the ID to get the event
	FMOD::Studio::EventDescription* eventDescription = NULL;
	ERRCHECK(system->getEventByID(&eventID, &eventDescription));

	// Create an instance of the event
	FMOD::Studio::EventInstance* eventInstance = NULL;
	ERRCHECK(eventDescription->createInstance(&eventInstance));
	
	//Preload sample data - otherwise some sounds just dont play
	//eventDescription->loadSampleData(); Done need this -  docs say it starts loading sample as soon as eventinstance created
	FMOD_STUDIO_LOADING_STATE  loadingState = FMOD_STUDIO_LOADING_STATE_LOADING;
	system->update();
	ERRCHECK(eventDescription->getSampleLoadingState(&loadingState));
	while (loadingState != FMOD_STUDIO_LOADING_STATE_LOADED)
	{
		//if (eventDescription->getSampleLoadingState(&loadingState)  == FMOD_OK)
		//{
		//	system->update();
		//}
		//else
		//{}
		//Sleep(1);
		ERRCHECK(eventDescription->getSampleLoadingState(&loadingState));
		system->update();
	}

	//Try and stop looping :~ failed
	//FMOD::ChannelGroup* Channels = NULL;
	//eventInstance->getChannelGroup(&Channels);
	//Channels->setMode(FMOD_LOOP_OFF);


	cout << "Dumping " << ID << endl;

	//TODO - delete file if length is 0 - no point having empty files around
	int length = 0;
	result = eventDescription->getLength(&length);
	if (length == 0)
	{
		return;
	}
	float rate = 1024.0f / 48000.0f;
	float newlength = (float)length / 1000; //turn length into seconds
	float totalCalls = (newlength) / rate; // calculate how many calls of our loop we need till the sound has been played
	float totalTime = 0.0f;
	//bool played = false;
	//OutputDebugString(ID); OutputDebugString("\n");

	//Start playback
	ERRCHECK(eventInstance->start()); //starting here seems to work ok
	
	FMOD_STUDIO_PLAYBACK_STATE playbackState = FMOD_STUDIO_PLAYBACK_STOPPED;
	//system->update();
	eventInstance->getPlaybackState(&playbackState);
	while (playbackState != FMOD_STUDIO_PLAYBACK_PLAYING)
	{
		eventInstance->getPlaybackState(&playbackState);
		system->update();
	}

	int TimelinePos = 0;
	int LastPos = -1;
	//for (int i = 0; i < totalCalls; i++)
	while (TimelinePos < length)
	{
		// if(1000 <= totalTime && !played)
		// {
		//// play sound just once
		//  //ERRCHECK( eventInstance->start() );
		//played = true;
		// }


		eventInstance->getTimelinePosition(&TimelinePos);
		char buffer[255 + 1];
		sprintf(buffer, "Timeline Position is %d\n", TimelinePos);
		OutputDebugString(buffer);

		if (LastPos > TimelinePos) //Looping sounds repeat it seems eg mus_loop_tense never reaches timelinepos then starts again
		{
			break;
		}
		LastPos = TimelinePos;
		system->update();
		Sleep(1);
		//Sleep(1.5); //Crucial! Slows it down enough so that sounds start and end at correct time
					//Big hack but still cant fix it. Tried with callbacks and other methods - this
					//Is the only way that 'reliably' works
		//totalTime += (rate * 1000);
		//sprintf(buffer, "TotalTime Position is %f\n", totalTime);
		//OutputDebugString(buffer);
	}

	eventInstance->stop(FMOD_STUDIO_STOP_ALLOWFADEOUT); //FMOD_STUDIO_STOP_ALLOWFADEOUT 

	playbackState = FMOD_STUDIO_PLAYBACK_STOPPING;
	while (playbackState != FMOD_STUDIO_PLAYBACK_STOPPED)
	{
		eventInstance->getPlaybackState(&playbackState);
		system->update();
	}

	eventInstance->release(); //necessary?????
	eventDescription->unloadSampleData();

	system->update();
	loadingState = FMOD_STUDIO_LOADING_STATE_LOADED;
	while (loadingState != FMOD_STUDIO_LOADING_STATE_UNLOADED)
	{
		if (eventDescription->getSampleLoadingState(&loadingState) == FMOD_OK)
		{
			//system->update();
		}
		else
		{
		}
	}

	//eventDescription->releaseAllInstances;
}


int FMOD_Main()
{
	cout << "Tellale Music Extractor" << endl;
	cout << "FMOD Bank Extractor" << endl;
	cout << "Copyright (c) 2015 Bennyboy" << endl;
	cout << "Http://quickandeasysoftware.net" << endl << endl;

	//cout << "Dumping to " << argv[0] << endl << endl;
	cout << "Dumping will take some time, please be patient." << endl << endl;




	void *extraDriverData = 0;
	Common_Init(&extraDriverData);

	//Studio high level system
	FMOD::Studio::System* system = NULL;
	FMOD_RESULT result = FMOD::Studio::System::create(&system);
	ERRCHECK(result);

	//Low level system
	//FMOD::System* lowLevel;
	//system->getLowLevelSystem(&lowLevel);

	//Set output to wav file. NRT means we control the playback speed with update()
	//lowLevel->setOutput(FMOD_OUTPUTTYPE_WAVWRITER_NRT);    




	//Initialise the system. 
	result = system->initialize(32, FMOD_STUDIO_INIT_ALLOW_MISSING_PLUGINS, FMOD_INIT_NORMAL, extraDriverData);
	ERRCHECK(result);


	//Load all .bank files from dir into vector
	std::vector<std::string> FilesInDir;
	GetBankFilesInDirectory(FilesInDir, "C:/Program Files (x86)/FMOD SoundSystem/FMOD Studio API Windows/api/studio/examples/test/");


	//Create vector to hold all the bank instances
	std::vector<FMOD::Studio::Bank* > vbank_;
	int FileArraySize = FilesInDir.size();

	//Set size of the vector to the number of banks and initialise each bank to null 
	vbank_.resize(FileArraySize);
	for (int i = 0; i <= FileArraySize - 1; i++)
	{
		vbank_[i] = NULL; //initialise banks
	}

	//Loop through and load the banks from our bank instances
	for (int i = 0; i <= FileArraySize - 1; i++)
	{
		system->loadBankFile(FilesInDir[i].c_str(), FMOD_STUDIO_LOAD_BANK_NORMAL, &vbank_[i]);
		//Bank loading is asynchronous - so make sure its finished loading before we do operations on it. Easier just to wait here after we load each bank.
		FMOD_STUDIO_LOADING_STATE  bankloadingState = FMOD_STUDIO_LOADING_STATE_LOADING;
		while (bankloadingState != FMOD_STUDIO_LOADING_STATE_LOADED)
		{
			system->update();
			ERRCHECK(vbank_[i]->getLoadingState(&bankloadingState));
		}
	}


	//Preload all samples in all banks
	//for ( int i = 0 ; i <= FileArraySize-1 ; i++ )
	//{
	//	vbank_[i]->loadSampleData();
	//	FMOD_STUDIO_LOADING_STATE  loadingState = FMOD_STUDIO_LOADING_STATE_UNLOADED;
	//	while (loadingState !=FMOD_STUDIO_LOADING_STATE_LOADED)
	//	{
	//		if (vbank_[i]->getSampleLoadingState(&loadingState)  == FMOD_OK)
	//		{
	//			system->update();
	//		}
	//		else
	//		{}
	//	}
	//}


	//Create an array to hold all the Event ID's
	std::vector<std::string> idVector;

	//Get all the event ID's from the banks and store them in idVector
	for (int i = 0; i <= FileArraySize - 1; i++)
	{
		int eventCount = 0;
		int maxLen = 255;
		char buffer[255 + 1];

		vbank_[i]->getEventCount(&eventCount); //get the number of events in the bank

											   //Create an array to hold the eventdescriptions
		FMOD::Studio::EventDescription** eventArray = (FMOD::Studio::EventDescription**)malloc(eventCount * sizeof(void*));

		//Fill the array with the events from the bank
		result = vbank_[i]->getEventList(eventArray, eventCount, &eventCount);
		if (result == FMOD_OK)
		{
			for (int j = 0; j < eventCount; j++)
			{
				//Get the ID
				result = eventArray[j]->getPath(buffer, maxLen, 0);
				if (result == FMOD_OK)
				{
					//OutputDebugString(buffer); OutputDebugString("\n");
					if (strncmp(buffer, "event", 5) == 0) //only add "event" ID's
					{
						idVector.push_back(buffer); //add it as a new element at the end of the vector
					}
				}
				else
				{
					OutputDebugString("OI! couldnt get ID!");
				}
			}
		}

		free(eventArray);
	}


	//Free the system so we can create a new one and control the output filename
	result = system->release();
	ERRCHECK(result);


	//Loop through each ID
	for (int i = 0; i <= idVector.size() - 1; i++)
	{

		//Studio high level system
		FMOD::Studio::System* system = NULL;
		FMOD_RESULT result = FMOD::Studio::System::create(&system);
		ERRCHECK(result);

		//Low level system
		FMOD::System* lowLevel;
		system->getLowLevelSystem(&lowLevel);

		//Set output to wav file. NRT means we control the playback speed with update()
		lowLevel->setOutput(FMOD_OUTPUTTYPE_WAVWRITER_NRT);


		//Extract filename
		std::string tempString = idVector[i];//.c_str();
		std::string filename;
		unsigned found = tempString.find_last_of("/\\");
		filename = tempString.substr(found + 1);
		filename.append(".wav");



		//Initialise the system. 
		//Need STREAM_FROM_UPDATE as we're using WAVWRITER_NRT. Need the synchronous here?? Thread unsafe for low level - dunno
		result = system->initialize(32, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE, FMOD_INIT_STREAM_FROM_UPDATE | FMOD_INIT_THREAD_UNSAFE, (char*)filename.c_str());
		ERRCHECK(result);


		//Loop through and load the banks from our bank instances (banks already stored in array earlier)
		for (int j = 0; j <= FileArraySize - 1; j++)
		{
			system->loadBankFile(FilesInDir[j].c_str(), FMOD_STUDIO_LOAD_BANK_NORMAL, &vbank_[j]);

			//Bank loading is asynchronous - so make sure its finished loading before we do operations on it. Easier just to wait here after we load each bank.
			system->update();
			FMOD_STUDIO_LOADING_STATE  bankloadingState = FMOD_STUDIO_LOADING_STATE_LOADING;
			ERRCHECK(vbank_[j]->getLoadingState(&bankloadingState));
			while (bankloadingState == FMOD_STUDIO_LOADING_STATE_LOADING)
			{

				ERRCHECK(vbank_[j]->getLoadingState(&bankloadingState));
			}
		}




		//Playback and save the file
		outputEventByID(system, idVector[i].c_str());


		//Free the system so we can create a new one and control the output filename
		result = system->release();
		ERRCHECK(result);
		lowLevel->release();
	}




	Common_Close();

	return 0;
}

