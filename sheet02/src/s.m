function range_filter = s(I, x, y, sigma_r)
range_filter = exp(-1/2 * (sqrt(sum((I(x)-I(y)).^2)) / sigma_r)^2);
