function match = EM(i, j, OI, OT, GI, GT, tau)
% takes the orientations, the magnitudes and the threshold to compute the match for pixel x,y
if i == 0 || j == 0
  match = 0;
  return
end
[Nt, Mt] = size(GT);
[Ni, Mi] = size(GI); % image size
x_range = max(1, 2 + floor(Mt/2) - j) : min(Mt, floor(Mt/2) + 1- j + Mi);
y_range = max(1, 2 + floor(Nt/2) - i) : min(Nt, floor(Nt/2) + 1- i + Ni);
xi_range = max(1, j-floor(Mt/2)) : min(Mi, j+floor(Mt/2));
yi_range = max(1, i-floor(Nt/2)) : min(Ni, i+floor(Nt/2));
GT = GT(y_range, x_range);
GI = GI(yi_range, xi_range);
OT = OT(y_range, x_range);
OI = OI(yi_range, xi_range);
alpha = 1 / sum(sum( (GT>tau)) ); % normalization factor, tau is the threshold
match = alpha * sum(sum( (GT > tau) .* (GI > tau) .* abs(cos(OT - OI))));
return
