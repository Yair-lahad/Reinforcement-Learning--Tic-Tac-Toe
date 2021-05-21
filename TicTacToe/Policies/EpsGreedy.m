function num = EpsGreedy(Grades)
%EPSGREEDY Epsilon-greedy policy
% Grades    - The critic grades for each possible action
% num       - The chosen action's index

% TODO: Determine the optimal value for epsilon
epsilon = 0.2;

if (rand < epsilon)
    % Choose random action with probability epsilon
    num = randi(length(Grades));
else
    % Choose greedy action with probability (1 - epsilon)
    num = Greedy(Grades);
end

end

