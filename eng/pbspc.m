function pbspc(varargin);
% pbspc( [...] );
% Power Current
h = timeplot({'V28_I','V50A_I','V50B_I'}, ...
      'Power Current', ...
      'Current', ...
      {'V28\_I','V50A\_I','V50B\_I'}, ...
      varargin{:} );
