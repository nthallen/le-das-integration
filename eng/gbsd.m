function fig = gbsd(varargin);
% gbsd(...)
% Driver
ffig = ne_group(varargin,'Driver','pbsda','pbsdb','pbsds');
if nargout > 0 fig = ffig; end
