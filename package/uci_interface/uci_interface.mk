################################################################################
#
# uci_interface
#
################################################################################
 
UCI_INTERFACE_VERSION= 1.0.0
UCI_INTERFACE_SITE= $(TOPDIR)/package/uci_interface
UCI_INTERFACE_SITE_METHOD=local
UCI_INTERFACE_INSTALL_STAGING = YES
UCI_INTERFACE_INSTALL_TARGET=YES
UCI_INTERFACE_DEPENDENCIES = libubox
 
define UCI_INTERFACE_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all armhf=1
endef

define UCI_INTERFACE_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libuci_interface.so ${STAGING_DIR}/usr/lib
    $(INSTALL) -D -m 0644 $(@D)/uci_interface.h    ${STAGING_DIR}/usr/include/uci_interface.h 
endef

define UCI_INTERFACE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libuci_interface.so $(TARGET_DIR)/usr/lib
endef
 
define UCI_INTERFACE_PERMISSIONS

endef
 
$(eval $(generic-package))