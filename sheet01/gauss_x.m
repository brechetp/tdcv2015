function mask = gauss_x(sigma)

N = 2*floor(3*sigma/2) + 1; % N is odd
n = floor(N/2);
mask = arrayfun(@(x) (1/(sqrt(2*pi)*sigma) + exp((-1/2) * (x^2) / sigma^2)), (-n:n));
