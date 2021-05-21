function LoadNet(filename)
%LOADNET Load the network's data if needed
% Loading can be forced by specifying a filename. 
% filenamme - The data file's name (optional)

global Net;

if (nargin < 1)
    fname = NetFileName();
else
    fname = filename;
    Net = [];
end

if (isempty(Net))
    
    tmp = load(fname);
    Net = tmp.Net;
    
    mpath = strrep(which(mfilename),[mfilename '.m'],'');
    addpath([mpath 'ActivationFunctions']);
    
end

end