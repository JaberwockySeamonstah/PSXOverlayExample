# Example for using Overlays on the PSX without the "PSY-Q toolchain"
This example hopefully gives an example on how to use Overlays without using the toolchain provided by the PSY-Q.

## What is an overlay
Overlays allow you to write code, that is part of your application, but will not be part of the executable. Instead, each overlay land in their own file and can be loaded at runtime, allowing you to actually use the overlay.

Overlays have a predefined address, where they are loaded too. Multiple overlays can have the same loading address, allowing to reduce the size of the main executable and providing a form of dynamic loading.

### Overlays in this example
For this example, we have two overlays - there source files are located in "PlanschbeckenOverlay" and "SchwimmflugelOverlay" - the Overlay.ld describes which object files are part of which overlay, while the makefiles define which sections are part of the overlay - and therefor must be placed in their own files.

The overlays are loaded at the same address, `&load_all_overlays_here` in this example, and occupy the same area in memory, so you can never load them both at the same time. 

Therefore, the main.cpp contains a macro to swap between the overlays. This is done in a static fashion for this example, but can easily be done at runtime as well.

To change which overlay is used, just comment out `#define RUN_OVERLAY1` at line 11. 
At runtime, a different message will appear in pcsx-redux's console, depending on which overlay was loaded.

## Requirements
This example is designed to use VSCode and the WSL system. However, the example in general only relies on the GNU GCC for MIPS. 

1. Download and install WSL *OPTIONAL*
    * Install a Linux destribution like Ubuntu
    * Install _make_ _git_ and _mipsel-linux-gnu_

2. Get VSCode *OPTIONAL*

3. Get mkpsxiso *OPTIONAL*

    Get Lameguys [mkpsxiso](https://github.com/Lameguy64/mkpsxiso) for creating the PSX iso files - or use any other tool you like.

4. Get pcsx-redux

    Get grumpycoders [pcsx-redux](https://github.com/grumpycoders/pcsx-redux)

5. Get the converted PSY-Q libraries

    The converted files can be obtained [here](http://psx.arthus.net/sdk/Psy-Q/). Those files should be placed in the pcsx-redux folder under "pcsx-redux\src\mips\psyq\lib" for easier use

## Setup

1. Adjust Makefile

    Make sure the "PSCX_REDUX" value of the Makefile points to your "pcsx-redux" folder

2. Adjust tasks.json *OPTIONAL*

    The "finalize" command of the tasks.json requires a valid path to your mkpsxiso

3. Adjust OverlayExample.xml *OPTIONAL*

    Make sure the path to the license file in OverlayExample.xml under the config folder is correct or remove this entry.

## Build the example

  * Create the `iso` and `bin` folders at the root of the project.

  * Run `make`.
 
  * Put the generated `.ps-exe`, `.ovly0` and `.ovly1` files in the `bin` folder.

### Building the iso image with mkpsxiso:

```bash
mkpsxiso -y config/OverlayExample.xml
```
The cue/bin will by default be generated in the `iso` folder.

### With VSCode

The tasks.json file provides a "build" and a "rebuild" task that should do the job
