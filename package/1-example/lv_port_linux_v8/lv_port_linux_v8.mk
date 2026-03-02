################################################################################
#
# lv_port_linux_v8
#
################################################################################

LV_PORT_LINUX_V8_VERSION = 1.0.0
LV_PORT_LINUX_V8_SITE = ./package/1-example/lv_port_linux_v8
LV_PORT_LINUX_V8_SITE_METHOD = local

define LV_PORT_LINUX_V8_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define LV_PORT_LINUX_V8_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/lvgl_demo $(TARGET_DIR)/usr/bin
endef
 
define LV_PORT_LINUX_V8_PERMISSIONS
    /usr/bin/lvgl_demo f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))
