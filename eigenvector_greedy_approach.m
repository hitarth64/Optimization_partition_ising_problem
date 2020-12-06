% Finding optimal solution of the partition / QUBO problem
% We combine SDP with greedy approach

% We use the solution of the largest eigenvector approach as the starting 
% point and then apply a greedy approach to find the optimal solution

load('PS06_SDPtwoWayPartitionData.mat');
% Replace this to the matrix of your choice
W = W50;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end
opt_value = trace(W*X);

[V,D] = eig(X);
[d,ind] = sort(diag(D));
Vs = sign(V(:,ind(length(ind))));
vec = Vs;

% Greedy routine
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

opt_val = vec'*W*vec
