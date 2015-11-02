function noisy = gauss_noise(I, mu, sigma)
noise = mu + (sigma .* randn(size(I)));
noisy = uint8(double(I) + noise);
