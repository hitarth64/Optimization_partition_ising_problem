# Optimization_partition_ising_problem
Finding optimal solutions to parition aka ising aka QUBO problems using different methods

#### Requirements to run on the MATLAB:
CVX OPT package for MATLAB: Downloadable from [CVX website](http://cvxr.com/cvx/download/).
Code tested with MATLAB 2020

#### Information about the files:

PS06_SDPtwoWayPartitionData.mat: Sample cost / ising hamiltonians of sizes 5,10 and 50 

SDP_bound.m: Gives SDP bound to the partition problem

bounds_observations.pdf: Tabulates the different values

brute_force.m: Brute force solution to our partition problem

largest_eigenvector_approach.m: Tries to find optimal solution using eigenvalue decomposition of the SDP solution

eigenvector_greedy_approach.m: Combines eigenvalue approach with greedy approach 

normal_distribution_approach.m: Tries to find optimal solution by drawing samples from a normal distribution with SDP solution as its covariance

normal_distribution_greedy_approach.m: Combines normal distribution approach with a greedy algorithm

simple_greedy_approach.m: Greedy approach on random vectors of +1s and -1s

