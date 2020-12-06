% Finding solution to the partition problem / QUBO problem

% We generate K random sample vectors of +/- 1s  
% Using greedy approach, we then try to find the optimal solution to our
% QUBO / partition problem

load('PS06_SDPtwoWayPartitionData.mat');

K = 100;
% change this matrix to one of your choice
W = W50;
[n,n] = size(W);
vecs = randi([0, 1],K,n);
vecs = 2*vecs - 1;

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
