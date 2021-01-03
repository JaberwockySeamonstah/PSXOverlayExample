#define _WCHAR_T
#include "PlanschbeckenOverlay/Planschbecken.h"
#include <stddef.h>
#include <libcd.h>
#include <stdio.h>

extern "C" u_long __load_start_ovly0;

int main()
{
	CdInit();
	
	CdReadFile("\\PLANSCH.bin;1", &__load_start_ovly0, 0);
	CdReadSync(0, nullptr);

	return printf(Planschbecken::text);
}