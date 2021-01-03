PSX_REDUX = ../../../pcsx-redux/src/mips
TARGET    = OverlayExample
TYPE      = ps-exe
BUILD     = Release

SRCS  = main.cpp
SRCS += PlanschbeckenOverlay/Planschbecken.cpp
SRCS += $(PSX_REDUX)/common/crt0/crt0.s 

CPPFLAGS += -I$(PSX_REDUX)/psyq/include

LDFLAGS += -L$(PSX_REDUX)/psyq/lib
LDFLAGS += -Wl,--start-group
LDFLAGS += -lapi
LDFLAGS += -lc
LDFLAGS += -lc2
LDFLAGS += -lcard
LDFLAGS += -lcomb
LDFLAGS += -lds
LDFLAGS += -letc
LDFLAGS += -lgpu
LDFLAGS += -lgs
LDFLAGS += -lgte
LDFLAGS += -lgun
LDFLAGS += -lhmd
LDFLAGS += -lmath
LDFLAGS += -lmcrd
LDFLAGS += -lmcx
LDFLAGS += -lpad
LDFLAGS += -lpress
LDFLAGS += -lsio
LDFLAGS += -lsnd
LDFLAGS += -lspu
LDFLAGS += -ltap
LDFLAGS += -lcd
LDFLAGS += -Wl,--end-group

include $(PSX_REDUX)/planschi_common.mk