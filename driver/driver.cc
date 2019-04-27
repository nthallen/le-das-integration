/** @file driver.cc
 * A basic driver framework
 */
#include "dasio/appid.h"
#include "dasio/loop.h"
#include "dasio/tm_data_sndr.h"
#include "driver_int.h"
#include "oui.h"
#include "nl.h"

using namespace DAS_IO;

AppID_t DAS_IO::AppID("Driver", "Example Driver Framework", "V1.0");

driver_data_t Driver;

driver_interface::driver_interface(driver_data_t *data)
  : Interface("driver_int", 0), data(data) {
    flags = gflag(0); // The TM Synch flag
  }

bool driver_interface::tm_sync() {
  ++data->A;
  data->B = data->A % 2039;
  // Add code here to record msec offset to investigate latency
}

int main(int argc, char **argv) {
  oui_init_options(argc, argv);
  Loop ELoop;
  TM_data_sndr *TM = new TM_data_sndr("TM", "Driver",
    (const char *)&Driver, sizeof(Driver));
  TM->connect();
  ELoop.add_child(TM);
  driver_interface *drv = new driver_interface(&Driver);
  ELoop.add_child(drv);
  msg(0, "%s %s Starting", AppID.fullname, AppID.rev);
  ELoop.event_loop();
  msg(0, "Terminating");
  return 0;
}
