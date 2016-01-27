function domain_filter = c(x, y, sigma_d)
domain_filter = exp(-1/2 * (sqrt(sum((x-y).^2)) / sigma_d)^2);
