@echo off
echo Trimming wav files
echo This may take a while, please be patient...

if not exist temp mkdir temp  

for %%f in (*.wav) do (
	sox %%~f temp\%%~f reverse silence 1 0.1 0%% reverse
	copy /b/v/y temp\%%~f %%~f >nul
    )

rmdir /s /q temp
