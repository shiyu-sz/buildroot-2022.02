
#include <stdio.h>
#include <unistd.h>
#include "uci_interface.h"

int main()
{
    char buf[10];

    memset(buf, 0x0, 10);
    sys_get_configuration("/etc/config/my_uci", "s1", "o1", buf, 10);
    printf("buf = %s\n", buf);
    sleep(1);
    sys_save_configuration("/etc/config/my_uci", "s1", "o1", "10086");
    sleep(1);
    memset(buf, 0x0, 10);
    sys_get_configuration("/etc/config/my_uci", "s1", "o1", buf, 10);
    printf("buf = %s\n", buf);

    return 0;
}