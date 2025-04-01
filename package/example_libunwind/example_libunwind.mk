################################################################################
#
# example_libunwind
#
################################################################################
 
EXAMPLE_LIBUNWIND_VERSION:= 1.0.0
EXAMPLE_LIBUNWIND_SITE:= $(TOPDIR)/package/example_libunwind
EXAMPLE_LIBUNWIND_SITE_METHOD:=local
EXAMPLE_LIBUNWIND_INSTALL_TARGET:=YES
EXAMPLE_LIBUNWIND_DEPENDENCIES = libunwind
 
define EXAMPLE_LIBUNWIND_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define EXAMPLE_LIBUNWIND_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_libunwind $(TARGET_DIR)/usr/bin/example_libunwind
endef
 
define EXAMPLE_LIBUNWIND_PERMISSIONS
    /usr/bin/example_libunwind f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))