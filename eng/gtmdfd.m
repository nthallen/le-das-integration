function fig = gtmdfd(varargin);
% gtmdfd(...)
% Driver
ffig = ne_group(varargin,'Driver','ptmdfda','ptmdfdb','ptmdfds');
if nargout > 0 fig = ffig; end
