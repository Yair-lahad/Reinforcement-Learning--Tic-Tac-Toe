function num = Greedy(Grades)
%GREEDY Greedy policy
% Grades    - The critic grades for each possible action
% num       - The chosen action's index

% Choose the best action
[~, num] = max(Grades);

end

