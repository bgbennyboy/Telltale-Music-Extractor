#define WIN32_LEAN_AND_MEAN

#include "common.h"
#include <stdio.h>
#include <conio.h>
#include <Windows.h>
#include <vector>


static unsigned int gPressedButtons = 0;
static unsigned int gDownButtons = 0;
static HANDLE gConsoleHandle = NULL;
static CHAR_INFO gConsoleBuffer[NUM_COLUMNS * NUM_ROWS] = {0};
static char gWriteBuffer[NUM_COLUMNS * NUM_ROWS] = {0};
static unsigned int gYPos = 0;
static bool gPaused = false;
static std::vector<char *> gPathList;

int Common_Private_Argc;
char** Common_Private_Argv;
void (*Common_Private_Update)(unsigned int*);
void (*Common_Private_Print)(const char*);
void (*Common_Private_Close)();

int main(int argc, char** argv)
{
    Common_Private_Argc = argc;
    Common_Private_Argv = argv;
    return FMOD_Main(argc, argv);
}

void Common_Init(void** /*extraDriverData*/)
{
    gConsoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);

    CONSOLE_SCREEN_BUFFER_INFO bufferInfo = {0};
    GetConsoleScreenBufferInfo(gConsoleHandle, &bufferInfo);

    // Set window and buffer width, order is important buffer must always be >= window
    unsigned int windowWidth = bufferInfo.srWindow.Left + bufferInfo.srWindow.Right;
    bufferInfo.dwSize.X = NUM_COLUMNS;
    bufferInfo.srWindow.Right = bufferInfo.srWindow.Left + (NUM_COLUMNS - 1);
    if (NUM_COLUMNS > windowWidth)
    {
        SetConsoleScreenBufferSize(gConsoleHandle, bufferInfo.dwSize);
        SetConsoleWindowInfo(gConsoleHandle, TRUE, &bufferInfo.srWindow);
    }
    else
    {       
        SetConsoleWindowInfo(gConsoleHandle, TRUE, &bufferInfo.srWindow);
        SetConsoleScreenBufferSize(gConsoleHandle, bufferInfo.dwSize);
    }

    // Set window and buffer height, order is important buffer must always be >= window
    unsigned int windowHeight = bufferInfo.srWindow.Top + bufferInfo.srWindow.Bottom;
    bufferInfo.dwSize.Y = NUM_ROWS;
    bufferInfo.srWindow.Bottom = bufferInfo.srWindow.Top + (NUM_ROWS - 1);
    if (NUM_ROWS > windowHeight)
    {
        SetConsoleScreenBufferSize(gConsoleHandle, bufferInfo.dwSize);
        SetConsoleWindowInfo(gConsoleHandle, TRUE, &bufferInfo.srWindow);
    }
    else
    {       
        SetConsoleWindowInfo(gConsoleHandle, TRUE, &bufferInfo.srWindow);
        SetConsoleScreenBufferSize(gConsoleHandle, bufferInfo.dwSize);
    }

    // Hide the cursor
    CONSOLE_CURSOR_INFO cursorInfo = {0};
    cursorInfo.bVisible = false;
    cursorInfo.dwSize = 100;
    SetConsoleCursorInfo(gConsoleHandle, &cursorInfo);

    SetConsoleTitleA("FSB Bank Dumper");


	HWND consoleWindow = GetConsoleWindow(); //Need this handle to reposition window									
	ClipOrCenterWindowToMonitor(consoleWindow, MONITOR_CENTER); //Center in main monitor
}

void Common_Close()
{
    for (std::vector<char *>::iterator item = gPathList.begin(); item != gPathList.end(); ++item)
    {
        free(*item);
    }
    if (Common_Private_Close)
    {
        Common_Private_Close();
    }
}

void Common_Update()
{
    /*
        Capture key input
    */
    unsigned int newButtons = 0;
    while (_kbhit())
    {
        int key = _getch();
        if (key == 0 || key == 224)
        {
            key = 256 + _getch(); // Handle multi-char keys
        }

        if      (key == '1')    newButtons |= (1 << BTN_ACTION1);
        else if (key == '2')    newButtons |= (1 << BTN_ACTION2);
        else if (key == '3')    newButtons |= (1 << BTN_ACTION3);
        else if (key == '4')    newButtons |= (1 << BTN_ACTION4);
        else if (key == 256+75) newButtons |= (1 << BTN_LEFT);
        else if (key == 256+77) newButtons |= (1 << BTN_RIGHT);
        else if (key == 256+72) newButtons |= (1 << BTN_UP);
        else if (key == 256+80) newButtons |= (1 << BTN_DOWN);
        else if (key == 32)     newButtons |= (1 << BTN_MORE);
        else if (key == 27)     newButtons |= (1 << BTN_QUIT);
        else if (key == 112)    gPaused = !gPaused;
    }

    gPressedButtons = (gDownButtons ^ newButtons) & newButtons;
    gDownButtons = newButtons;

    /*
        Update the screen
    */
    if (!gPaused)
    {
        for (unsigned int i = 0; i < NUM_COLUMNS * NUM_ROWS; i++)
        {
            gConsoleBuffer[i].Char.AsciiChar = gWriteBuffer[i];
            gConsoleBuffer[i].Attributes = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE;
        }

        COORD bufferSize = {NUM_COLUMNS, NUM_ROWS};
        COORD bufferCoord = {0, 0};
        SMALL_RECT writeRegion = {0, 0, NUM_COLUMNS - 1, NUM_ROWS - 1};
        WriteConsoleOutput(gConsoleHandle, gConsoleBuffer, bufferSize, bufferCoord, &writeRegion);
        fflush(stdout);
    }

    /*
        Reset the write buffer
    */
    gYPos = 0;
    memset(gWriteBuffer, ' ', sizeof(gWriteBuffer));

    if (Common_Private_Update)
    {
        Common_Private_Update(&gPressedButtons);
    }
}

