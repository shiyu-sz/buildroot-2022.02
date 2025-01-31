################################################################################
#
# example_uci
#
################################################################################
 
EXAMPLE_UCI_VERSION= 1.0.0
EXAMPLE_UCI_SITE= $(TOPDIR)/package/example_uci
EXAMPLE_UCI_SITE_METHOD=local
EXAMPLE_UCI_INSTALL_TARGET=YES
EXAMPLE_UCI_DEPENDENCIES = uci_interface
 
define EXAMPLE_UCI_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef
 
define EXAMPLE_UCI_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_uci $(TARGET_DIR)/usr/bin
endef
 
define EXAMPLE_UCI_PERMISSIONS
    /usr/bin/example_uci f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))