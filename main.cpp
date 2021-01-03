#define _WCHAR_T
#include "PlanschbeckenOverlay/Planschbecken.h"
#include "SchwimmflugelOverlay/Schwimmflugel.h"
#include <stddef.h>
#include <libcd.h>
#include <stdio.h>

extern "C" u_long __load_start_ovly0;

#define NRUN_OVERLAY1
#define USE_POINTER

#ifdef RUN_OVERLAY1
static const char*const overlayFile = "\\SCHWIMM.bin;1";
#else
static const char*const overlayFile = "\\PLANSCH.bin;1";
#endif

#ifdef USE_POINTER

#ifdef RUN_OVERLAY1
#define str Schwimmfugel::text
#else
#define str Planschbecken::text
#endif

#else
#define str reinterpret_cast<char*>(&__load_start_ovly0)
#endif

int main()
{
	CdInit();
	
	CdReadFile(const_cast<char*>(overlayFile), &__load_start_ovly0, 0);
	CdReadSync(0, nullptr);

	printf(str);
	while(true);

	return 0;
}