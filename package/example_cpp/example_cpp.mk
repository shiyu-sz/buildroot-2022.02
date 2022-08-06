################################################################################
#
# example_cpp
#
################################################################################
 
EXAMPLE_CPP_VERSION:= 1.0.0
EXAMPLE_CPP_SITE:= $(TOPDIR)/package/example_cpp
EXAMPLE_CPP_SITE_METHOD:=local
EXAMPLE_CPP_INSTALL_TARGET:=YES
 
define EXAMPLE_CPP_BUILD_CMDS
    $(MAKE) CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" -C $(@D) all
endef
 
define EXAMPLE_CPP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/example_cpp $(TARGET_DIR)/usr/bin
endef
 
define EXAMPLE_CPP_PERMISSIONS
    /usr/bin/example_cpp f 4755 0 0 - - - - -
endef
 
$(eval $(generic-package))