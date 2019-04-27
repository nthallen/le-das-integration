/** @file driver.h
 * Defines the data structure used for sending data to collection
 */
#ifndef DRIVER_H_INCLUDED
#define DRIVER_H_INCLUDED
#include <stdint.h>

typedef struct __attribute__((packed)) {
  uint16_t A;
  uint16_t B;
} driver_data_t;

#endif
