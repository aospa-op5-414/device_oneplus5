#
# Copyright (C) 2017 The LineageOS Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from oppo-common

PLATFORM_PATH := device/oneplus/oneplus5

BOARD_VENDOR := oneplus

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_OTA_ASSERT_DEVICE := OnePlus5,oneplus5,cheeseburger,OnePlus5T,oneplus5t,dumpling

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

BUILD_BROKEN_DUP_RULES := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_APPEND_DTB := true
KERNEL_DEFCONFIG := paranoid_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_VERSION := 4.4
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998
TARGET_USES_UNCOMPRESSED_KERNEL := false

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
TARGET_SCREEN_DENSITY := 420

# GPS
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_MANIFEST_FILE += \
    $(PLATFORM_PATH)/manifest.xml \
    $(PLATFORM_PATH)/oneplus_manifest.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(PLATFORM_PATH)/oneplus_vendor_framework_compatibility_matrix.xml \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32212254720
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery.fstab

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(PLATFORM_PATH)/sepolicy/private

# Symlinks
TARGET_MOUNT_POINTS_SYMLINKS := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
TARGET_COPY_OUT_VENDOR := vendor

# VNDK
BOARD_VNDK_VERSION := current

# inherit from the proprietary version
-include vendor/oneplus/oneplus5/BoardConfigVendor.mk
