TARGET = mkcsb
CXX = clang++
CC = clang

LDLIB_DIR = -Icocos2d-x/cocos \
						-Icocos2d-x/cocos/2d \
						-Icocos2d-x/cocos/editor-support \
						-Icocos2d-x/external/glfw3/include/mac \
						-Icocos2d-x/extensions \
						-Icocos2d-x/external \
            -Icocos2d-x/external/xxhash \
						-Icocos2d-x/external/tinyxml2 \
						-Icocos2d-x/cocos/platform \
						-Icocos2d-x/external/freetype2/include/mac \
						-Icocos2d-x/external/edtaa3func \
						-Icocos2d-x/external/ConvertUTF \
						-Icocos2d-x/external/unzip \
						-Icocos2d-x/external/lua/tolua \
						-Icocos2d-x/external/lua/lua \
            -Icocos2d-x/external/png/include/mac/ \
            -Icocos2d-x/external/tiff/include/mac \
            -Icocos2d-x/external/jpeg/include/mac \
            -Icocos2d-x/external/webp/include/mac \
            -Icocos2d-x/external/chipmunk/include/chipmunk \
						-Icocos2d-x/cocos/scripting/lua-bindings/manual/ \
						-Icocos2d-x/cocos/audio/include \
						-Icocos2d-x/cocos/audio/mac

CXXFLAGS = -g -std=c++11 

MACROS =  -DUSE_FILE32API \
          -D__APPLE__ \
          -DCC_TARGET_OS_MAC \
          -DPLATFORM_FOLDER=mac \
          -DCOCOS2D_DEBUG=1

DYLIBS = /usr/lib/libz.dylib \
         /usr/lib/libobjc.dylib \
         /usr/lib/libc++abi.dylib \
         $(shell find cocos2d-x/external -name "*.a" | grep mac)

LDFLAGS = -framework OpenGL -framework CoreData -framework AudioToolbox -framework AVFoundation -framework Foundation -framework Cocoa -framework GLKit -framework OpenAL

OBJDIR   = ./obj
SRC_DIR =	cocos2d-x/external/Box2D \
					cocos2d-x/external/chipmunk \
					cocos2d-x/external/ConvertUTF \
					cocos2d-x/external/curl \
					cocos2d-x/external/edtaa3func \
					cocos2d-x/external/flatbuffers \
					cocos2d-x/external/freetype2 \
					cocos2d-x/external/glfw3 \
					cocos2d-x/external/jpeg \
					cocos2d-x/external/json \
					cocos2d-x/external/linux-specific \
					cocos2d-x/external/png \
					cocos2d-x/external/protobuf-lite \
					cocos2d-x/external/sqlite3 \
					cocos2d-x/external/tiff \
					cocos2d-x/external/tinyxml2 \
					cocos2d-x/external/unzip \
					cocos2d-x/external/webp \
					cocos2d-x/external/websockets/include/mac \
					cocos2d-x/external/xxhash \
					cocos2d-x/external/xxtea \
          cocos2d-x/external/lua/tolua \
          cocos2d-x/cocos/editor-support/spine \
          cocos2d-x/cocos/editor-support/cocostudio \
          cocos2d-x/cocos/base \
          cocos2d-x/cocos/2d \
          cocos2d-x/cocos/3d \
          cocos2d-x/cocos/deprecated \
          cocos2d-x/cocos/math \
          cocos2d-x/cocos/physics \
          cocos2d-x/cocos/platform/mac \
          cocos2d-x/cocos/ui \
          cocos2d-x/cocos/renderer \
          cocos2d-x/cocos/audio/mac

OBJC_SRC_DIR = cocos2d-x/cocos/audio/mac \
               cocos2d-x/cocos/platform/apple \
               cocos2d-x/cocos/platform/mac/ \
               cocos2d-x/cocos/base/ \
               cocos2d-x/cocos/ui/UIEditBox/



SINGLE_DEPTH_DIR = cocos2d-x/cocos \
                   cocos2d-x/cocos/platform

CPPSRCS = $(TARGET).cpp \
        $(shell find $(SRC_DIR) -name '*.cpp' | grep -v android | grep -v flatc.cpp) \
        $(shell find $(SINGLE_DEPTH_DIR) -name '*.cpp' -maxdepth 1)

CSRCS = $(shell find $(SRC_DIR) -name '*.c' | grep -v android) 
OBJCXXSRCS = $(shell find $(OBJC_SRC_DIR) -name "*.mm" | grep -v android)
OBJCSRCS = $(shell find $(OBJC_SRC_DIR) -name "*.m" | grep -v android)

OBJS = $(CPPSRCS:.cpp=.o) $(CSRCS:.c=.o) $(OBJCXXSRCS:.mm=.o) $(OBJCSRCS:.m=.o)

%.o: %.c
	$(CC) $(MACROS) $(LDLIB_DIR) -o $@ -c $<

%.o: %.cpp
	$(CXX) $(MACROS) $(LDLIB_DIR) $(CXXFLAGS) -o $@ -c $<

%.o: %.mm
	$(CXX) $(MACROS) $(LDLIB_DIR) $(CXXFLAGS) -ObjC++ -o $@ -c $<

%.o: %.m
	$(CC) $(MACROS) $(LDLIB_DIR) -ObjC -o $@ -c $<

$(TARGET): $(OBJS)
	$(CXX) $(MACROS) $(CXXFLAGS) -o $@ $(DYLIBS) $^ $(LDFLAGS)

all: $(TARGET)

clean:
	rm $(OBJS)

