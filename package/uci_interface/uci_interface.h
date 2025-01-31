#ifndef UCI_INTERFACE_H
#define UCI_INTERFACE_H

#include <stdbool.h>
#include <uci.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 *  修改节点的值
 */
int sys_save_configuration(const char *package, const char *section, const char *option, const char *value);

/**
 * 获得节点的值
 */
int sys_get_configuration(const char *package, const char * section, const char *name, char *value, int value_len);

/**
 * 获得节点的布尔值
 */
int sys_get_configuration_bool(const char *package, const char * section, const char *name, bool *value);

#ifdef __cplusplus
}
#endif

#endif
