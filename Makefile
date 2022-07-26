ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
GO_EASY_ON_ME = 1
THEOS_DEVICE_PORT = 22
THEOS_DEVICE_IP = 192.168.1.152
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = relicloader
relicloader_FILES = Tweak.xm $(wildcard interface/*/*.*m)
relicloader_CFLAGS += -fobjc-arc -Iinclude -Iinterface/Shadow -Iinterface/LocationPicker -Iinterface/RainbowRoad -Iinterface/XLLogger
relicloader_CFLAGS += -Wno-arc-performSelector-leaks -Wno-format-security -Wno-unused-function -Wno-unused-variable -Wno-deprecated-declarations
relicloader_CFLAGS += -DSHADOW_VERSION='"4.0.2"'
relicloader_CFLAGS += -DSHADOW_PROJECT='"wicked"'
relicloader_CFLAGS += -DSERVER='@"https://no5up.dev/data.json"'
relicloader_EXTRA_FRAMEWORKS := CoreGraphics AssetsLibrary UIKit AVKit CoreFoundation QuartzCore MobileCoreServices AVFoundation CoreLocation MapKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"