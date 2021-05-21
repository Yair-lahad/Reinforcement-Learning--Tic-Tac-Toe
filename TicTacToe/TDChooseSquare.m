function [num] = TDChooseSquare(board, avsq, turn)
% TDCHOOSESQUARE TD-trained player
% Try to win in one ply. Else, try to prevent the other side from
% winning in the next ply. Otherwise, choose a random square. 
% board     - The board position
% avsq      - Available squares' indices
% turn      - The next player to make a move
% num       - The chosen square

TDGrades = zeros(size(avsq));
tmpturn = 3 - turn; % The other player

% For every possible move
for i = 1:length(avsq)
    
    % simulate the next state
    tmppos = [board, tmpturn];
    tmppos(avsq(i)) = turn;
    
    % Get the network's output for the next state
    tmppos(tmppos == 2) = -1;
    TDGrades(i) = TDEvaluate(tmppos');
    
end

% For O, the player should minimize the reward
if (turn == 2)
    TDGrades = -TDGrades;
end

% Get the current policy
Policy = GetSetPolicy();

% Choose the best action
num = avsq(Policy(TDGrades));

end