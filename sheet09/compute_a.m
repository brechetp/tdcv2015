function A = compute_a (point1, point2)
N = size(point1, 1);
M = size(point2, 1);
if N ~= M
  error('Points number mismatch');
end
A = zeros(2*N, 9);
for n = 1:N
  A(2*n-1: 2*n, :) = compute_ai(point1(n,:), point2(n, :));
end


