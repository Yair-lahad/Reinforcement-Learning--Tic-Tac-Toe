function [y, Gradient] = TDEvaluate(x)
% Evaluate the TD-trained system's output
% x         - The network's input
% y         - The network's output
% Gradient  - The output's gradient w.r.t. the network's weights (optional)
%             Please notice the indices notation:
%             Gradient{l}(i, j, k) = d(y(i))/d(W{l}(j, k))

% Load the network's data if needed
global Net;
LoadNet();

L = length(Net.W);

% Do not calculate the gradient if not requested
if (nargout == 1)
    
    % Start from the input layer
    y = x;
    for l = 1:L
        % Evaluate the next layer
        y = Net.g{l}(Net.W{l} * [y; 1]);
    end
    
else
    
    % Set the neurons
    h = cell(1, L + 1);
    h{1}.g = x;
    
    % Start from the input layer
    y = x;
    
    for l = 1:L
        
        % Evaluate the next layer
        [y, gp] = Net.g{l}(Net.W{l} * [y; 1]);
        
        % Save the neurons activities and their derivatives
        h{l + 1}.g = y;
        h{l + 1}.gp = gp;
        
    end
    
    % Calculate the gradient dy/dW (Back Propagation)
    Gradient = cell(1, L);
    delta = eye(length(h{L + 1}.g));
    for l = L:-1:1;
        delta = delta * diag(h{l + 1}.gp);
        xl = [h{l}.g; 1];
        for k = 1:length(xl)
            Gradient{l}(:, :, k) = delta*xl(k);
        end
        delta = delta*Net.W{l}(:, 1:end-1);
    end
    
end

end
