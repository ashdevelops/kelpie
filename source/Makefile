ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
GO_EASY_ON_ME = 1
THEOS_DEVICE_PORT = 22
THEOS_DEVICE_IP = 192.168.1.207
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = kelpie
kelpie_FILES = Tweak.xm $(wildcard interface/*/*.*m)
kelpie_CFLAGS += -fobjc-arc -Iinclude -Iinterface/Shadow -Iinterface/LocationPicker -Iinterface/RainbowRoad -Iinterface/XLLogger -Iinterface/Kelpie
kelpie_CFLAGS += -Wno-arc-performSelector-leaks -Wno-format-security -Wno-unused-function -Wno-unused-variable -Wno-deprecated-declarations
kelpie_CFLAGS += -DPROJECT_VERSION='"1.0.0"'
kelpie_CFLAGS += -DPROJECT_NAME='"Kelpie"'
kelpie_EXTRA_FRAMEWORKS := CoreGraphics AssetsLibrary UIKit AVKit CoreFoundation QuartzCore MobileCoreServices AVFoundation CoreLocation MapKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"