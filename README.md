# Example for using Overlays on the PSX without the "PSY-Q toolchain"
This example hopefully gives an example on how to use Overlays without using the toolchain provided by the PSY-Q.

## Requirements
This example is designed to use VSCode and the WSL system. However, the example in general only relies on the GNU GCC for MIPS. 

1. Download and install WSL *OPTIONAL*

1.1. Install a Linux destribution like Ubuntu
1.2. Install _make_ _git_ and _mipsel-linux-gnu_

2. Get VSCode *OPTIONAL*

3. Get mkpsxiso *OPTIONAL*

Get Lameguys [mkpsxiso](https://github.com/Lameguy64/mkpsxiso) for creating the PSX iso files - or use any other tool you like.

4. Get pcsx-redux

Get grumpycoders [pcsx-redux](https://github.com/grumpycoders/pcsx-redux)

5. Get the converted PSY-Q libraries

Those files should be placed in the pcsx-redux folder under "pcsx-redux\src\mips\psyq\lib" for easier use

## Setup
1. Copy the "pcsx-redux" folder of this repo to your pcsx-redux folder, this should replace *NO* file but add a new common makefile.

2. Adjust Makefile

Make sure the "PSX_REDUX" value of the Makefile points to your "pcsx-redux" folder

3. Adjust tasks.json *OPTIONAL*

The "finalize" command of the tasks.json requires a valid path to your mkpsxiso

4. Adjust OverlayExample.xml *OPTIONAL*

Make sure the path to the license file in OverlayExample.xml under the config foulder is correct or remove this entry

## Build the example
Running make should be enough

### With VSCode
The tasks.json file provides a "build" and a "rebuild" task that should do the job