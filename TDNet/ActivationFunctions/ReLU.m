function [g, gp] = ReLU(x)
%RELU Semi-linear activation function
% g     - max(0, x)
% gp    - heaviside(x)

gp = x > 0;
g = x;
g(~gp) = 0;

end

