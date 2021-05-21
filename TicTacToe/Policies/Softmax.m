function num = Softmax(Grades)
%EPSGREEDY Softmax policy
% Grades    - The critic grades for each possible action
% num       - The chosen action's index

beta=10;
result = exp(beta .* Grades);
result = result ./ sum(result);
num = find(rand<cumsum(result),1,'first');

end
