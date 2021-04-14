#define _WCHAR_T
#include "PlanschbeckenOverlay/Planschbecken.h"
#include "SchwimmflugelOverlay/Schwimmflugel.h"
#include <stddef.h>
#include <libcd.h>
#include <stdio.h>

extern "C" u_long load_all_overlays_here;

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
#define str reinterpret_cast<char*>(&load_all_overlays_here)
#endif

int main()
{
	CdInit();
	
	CdReadFile(const_cast<char*>(overlayFile), &load_all_overlays_here, 0);
	CdReadSync(0, nullptr);

	printf(str);
	while(true);

	return 0;
}