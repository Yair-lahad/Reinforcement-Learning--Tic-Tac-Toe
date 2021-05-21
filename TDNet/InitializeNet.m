function InitializeNet()
%INITIALIZENET Initialize the network's weights and activation functions

% TODO: The current implementation is for a linear perceptron. Change it.

mpath = strrep(which(mfilename),[mfilename '.m'],'');
addpath([mpath 'ActivationFunctions']);

% Set the network's dimensions
N = [10,40, 1];
L = length(N) - 1;

% Create a new network
global Net;
Net = [];
Net.W = cell(1, L);
Net.g = cell(1, L);

% For each layer
for l = 1:L
    
    % Initialize the layer's weights
    Net.W{l} = unifrnd(-0.001, 0.001, [N(l + 1), N(l) + 1]);
    
    % Set the layer's activation functions
    Net.g{l} = @ReLU;
    if l==L
        Net.g{l} = @Tanh;
    end
    
end

SaveNet();

end
