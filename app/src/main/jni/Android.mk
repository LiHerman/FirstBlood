# Copyright 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)

#
# libcameraservice
#

include $(CLEAR_VARS)

# Camera service source

LOCAL_SRC_FILES :=  \
    CameraService.cpp \
    CameraFlashlight.cpp \
    common/Camera2ClientBase.cpp \
    common/CameraDeviceBase.cpp \
    common/CameraModule.cpp \
    common/FrameProcessorBase.cpp \
    api1/CameraClient.cpp \
    api1/Camera2Client.cpp \
    api1/client2/Parameters.cpp \
    api1/client2/FrameProcessor.cpp \
    api1/client2/StreamingProcessor.cpp \
    api1/client2/JpegProcessor.cpp \
    api1/client2/CallbackProcessor.cpp \
    api1/client2/JpegCompressor.cpp \
    api1/client2/CaptureSequencer.cpp \
    api1/client2/ZslProcessor.cpp \
    api2/CameraDeviceClient.cpp \
    device3/Camera3Device.cpp \
    device3/Camera3Stream.cpp \
    device3/Camera3IOStreamBase.cpp \
    device3/Camera3InputStream.cpp \
    device3/Camera3OutputStream.cpp \
    device3/Camera3ZslStream.cpp \
    device3/Camera3DummyStream.cpp \
    device3/StatusTracker.cpp \
    device3/Camera3BufferManager.cpp \
    gui/RingBufferConsumer.cpp \
    utils/CameraTraces.cpp \
    utils/AutoConditionLock.cpp \
    utils/TagMonitor.cpp

LOCAL_SHARED_LIBRARIES:= \
    libui \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libmediautils \
    libcamera_client \
    libgui \
    libhardware \
    libsync \
    libcamera_metadata \
    libjpeg \
    libmemunreachable

LOCAL_C_INCLUDES += \
    system/media/private/camera/include \
    frameworks/native/include/media/openmax \
    external/jpeg

LOCAL_EXPORT_C_INCLUDE_DIRS := \
    frameworks/av/services/camera/libcameraservice

LOCAL_CFLAGS += -Wall -Wextra -Werror

LOCAL_MODULE:= libcameraservice

include $(BUILD_SHARED_LIBRARY)


## 一个Android.mk file首先必须定义好LOCAL_PATH变量。
## 它用于在开发树中查找源文件。在这个例子中，宏函数’my-dir’,
## 由编译系统提供，用于返回当前路径（即包含Android.mk file文件的目录）。
#LOCAL_PATH := $(call my-dir)
## CLEAR_VARS由编译系统提供，
## 指定让GNU MAKEFILE为你清除许多LOCAL_XXX变量（例如 LOCAL_MODULE, LOCAL_SRC_FILES, LOCAL_STATIC_LIBRARIES, 等等...),除LOCAL_PATH 。这是必要的，
## 因为所有的编译控制文件都在同一个GNU MAKE执行环境中，所有的变量都是全局的。
#include $(CLEAR_VARS)
## LOCAL_MODULE变量必须定义，以标识你在Android.mk文件中描述的每个模块。名称必须是唯一的，而且不包含任何空格。
## 注意编译系统会自动产生合适的前缀和后缀，换句话说，一个被命名为'foo'的共享库模块，将会生成'libfoo.so'文件。
#LOCAL_MODULE    := yuv420
## LOCAL_SRC_FILES变量必须包含将要编译打包进模块中的C或C++源代码文件。注意，你不用在这里列出头文件和包含文件，
## 因为编译系统将会自动为你找出依赖型的文件；仅仅列出直接传递给编译器的源代码文件就好。
#LOCAL_SRC_FILES := yuv420_infiniteloop.c
## BUILD_EXECUTABLE 表示以一个可执行程序的方式进行编译
## BUILD_SHARED_LIBRARY 表示动态链接库的方式进行编译
#include $(BUILD_EXECUTABLE)