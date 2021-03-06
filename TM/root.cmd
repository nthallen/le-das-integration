%{
  #include <string.h>
  #include <errno.h>
  /* #include "tm.h" */
  #include "nl.h"
%}

%INTERFACE <tm_gen:tm_gen/cmd>
%INTERFACE <Quit>

&start
	: &commands Quit * { msg(0,"Shutting down"); }
	: &commands &&Exit
	;
&&Exit
	: Exit * {}
	;
&commands
	:
	: &commands &command
	;
&command
	: *
	: Telemetry &tm_cmd
	: Log %s ( Enter String to Log to Memo ) * {}
	;
&tm_cmd
	: Start * { if_tm_gen.Turf("TMc\n"); }
	: Single Step * { if_tm_gen.Turf("TMs\n"); }
        : Stop * { if_tm_gen.Turf("TMe\n"); }
	;
