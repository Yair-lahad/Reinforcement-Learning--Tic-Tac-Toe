function fname = NetFileName()
%NETFILENAME Get the network's data file name
% fname - The default data file's name

persistent filename;
if(isempty(filename))
    mpath = strrep(which(mfilename),[mfilename '.m'],'');
    filename = [mpath 'Net.mat'];
end
fname = filename;

end