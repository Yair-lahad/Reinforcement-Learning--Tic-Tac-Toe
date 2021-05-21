function Pol_out = GetSetPolicy(Pol_in)
%GETSETPOLICY Get\Set the current policy of the TD player
% Pol_in   - The requested policy for the TD player
% Pol_out  - The current policy of the TD player

persistent Policy;

if (isempty(Policy))
    
    mpath = strrep(which(mfilename),[mfilename '.m'],'');
    addpath([mpath 'Policies']);
    
    if (nargin < 1)
        % Set the greedy policy by default
        Policy = @Greedy;
    end
    
end

% Set the requested Policy
if (nargin > 0)
    Policy = Pol_in;
end

% Return the current Policy
Pol_out = Policy;

end
