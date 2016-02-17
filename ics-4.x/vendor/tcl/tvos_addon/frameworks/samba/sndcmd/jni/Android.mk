#
# Copyright (C) 2008 The Android Open Source Project
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
#

# This makefile supplies the rules for building a library of JNI code for
# use by our example of how to bundle a shared library with an APK.

LOCAL_PATH:= $(call my-dir)

include $(ANDROID_BUILD_TOP)/vendor/tcl/tvos_addon/tvos_base.mk
ifneq ($(call tcl-test-cpp-files),)

# use Source files.
# ============================================================
include $(CLEAR_VARS)

#LOCAL_MODULE_TAGS := samples

# This is the target being built.
LOCAL_MODULE:= libsndcmd_jni
LOCAL_MODULE_TAGS := optional

# All of the source files that we will compile.
LOCAL_SRC_FILES:= \
  SndCmdNative.cpp

# All of the shared libraries we link against.
LOCAL_SHARED_LIBRARIES := \
	libutils \
	libSndCmd \
	libBpSndCmd \
	liblog \
	libcutils

# No static libraries.
LOCAL_STATIC_LIBRARIES :=

# Also need the JNI headers.
LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE)

# No special compiler flags.
LOCAL_CFLAGS +=

# Don't prelink this library.  For more efficient code, you may want
# to add this library to the prelink map and set this to true. However,
# it's difficult to do this for applications that are not supplied as
# part of a system image.

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

##{{cp binary
$(DEFAULT_GOAL): $(LOCAL_PATH)/libsndcmd_jni.so
all_modules: $(LOCAL_PATH)/libsndcmd_jni.so
$(LOCAL_PATH)/libsndcmd_jni.so: $(LOCAL_BUILT_MODULE)
	$(copy-file-to-target-with-cp)	
empty_dummy:
## cp binary}}

else
# use binary files.
# ============================================================
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_LIBS := \
	libsndcmd_jni.so

include $(BUILD_MULTI_PREBUILT)

endif