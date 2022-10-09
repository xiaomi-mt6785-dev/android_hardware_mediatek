LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.power-service-V1-mediatek
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 64
LOCAL_VINTF_FRAGMENTS := power-mtk-v1.xml
LOCAL_SRC_FILES := Power.cpp

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libbinder_ndk \
    android.hardware.power-V1-ndk

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifneq ($(TARGET_POWERHAL_MODE_EXT),)
    LOCAL_CFLAGS += -DMODE_EXT
    LOCAL_SRC_FILES += ../../../$(TARGET_POWERHAL_MODE_EXT)
endif

LOCAL_CFLAGS += -DPOWERHAL_AIDL_VERSION=1

# This is hacky but I havent found another way that works.
LOCAL_POST_INSTALL_CMD := mv $(TARGET_OUT_VENDOR)/lib64/$(LOCAL_MODULE).so \
    $(TARGET_OUT_VENDOR)/lib64/android.hardware.power-service-mediatek.so

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.power-service-V2-mediatek
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 64
LOCAL_VINTF_FRAGMENTS := power-mtk-v2.xml
LOCAL_SRC_FILES := Power.cpp

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libbinder_ndk \
    android.hardware.power-V2-ndk

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifneq ($(TARGET_POWERHAL_MODE_EXT),)
    LOCAL_CFLAGS += -DMODE_EXT
    LOCAL_SRC_FILES += ../../../$(TARGET_POWERHAL_MODE_EXT)
endif

LOCAL_CFLAGS += -DPOWERHAL_AIDL_VERSION=2

# This is hacky but I havent found another way that works.
LOCAL_POST_INSTALL_CMD := mv $(TARGET_OUT_VENDOR)/lib64/$(LOCAL_MODULE).so \
    $(TARGET_OUT_VENDOR)/lib64/android.hardware.power-service-mediatek.so

include $(BUILD_SHARED_LIBRARY)
