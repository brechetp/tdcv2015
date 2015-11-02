function median = median(M)
% returns the median value for M matrix
[n, p] = size(M);
A = n*p; % total number of elements
N = sort(reshape(M, 1, n*p));
if mod(A, 2) == 0
  median = 0.5 * (N(A/2) + N(A/2 + 1));
else
  median = N(ceil(A/2));
end
  

