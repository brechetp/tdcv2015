function match = EM(i, j, OI, OT, GI, GT, tau)
% takes the orientations, the magnitudes and the threshold to compute the match for pixel x,y
[Nt, Mt] = size(GT)[Nt, Mt] = size(GT);;
x_range = (j-floor(Mt/2)) : (j + floor(Mt/2));
y_range = (i-floor(Nt/2)) : (i + floor(Nt/2));
alpha = sum( (GT>tau) ); % normalization factor, tau is the threshold
match = alpha * sum(sum( (GT > tau) .* (GI(y_range, x_range) > tau) .* abs(cos(OT - OI(y_range, x_range)))));
return
