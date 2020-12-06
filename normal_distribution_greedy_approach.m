% Finding solution to the partition problem / QUBO problem

% We use the solution of the normal distribution approach as the starting 
% points and then apply a greedy approach to find the optimal solution

load('PS06_SDPtwoWayPartitionData.mat');
% Number of samples drawn from the normal distribution
K = 100;

% Replace this to the matrix of your choice
W = W5;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end

t = mvnrnd(zeros(n,1),X,K);
vecs = sign(t);

for ind = 1:K
    vec = vecs(ind,:);
    
    better = true;
    while better
        for i = 1:length(vec)
            minimum = 10000000000;
            better = false;
            vecn = vec;
            vecn(i) = -1*vecn(i);
            if sum(vec.*W(:,i))*vec(i) > sum(vecn.*W(:,i))*vecn(i)
                better = or(better,true);
                local_min = min(minimum,sum(vec.*W(:,i))*vec(i)-sum(vecn.*W(:,i))*vecn(i));
                if local_min < minimum
                    minimum = local_min;
                    idx = i;
                end
            end
        end
        if better == true
            vec(idx) = vec(idx)*-1;
        end
    end    
    vecs(i,:) = vec;
end

opt_value = 100000000;
for i=1:K
    opt_value = min(opt_value, vecs(i,:)*W*vecs(i,:)');
end
