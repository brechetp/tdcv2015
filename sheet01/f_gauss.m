function G = f_gauss(u, v, sigma)
G = 1/(2*pi*sigma^2) + exp((-1/2) * (u^2 + v^2) / sigma^2);
