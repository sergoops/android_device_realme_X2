#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/realme/X2/X2-vendor.mk)

# Build with GMS
WITH_GMS := true
$(call inherit-product, vendor/google/gms/config.mk)
$(call inherit-product, vendor/google-pixel/config.mk)
$(call inherit-product, vendor/partner_modules/build/mainline_modules_s_flatten_apex.mk)

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 28

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

#LMKD STAT LOGGING
TARGET_LMKD_STATS_LOG := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Properties
-include $(LOCAL_PATH)/product_props.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_oppo_19771.xml:system/etc/audio_platform_info_oppo_19771.xml \
    $(LOCAL_PATH)/audio/mixer_paths_19771.xml:system/etc/mixer_paths_19771.xml

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti \
    libldacBT_bco

# Camera
PRODUCT_PACKAGES += \
    Snap

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.devicesetting.rc

PRODUCT_PACKAGES += \
    fstab.qcom

# Ramdisk shit
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk/,$(TARGET_COPY_OUT_RAMDISK))

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libdisplayconfig.qti \
    libgralloc.qti \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@2.0

# Doze
#PRODUCT_PACKAGES += \
    RealmeProximityHelper \
    RealmeParts

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.x2 \
    vendor.oplus.hardware.biometrics.fingerprint@2.1

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder

#Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:system/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.software.controls.xml:system/etc/permissions/android.software.controls.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:/system/usr/keylayout/gpio-keys.kl

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Misc
PRODUCT_PACKAGES += \
    charger_res_images \
    ThemePicker

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic.x2

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors Hal
#PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.x2

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/nxp/opensource/sn100x

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0

# Lights
#PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.x2

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService
