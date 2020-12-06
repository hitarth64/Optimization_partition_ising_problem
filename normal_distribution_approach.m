% Using relaxed SDP formulation of the QUBO / Partition problem
% Optimization Problem relaxed SDP of QUBO formulation is described below:

% min(Tr(WX))
% subject to X >= 0 and [X]ii==1

% Then we generate several normal vectors with zero mean 
% and X (solution to the above problem) as the covariance matrix.
% Their signed / thresholded version then acts as our guess.
% We generate 100 such samples for every case. 

load('PS06_SDPtwoWayPartitionData.mat');
% Number of samples to generate using the normal distribution
K = 100;
% Change this to adapt the script for different QUBO matrix
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
opt_value_5 = 10000000000;
for i=1:K
    opt_value_5 = min(opt_value_5,sign(t(i,:))*W*sign(t(i,:))');
end


W = W10;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end

t = mvnrnd(zeros(n,1),X,K);
opt_value_10 = 10000000000;
for i=1:K
    opt_value_10 = min(opt_value_10,sign(t(i,:))*W*sign(t(i,:))');
end

W = W50;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end

t = mvnrnd(zeros(n,1),X,K);
opt_value_50 = 10000000000;
for i=1:K
    opt_value_50 = min(opt_value_50,sign(t(i,:))*W*sign(t(i,:))');
end
