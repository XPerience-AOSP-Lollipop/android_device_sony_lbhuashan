# Copyright (C) 2013 The CyanogenMod Project
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

# inherit from Sony common
include device/sony/lbcommon/BoardConfigCommon.mk

# inherit from qcom-common
include device/sony/lbqcom-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/lbsony/huashan/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := lbC5302,lbC5303,lbC5306,lbhuashan
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/sony/lbhuashan/releasetools/ota_from_target_files

TARGET_SPECIFIC_HEADER_PATH += device/sony/lbhuashan/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/lbmsm8960t
TARGET_KERNEL_CONFIG := viskan_huashan_defconfig

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320
BOARD_VENDOR_PLATFORM := viskan

# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := krait

# Architecture flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Bionic
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel information
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 androidboot.baseband=msm msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000

# Wifi Config
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

BOARD_HARDWARE_CLASS += device/sony/lbhuashan/cmhw

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# MMap compatibility
BOARD_USES_LEGACY_MMAP := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/lbhuashan/bluetooth

# NFC
BOARD_HAVE_NFC := true

# Needed for blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/lbhuashan/custombootimg.mk
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

TARGET_RECOVERY_FSTAB := device/sony/lbhuashan/rootdir/fstab.qcom

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

# QCOM/CAF hardware
BOARD_USES_QCOM_HARDWARE := true
#TARGET_QCOM_AUDIO_VARIANT := caf
#TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_USES_QCOM_BSP := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_HAVE_CSD_FAST_CALL_SWITCH :=true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER_MIC := true
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

#Fm Radio
AUDIO_FEATURE_ENABLED_FM := true
QCOM_FM_ENABLED := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Legacy RIL
BOARD_HAS_RIL_LEGACY_PAP := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Symbol compatibility
TARGET_USES_ICU_COMPAT_SYMBOLS := true

# Enable Minikin text layout engine
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qcom

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

TARGET_USES_LOGD := false

BOARD_SEPOLICY_DIRS += \
    device/sony/lbhuashan/sepolicy

BOARD_SEPOLICY_UNION += \
	app.te \
	bluetooth.te \
	bridge.te \
	device.te \
	domain.te \
	file.te \
	irsc_util.te \
	mediaserver.te \
	mpdecision.te \
	netmgrd.te \
	platform_app.te \
	qmux.te \
	radio.te \
	rild.te \
	rmt.te \
	sensors.te \
	surfaceflinger.te \
	system_server.te \
	tee.te \
	time.te \
	ueventd.te \
	wpa.te \
	file_contexts \
	genfs_contexts \
	te_macros
