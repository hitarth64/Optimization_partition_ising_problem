% Using relaxed SDP formulation of the QUBO / Partition problem
% Optimization Problem relaxed SDP of QUBO formulation is described below:

% min(Tr(WX))
% subject to X >= 0 and [X]ii==1

% Then we choose the eigenvector of X with the largest eigenvalue as our 
% guess for the optimal solution to our partition problem

load('PS06_SDPtwoWayPartitionData.mat');
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
opt_value_5 = trace(W*X);

[V,D] = eig(X);
[d,ind] = sort(diag(D));
Vs = sign(V(:,ind(length(ind))));
opt_value_5 = Vs'*W*Vs

W = W10;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end
opt_value_10 = trace(W*X);

[V,D] = eig(X);
[d,ind] = sort(diag(D));
Vs = sign(V(:,ind(length(ind))));
opt_value_10 = Vs'*W*Vs

W = W50;
[m,n] = size(W);
cvx_begin
    variable X(n,n);
    minimize(trace(W*X));
    subject to
        X == semidefinite(n);
        diag(X) == ones(n,1);
cvx_end
opt_value_50 = trace(W*X);

[V,D] = eig(X);
[d,ind] = sort(diag(D));
Vs = sign(V(:,ind(length(ind))));
opt_value_50 = Vs'*W*Vs
