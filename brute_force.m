% Brute force search for optimal solution of QUBO instance

load('PS06_SDPtwoWayPartitionData.mat');
W = W10;
[N,N] = size(W);
minimum = 100000000000000;
for i = 0:2^N - 1
    vec = flip(de2bi(i)');
    [bits,tmp] = size(vec);
    vec = [zeros(N-bits,1);vec];
    vec = 2*vec - 1;
    minimum = min(minimum,vec'*W*vec);
end

disp(minimum)
