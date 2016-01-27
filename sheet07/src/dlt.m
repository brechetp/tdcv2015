function H = dlt(points1, points2)
U = normalize(points1(:, 1:2));
T = normalize(points2(:, 1:2));
points1_n = (U * points1')';
points2_n = (T * points2')';

N = size(points1, 1);
M = size(points2, 1);
if N~= M
  error('points number mismatch');
end

A = compute_a(points1_n, points2_n);
[Ud, D, V] = svd(A);
h = V(:, size(V, 2));
H_tilde = reshape(h, [3, 3])';
H = (inv(T) * H_tilde) * U;


