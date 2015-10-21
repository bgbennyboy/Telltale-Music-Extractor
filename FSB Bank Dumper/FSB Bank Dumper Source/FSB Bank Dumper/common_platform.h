#define _CRT_SECURE_NO_WARNINGS

#define MONITOR_CENTER     0x0001        // center rect to monitor 
#define MONITOR_CLIP     0x0000        // clip rect to monitor 
#define MONITOR_WORKAREA 0x0002        // use monitor work area 
#define MONITOR_AREA     0x0000        // use monitor entire area 

#include <windows.h>

int FMOD_Main(int argc, char** argv);

#define COMMON_PLATFORM_SUPPORTS_FOPEN

#define Common_snprintf _snprintf
#define Common_vsnprintf _vsnprintf

void Common_TTY(const char *format, ...);
void ClipOrCenterWindowToMonitor(HWND hwnd, UINT flags);

typedef CRITICAL_SECTION Common_Mutex;

inline void Common_Mutex_Create(Common_Mutex *mutex)
{
    InitializeCriticalSection(mutex);
}

inline void Common_Mutex_Destroy(Common_Mutex *mutex)
{
    DeleteCriticalSection(mutex);
}

inline void Common_Mutex_Enter(Common_Mutex *mutex)
{
    EnterCriticalSection(mutex);
}

inline void Common_Mutex_Leave(Common_Mutex *mutex)
{
    LeaveCriticalSection(mutex);
}

