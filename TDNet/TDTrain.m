function TDTrain(S, r,nGame)
% Train the TD system
% S - The states' history for a given trial
% r - the reward given for each state in the given trial

% Load the network's data if needed
global Net;
LoadNet();
%parameters
gamma=0.9;
eta=0.1/(1+1e-4*nGame);
%learning
for i=1:length(r)
    [v,grad]=TDEvaluate(S(:,i));
    %set V(i+1)
    if i<length(r)
        v_next=TDEvaluate(S(:,i+1));
    else
        v_next=0;
    end
    % update delta
    delta = r(i)+ gamma*v_next -v;
    
    % update weights
    for j = 1: size(Net.W,2)
        dW = eta*delta.*reshape(grad{j}(1, :, :),[size(grad{j},2),size(grad{j},3)]);
        Net.W{j}  = Net.W{j}+ dW;
    end
end
end

