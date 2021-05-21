function res = Test(n_games, title)
%TEST Test the current network's performancs
% n_games   - The number of test games
% title     - Display title (optional)
% res       - The test statistics: [%lost, %tied, %won]

mpath = strrep(which(mfilename),[mfilename '.m'],'');
addpath([mpath 'TDNet']);
addpath([mpath 'TicTacToe']);

% Reload the network's data if needed
LoadNet();

% Set the pseudorandom generator's seed for consistency
sd = rng;
rng(1);

% Set the greedy policy for the test
GetSetPolicy(@Greedy);

% Play n_games and calculate the results' statistics
res = zeros(1, 3);
for i = 1:n_games
    [win, ~, sw] = Game(@TDChooseSquare, @RandomChooseSquare);
    tmp = (1 - 2*sw)*win;
    res(tmp + 2) = res(tmp + 2) + 1;
end
res = 100 .* res ./ n_games;

if (nargin > 1)
    fprintf('%s\n', title);
end
fprintf('%d test games: %g%% lost, %g%% tied, %g%% won. \n', n_games, res);

% Restore the pseudorandom generator's seed
rng(sd);

end
