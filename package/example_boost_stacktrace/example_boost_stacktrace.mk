################################################################################
#
# example_boost_stacktrace
#
################################################################################
 
EXAMPLE_BOOST_STACKTRACE_VERSION:= 1.0.0
EXAMPLE_BOOST_STACKTRACE_SITE:= $(TOPDIR)/package/example_boost_stacktrace
EXAMPLE_BOOST_STACKTRACE_SITE_METHOD:=local
EXAMPLE_BOOST_STACKTRACE_INSTALL_TARGET:=YES
EXAMPLE_BOOST_STACKTRACE_DEPENDENCIES = boost
 
define EXAMPLE_BOOST_STACKTRACE_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define EXAMPLE_BOOST_STACKTRACE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_boost_stacktrace $(TARGET_DIR)/usr/bin/example_boost_stacktrace
endef
 
define EXAMPLE_BOOST_STACKTRACE_PERMISSIONS
    /usr/bin/example_boost_stacktrace f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))