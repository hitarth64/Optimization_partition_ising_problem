% SDP bound with the formulation:
% min(-sum(v))
% subject to: W+diag(v) >= 0
% Solving this will give us a dual bound

load('PS06_SDPtwoWayPartitionData.mat');
W = W5;
[n,n] = size(W);
cvx_begin
    variable v(n);
    maximize(-sum(v));
    subject to
        W + diag(v) == semidefinite(n);
cvx_end
opt_value_5 = -sum(v)

W = W10;
[n,n] = size(W);
cvx_begin
    variable v(n);
    maximize(-sum(v));
    subject to
        W + diag(v) == semidefinite(n);
cvx_end
opt_value_10 = -sum(v)


W = W50;
[n,n] = size(W);
cvx_begin
    variable v(n);
    maximize(-sum(v));
    subject to
        W + diag(v) == semidefinite(n);
cvx_end
opt_value_50 = -sum(v)
