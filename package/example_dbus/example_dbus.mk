################################################################################
#
# example_dbus
#
################################################################################
 
EXAMPLE_DBUS_VERSION= 1.0.0
EXAMPLE_DBUS_SITE= $(TOPDIR)/package/example_dbus
EXAMPLE_DBUS_SITE_METHOD=local
EXAMPLE_DBUS_INSTALL_TARGET=YES
EXAMPLE_DBUS_DEPENDENCIES = dbus_interface
 
define EXAMPLE_DBUS_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef
 
define EXAMPLE_DBUS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/dbus_recv $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0755 $(@D)/dbus_send $(TARGET_DIR)/usr/bin
endef
 
define EXAMPLE_DBUS_PERMISSIONS
    /usr/bin/dbus_recv f 4755 0 0 - - - - -
    /usr/bin/dbus_send f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))