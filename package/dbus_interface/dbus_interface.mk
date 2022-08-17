################################################################################
#
# dbus_interface
#
################################################################################
 
DBUS_INTERFACE_VERSION= 1.0.0
DBUS_INTERFACE_SITE= $(TOPDIR)/package/dbus_interface
DBUS_INTERFACE_SITE_METHOD=local
DBUS_INTERFACE_INSTALL_STAGING = YES
DBUS_INTERFACE_INSTALL_TARGET=YES
DBUS_INTERFACE_DEPENDENCIES = libubox
 
define DBUS_INTERFACE_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all armhf=1
endef

define DBUS_INTERFACE_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libdbus_interface.so ${STAGING_DIR}/usr/lib
    $(INSTALL) -D -m 0644 $(@D)/dbus_interface.h    ${STAGING_DIR}/usr/include/dbus_interface.h 
endef

define DBUS_INTERFACE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libdbus_interface.so $(TARGET_DIR)/usr/lib
    $(INSTALL) -D -m 0644 $(@D)/system.conf   $(TARGET_DIR)/etc/dbus-1/system.d/system.conf
endef
 
define DBUS_INTERFACE_PERMISSIONS

endef
 
$(eval $(generic-package))