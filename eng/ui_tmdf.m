function ui_tmdf
f = ne_dialg('TMDF',1);
f = ne_dialg(f, 'add', 0, 1, 'gtmdfp', 'Power' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfpv', 'Volts 28' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfpvolts_50', 'Volts 50' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfpc', 'Current' );
f = ne_dialg(f, 'add', 0, 1, 'gtmdftmdf', 'TMDF' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdftmdfu', 'Usage' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdftmdfs', 'Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gtmdfd', 'Driver' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfda', 'A' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfdb', 'B' );
f = ne_dialg(f, 'add', 1, 0, 'ptmdfds', 'Stale' );
f = ne_listdirs(f, 'TMDF_DATA_DIR', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');
