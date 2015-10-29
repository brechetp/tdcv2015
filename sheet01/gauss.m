% generates a 2D gaussian filter based on a parameter sigma

function filter = gauss(sigma)
N = 2*floor(3*sigma/2)+1; % N is odd
n = floor(N/2);
filter = zeros(N,N);
for i = -n:n
    % Shouldn't it be a * instead of a + before the exp? Yes indeed!
  filter(i+n+1, :) = arrayfun(@(u, v) (1/(2*pi*sigma^2) * exp((-1/2) * (u^2 + v^2) / sigma^2)), (-n:n), ones(1, 2*n+1) * i);
end

