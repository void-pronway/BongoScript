#include <stdio.h>
#include "semantic.h"

static int light_state = -1;
static int fan_state = -1;
static int ac_state = -1;

void semantic_init(void)
{
    light_state = -1;
    fan_state = -1;
    ac_state = -1;
}

void process_device_command(Device device, Action action)
{
    int *state = NULL;
    const char *device_name = NULL;
    const char *action_name = NULL;

    if (device == DEVICE_LIGHT) {
        state = &light_state;
        device_name = "LIGHT";
    }
    else if (device == DEVICE_FAN) {
        state = &fan_state;
        device_name = "FAN";
    }
    else if (device == DEVICE_AC) {
        state = &ac_state;
        device_name = "AC";
    }

    if (action == ACTION_ON) {
        action_name = "ON";
    }
    else {
        action_name = "OFF";
    }

    if (*state != -1 && *state != action) {
        printf(
            "Warning: Conflicting command detected for %s\n",
            device_name
        );
    }

    *state = action;

    printf("%s -> %s\n", device_name, action_name);
}