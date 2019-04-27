function ui_bs
f = ne_dialg('Bootstrap Instrument',1);
f = ne_dialg(f, 'add', 0, 1, 'gbsp', 'Power' );
f = ne_dialg(f, 'add', 1, 0, 'pbspv', 'Volts 28' );
f = ne_dialg(f, 'add', 1, 0, 'pbspvolts_50', 'Volts 50' );
f = ne_dialg(f, 'add', 1, 0, 'pbspc', 'Current' );
f = ne_dialg(f, 'add', 0, 1, 'gbsd', 'Driver' );
f = ne_dialg(f, 'add', 1, 0, 'pbsda', 'A' );
f = ne_dialg(f, 'add', 1, 0, 'pbsdb', 'B' );
f = ne_dialg(f, 'add', 1, 0, 'pbsds', 'Stale' );
f = ne_listdirs(f, 'BS_DATA_DIR', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');
