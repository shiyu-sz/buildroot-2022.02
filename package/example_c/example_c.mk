################################################################################
#
# example_c
#
################################################################################
 
EXAMPLE_C_VERSION:= 1.0.0
EXAMPLE_C_SITE:= $(TOPDIR)/package/example_c
EXAMPLE_C_SITE_METHOD:=local
EXAMPLE_C_INSTALL_TARGET:=YES
 
define EXAMPLE_C_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef
 
define EXAMPLE_C_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_c $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/S99example_c \
		$(TARGET_DIR)/etc/init.d/S99example_c
endef
 
define EXAMPLE_C_PERMISSIONS
    /usr/bin/example_c f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))