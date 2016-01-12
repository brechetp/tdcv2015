function U = normalize(points)
N = size(points, 1);
[x0, y0] = centroid(points); % new origin;
shift = repmat([-x0, -y0], [N, 1]);
p_norm = points + shift;
scale_factor = N * sqrt(2) / sum(sqrt(p_norm(:, 1) .^2 + p_norm(:, 2) .^2));
U = [[scale_factor, 0, -x0*scale_factor]; [0, scale_factor, -y0*scale_factor]; [0, 0, 1]];
end
