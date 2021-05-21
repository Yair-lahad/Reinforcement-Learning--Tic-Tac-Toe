function SaveNet(filename)
%SAVENET Save the network's data
% filenamme - The data file's name (optional)

if (nargin < 1)
    fname = NetFileName();
else
    fname = filename;
end

global Net;

save(fname, 'Net');

end
