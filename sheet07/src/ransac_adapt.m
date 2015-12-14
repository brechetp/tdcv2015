function [H, inliers] = ransac_adapt(P1, P2,t, p)
N = Inf;
n = size(P1, 1);
sample_count = 0;
while N > sample_count
  s = randperm(n, 4);
  first = P1(s, :);
  second = P2(s, :);
  H = dlt(first, second);
  P1_transformed = normalcoords((H * P1')');
  P2_normal = normalcoords(P2);
  dist = sqrt(sum((P1_transformed - P2_normal).^2, 2));
  inliers = find(dist < t);
  N_inliers = size(inliers, 1);
  epsilon = 1 - N_inliers/n;
  N = log(1-p) / log( 1-(1-epsilon)^4);
  sample_count = sample_count + 1;
end



