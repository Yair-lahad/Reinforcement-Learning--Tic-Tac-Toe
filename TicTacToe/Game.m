function [win, hist, sw] = Game(Player1, Player2)
%GAME Simulate a game between two AIs
% Player1   - The first player
% Player2   - The second player
% win       - 1 for X, -1 for O, 0 otherwise
% hist      - The game's positions history
% sw        - Flag for switching the players order

% Randomly assign the players to X and O
Players = {Player1, Player2};
perm = randperm(2);
Players = Players(perm);
sw = (perm(1) ~= 1);

% Set the opening
turn = 1;
board = zeros(1, 9);
avsq = 1:9;
win = 0;

% Initialize the game's history data
hist = zeros(10, 10);
t = 1;
hist(t, :) = [board, turn];

% While no side has won and there are still available squares
while (win == 0 && ~isempty(avsq))
    
    % Make a move according to the current artificial player
    num = Players{turn}(board, avsq, turn);
    board(num) = turn;
    avsq(avsq == num) = [];
    
    % Switch player
    turn = 3 - turn;
    
    % Save the current state
    t = t + 1;
    hist(t, :) = [board, turn];
    
    % Check for win
    win = checkboard(board);
    
end

% Clip unneeded history data
hist(t + 1:end, :) = [];

% Change the game's data into the network's input form
hist(hist == 2) = -1;
if(win == 2)
    win = -1;
end

end
