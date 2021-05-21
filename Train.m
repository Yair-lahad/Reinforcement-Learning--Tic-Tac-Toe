function train_res = Train(Player1, Player2, n_games, n_disp, n_test, n_save)
%TRAIN Train the TD network by gaming
% Player1   - The tested player
% Player2   - The opponent
% n_games   - The number of training games
% n_disp    - Determines the frequency of calculating and displaying 
%             results (optional)
% n_test    - The number of test games (optional)
% n_save    - Determines the frequency of saving backup (optional)

mpath = strrep(which(mfilename),[mfilename '.m'],'');
addpath([mpath 'TDNet']);
addpath([mpath 'TicTacToe']);

% Set default values for the optional parameters
if (nargin < 4)
    n_disp = 1000;
end
if (nargin < 5)
    n_test = 100;
end
if (nargin < 6)
    n_save = 10000;
end

% Reload the network's data if needed
LoadNet();

res_plot_max = floor(n_games/n_disp);
res_plot = zeros(res_plot_max, 3);

for i = 1:n_games
    
    % Play vs. random opponent
    [win, hist] = Game(Player1, Player2);
    
    % Set the reward
    r = zeros(1, size(hist, 1));
    r(end) = win;
    
    %Train
    TDTrain(hist', r,i);
    
    % Display progress & statistics
    if(rem(i, n_disp) == 0 || i == n_games)
        fprintf('Training: %d games done. \n', i);
        res_plot(floor(i/n_disp), :) = Test(n_test);
        fprintf('\n');
    end
    
    % Save results
    if(rem(i, n_save) == 0)
        SaveNet();
    end
    
end

SaveNet();

train_res.res_plot = res_plot;
train_res.res_plot_max = res_plot_max;
train_res.n_disp = n_disp;

end