void Common_Sleep(unsigned int ms)
{
    Sleep(ms);
}

void Common_Exit(int returnCode)
{
    exit(returnCode);
}

void Common_DrawText(const char *text)
{
    if (gYPos < NUM_ROWS)
    {
        Common_Format(&gWriteBuffer[gYPos * NUM_COLUMNS], NUM_COLUMNS, "%s", text);
        gYPos++;
    }
}

void Common_LoadFileMemory(const char *name, void **buff, int *length)
{
    FILE *file = NULL;
    file = fopen(name, "rb");
    
    fseek(file, 0, SEEK_END);
    long len = ftell(file);
    fseek(file, 0, SEEK_SET);
    
    void *mem = malloc(len);
    fread(mem, 1, len, file);
    
    fclose(file);

    *buff = mem;
    *length = len;
}

void Common_UnloadFileMemory(void *buff)
{
    free(buff);
}

bool Common_BtnPress(Common_Button btn)
{
    return ((gPressedButtons & (1 << btn)) != 0);
}

bool Common_BtnDown(Common_Button btn)
{
    return ((gDownButtons & (1 << btn)) != 0);
}

const char *Common_BtnStr(Common_Button btn)
{
    switch (btn)
    {
        case BTN_ACTION1:   return "1";
        case BTN_ACTION2:   return "2";
        case BTN_ACTION3:   return "3";
        case BTN_ACTION4:   return "4";
        case BTN_LEFT:      return "LEFT";
        case BTN_RIGHT:     return "RIGHT";
        case BTN_UP:        return "UP";
        case BTN_DOWN:      return "DOWN";
        case BTN_MORE:      return "SPACE";
        case BTN_QUIT:      return "ESCAPE";
        default:            return "Unknown";
    }
}

const char *Common_MediaPath(const char *fileName)
{
    char *filePath = (char *)calloc(256, sizeof(char));

    strcat(filePath, "../media/");
    strcat(filePath, fileName);
    gPathList.push_back(filePath);

    return filePath;
}

const char *Common_WritePath(const char *fileName)
{
	return Common_MediaPath(fileName);
}

void Common_TTY(const char *format, ...)
{
	char string[1024] = { 0 };

	va_list args;
	va_start(args, format);
	Common_vsnprintf(string, 1023, format, args);
	va_end(args);

	if (Common_Private_Print)
	{
		(*Common_Private_Print)(string);
	}
	else
	{
		OutputDebugStringA(string);
	}
}


//Taken from https://msdn.microsoft.com/en-us/library/windows/desktop/dd162826(v=vs.85).aspx
void ClipOrCenterRectToMonitor(LPRECT prc, UINT flags)
{
	HMONITOR hMonitor;
	MONITORINFO mi;
	RECT        rc;
	int         w = prc->right - prc->left;
	int         h = prc->bottom - prc->top;

	// 
	// get the nearest monitor to the passed rect. 
	// 
	hMonitor = MonitorFromRect(prc, MONITOR_DEFAULTTONEAREST);

	// 
	// get the work area or entire monitor rect. 
	// 
	mi.cbSize = sizeof(mi);
	GetMonitorInfo(hMonitor, &mi);

	if (flags & MONITOR_WORKAREA)
		rc = mi.rcWork;
	else
		rc = mi.rcMonitor;

	// 
	// center or clip the passed rect to the monitor rect 
	// 
	if (flags & MONITOR_CENTER)
	{
		prc->left = rc.left + (rc.right - rc.left - w) / 2;
		prc->top = rc.top + (rc.bottom - rc.top - h) / 2;
		prc->right = prc->left + w;
		prc->bottom = prc->top + h;
	}
	else
	{
		prc->left = max(rc.left, min(rc.right - w, prc->left));
		prc->top = max(rc.top, min(rc.bottom - h, prc->top));
		prc->right = prc->left + w;
		prc->bottom = prc->top + h;
	}
}

void ClipOrCenterWindowToMonitor(HWND hwnd, UINT flags)
{
	RECT rc;
	GetWindowRect(hwnd, &rc);
	ClipOrCenterRectToMonitor(&rc, flags);
	SetWindowPos(hwnd, NULL, rc.left, rc.top, 0, 0, SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE);
}


