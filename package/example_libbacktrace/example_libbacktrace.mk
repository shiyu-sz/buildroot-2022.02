################################################################################
#
# example_libbacktrace
#
################################################################################
 
EXAMPLE_LIBBACKTRACE_VERSION:= 1.0.0
EXAMPLE_LIBBACKTRACE_SITE:= $(TOPDIR)/package/example_libbacktrace
EXAMPLE_LIBBACKTRACE_SITE_METHOD:=local
EXAMPLE_LIBBACKTRACE_INSTALL_TARGET:=YES
EXAMPLE_LIBBACKTRACE_DEPENDENCIES = libbacktrace
 
define EXAMPLE_LIBBACKTRACE_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define EXAMPLE_LIBBACKTRACE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_libbacktrace $(TARGET_DIR)/usr/bin/example_libbacktrace
endef
 
define EXAMPLE_LIBBACKTRACE_PERMISSIONS
    /usr/bin/example_libbacktrace f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))