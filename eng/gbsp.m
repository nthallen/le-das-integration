function fig = gbsp(varargin);
% gbsp(...)
% Power
ffig = ne_group(varargin,'Power','pbspv','pbspvolts_50','pbspc');
if nargout > 0 fig = ffig; end
