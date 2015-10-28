function g_x = f_gauss_x.m(u, sigma)

g_x = 1/(sqrt(2*pi)*sigma) + exp((-1/2) * (u^2) / sigma^2);

