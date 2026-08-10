#ifndef SEMANTIC_H
#define SEMANTIC_H

typedef enum {
    DEVICE_LIGHT,
    DEVICE_FAN,
    DEVICE_AC
} Device;

typedef enum {
    ACTION_ON,
    ACTION_OFF
} Action;

void semantic_init(void);

void process_device_command(Device device, Action action);

#endif