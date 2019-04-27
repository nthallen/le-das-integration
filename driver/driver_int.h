/** @file driver_int.h
 * Defines the internal data structures for the driver
 */
#ifndef DRIVER_INT_H_INCLUDED
#define DRIVER_INT_H_INCLUDED
#include "driver.h"
#include "dasio/interface.h"

class driver_interface : public DAS_IO::Interface {
  public:
    driver_interface(driver_data_t *data);
    // ~driver_interface();
  protected:
    bool tm_sync();
  private:
    driver_data_t *data;
};

#endif
