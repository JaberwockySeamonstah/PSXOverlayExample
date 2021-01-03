# Example for using Overlays on the PSX without the "PSY-Q toolchain"
This example hopefully gives an example on how to use Overlays without using the toolchain provided by the PSY-Q.

## What is an overlay
Overlays allow you to write code, that is part of your application, but will not be part of the executable. Instead, each overlay land in their own file and can be loaded at runtime, allowing you to actually use the overlay.

Overlays have a predefined address, where they are loaded too. Multiple overlays can have the same loading address, allowing to reduce the size of the main executable and providing a form of dynamic loading.

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
Copy the "pcsx-redux" folder of this repo to your pcsx-redux folder, this should replace *NO* file but add a new common makefile.

1. Adjust Makefile

    Make sure the "PSX_REDUX" value of the Makefile points to your "pcsx-redux" folder

2. Adjust tasks.json *OPTIONAL*

    The "finalize" command of the tasks.json requires a valid path to your mkpsxiso

3. Adjust OverlayExample.xml *OPTIONAL*

    Make sure the path to the license file in OverlayExample.xml under the config foulder is correct or remove this entry

## Build the example
Running make should be enough

### With VSCode
The tasks.json file provides a "build" and a "rebuild" task that should do the job