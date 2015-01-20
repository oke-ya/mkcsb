TARGET = serializer
CXX = clang++
CC = clang

LDLIB_DIR = -I../../../zeron/cocos2d/cocos \
						-I../../../zeron/cocos2d/cocos/2d \
						-I../../../zeron/cocos2d/cocos/editor-support \
						-I../../../zeron/cocos2d/external/glfw3/include/mac \
						-I../../../zeron/cocos2d/extensions \
						-I../../../zeron/cocos2d/external \
            -I../../../zeron/cocos2d/external/xxhash \
						-I../../../zeron/cocos2d/external/tinyxml2 \
						-I../../../zeron/cocos2d/cocos/platform \
						-I../../../zeron/cocos2d/external/freetype2/include/mac \
						-I../../../zeron/cocos2d/external/edtaa3func \
						-I../../../zeron/cocos2d/external/ConvertUTF \
						-I../../../zeron/cocos2d/external/unzip \
						-I../../../zeron/cocos2d/external/lua/tolua \
						-I../../../zeron/cocos2d/external/lua/lua \
            -I../../../zeron/cocos2d/external/png/include/mac/ \
            -I../../../zeron/cocos2d/external/tiff/include/mac \
            -I../../../zeron/cocos2d/external/jpeg/include/mac \
            -I../../../zeron/cocos2d/external/webp/include/mac \
            -I../../../zeron/cocos2d/external/chipmunk/include/chipmunk \
						-I../../../zeron/cocos2d/cocos/scripting/lua-bindings/manual/ \
						-I../../../zeron/cocos2d/cocos/audio/include \
						-I../../../zeron/cocos2d/cocos/audio/mac

CXXFLAGS = -g -std=c++11 

MACROS =  -DUSE_FILE32API \
          -D__APPLE__ \
          -DCC_TARGET_OS_MAC \
          -DPLATFORM_FOLDER=mac \
          -DCOCOS2D_DEBUG=1

DYLIBS = /usr/lib/libz.dylib \
         /usr/lib/libobjc.dylib \
         /usr/lib/libc++abi.dylib \
         $(shell find /Users/yalab/project/oke-ya/zeron/cocos2d/external -name "*.a" | grep mac)

LDFLAGS = -framework OpenGL -framework CoreData -framework AudioToolbox -framework AVFoundation -framework Foundation -framework Cocoa -framework GLKit -framework OpenAL

OBJDIR   = ./obj
SRC_DIR =	/Users/yalab/project/oke-ya/zeron/cocos2d/external/Box2D \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/chipmunk \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/ConvertUTF \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/curl \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/edtaa3func \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/flatbuffers \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/freetype2 \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/glfw3 \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/jpeg \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/json \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/linux-specific \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/png \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/protobuf-lite \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/sqlite3 \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/tiff \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/tinyxml2 \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/unzip \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/webp \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/websockets/include/mac \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/xxhash \
					/Users/yalab/project/oke-ya/zeron/cocos2d/external/xxtea \
          /Users/yalab/project/oke-ya/zeron/cocos2d/external/lua/tolua \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/editor-support/spine \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/editor-support/cocostudio \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/base \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/2d \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/3d \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/deprecated \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/math \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/physics \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/platform/mac \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/ui \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/renderer \
          /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/audio/mac

OBJC_SRC_DIR = /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/audio/mac \
               /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/platform/apple \
               /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/platform/mac/ \
               /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/base/ \
               /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/ui/UIEditBox/



SINGLE_DEPTH_DIR = /Users/yalab/project/oke-ya/zeron/cocos2d/cocos \
                   /Users/yalab/project/oke-ya/zeron/cocos2d/cocos/platform

CPPSRCS = serialize.cpp \
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

