__heap_base = MAX(__ovly0_end, __ovly1_end);

SECTIONS {			
	OVERLAY __bss_end : NOCROSSREFS SUBALIGN(4)
	{
		.ovly0
        {
			KEEP(PlanschbeckenOverlay/*.o(.text))
			__ovly0_ctor = .;
			KEEP(PlanschbeckenOverlay/*.o(.text.startup._GLOBAL__*))
			KEEP(PlanschbeckenOverlay/*.o(.text.*))
			KEEP(PlanschbeckenOverlay/*.o(.rodata*))
            KEEP(PlanschbeckenOverlay/*.o(.sdata*))
			KEEP(PlanschbeckenOverlay/*.o(.data*))
            KEEP(PlanschbeckenOverlay/*.o(.sbss*))
			KEEP(PlanschbeckenOverlay/*.o(.bss*))
			KEEP(PlanschbeckenOverlay/*.o(.ctors))
			
			. = ALIGN(4);
			__ovly0_end = .;			
		}

        .ovly1
        {
			KEEP(SchwimmflugelOverlay/*.o(.text))
			__ovly1_ctor = .;
			KEEP(SchwimmflugelOverlay/*.o(.text.startup._GLOBAL__*))
			KEEP(SchwimmflugelOverlay/*.o(.text.*))
			KEEP(SchwimmflugelOverlay/*.o(.rodata*))
            KEEP(SchwimmflugelOverlay/*.o(.sdata*))
			KEEP(SchwimmflugelOverlay/*.o(.data*))
            KEEP(SchwimmflugelOverlay/*.o(.sbss*))
			KEEP(SchwimmflugelOverlay/*.o(.bss*))
			KEEP(SchwimmflugelOverlay/*.o(.ctors))
			
			. = ALIGN(4);
			__ovly1_end = .;			
		}
	}
}
