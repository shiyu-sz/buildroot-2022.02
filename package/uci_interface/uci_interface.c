
#include <stdio.h>
#include <stdlib.h>
#include <uci.h>
#include <string.h>

/*
 *  修改节点的值
 */
int sys_save_configuration(const char *package, const char *section, const char *option, const char *value)
{
    int ret;
    struct uci_context *ctx = NULL;
    struct uci_package* pkg;
    struct uci_section* sec;
    struct uci_ptr ptr;
    char* err_str = NULL;
 
    ctx = uci_alloc_context();
    if (ctx == NULL)
    {
        printf("Failed to alloc uci context!");
        return -1;
    }
 
    ret = uci_load(ctx, package, &pkg);
    if(ret != 0 || pkg == NULL)
    {
        printf("Failed to load package: '/etc/config/%s' with error", package);
        goto error;
    }
 
    sec = uci_lookup_section(ctx, pkg, section);
    if(sec == NULL)
    {
        printf("Failed to find section: '%s'", section);
        goto error;
    }
 
    memset(&ptr, 0, sizeof(struct uci_ptr));
 
    ptr.package = package;
    ptr.section = section;
	ptr.option = option;
	ptr.value = value;
	
    ptr.p = pkg;
    ptr.s = sec;
 
    ret = uci_set(ctx, &ptr);
    if(ret != 0)
    {
        printf("Failed to set option: '%s' with error", option);
        goto error;
    }
 
    uci_save(ctx, pkg);
    uci_commit(ctx, &pkg, false);
    uci_unload(ctx, pkg);
    uci_free_context(ctx);
    return 0;
 
error:
    uci_unload(ctx, pkg);
    uci_free_context(ctx);
    return -1;
}

/**
 * 获得节点的值
 */
int sys_get_configuration(const char *package, const char * section, const char *name, char *value, int value_len)
{
    struct uci_context *c;
    struct uci_ptr p;
    char a[128] = {0};
    memset(value, 0, value_len);

    snprintf(a, 128, "%s.%s.%s", package, section, name);

    c = uci_alloc_context();
    if (c == NULL)
    {
        printf("Failed to alloc uci context!");
        return -1;
    }

    if(UCI_OK != uci_lookup_ptr(c, &p, a, true))
    {
        printf("option %s no found!\n", a);
        uci_free_context(c);
        return -1;
    }

    // printf("%s\n", p.o->v.string);
    if (p.o && p.o->v.string != NULL)
        strncpy(value, p.o->v.string, value_len);
    uci_free_context(c);

    return 0;
}

/**
 * 获得节点的布尔值
 */
int sys_get_configuration_bool(const char *package, const char * section, const char *name, bool *value)
{
    int ret = 0;
    char buff[32] = {0};
    ret = sys_get_configuration(package, section, name, buff, 32);

    if (ret == 0) {
        if (strcmp(buff, "true") == 0) {
            *value = true;
        } else {
            *value = false;
        }
        return 0;
    }
    else{
        return -1;
    }
}