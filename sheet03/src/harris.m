function R = harris(I, n, s_0, k, alpha, t)
% gradient masks
Dx = repmat([-1:1], [3, 1]);
Dy = Dx';
sigma_I = k^n * s_0;
sigma_D = 0.7 * sigma_I;
gauss_D = fspecial('gaussian', round(6*sigma_D), sigma_D);
gauss_I = fspecial('gaussian', round(6*sigma_I), sigma_I);
Lx = conv2(conv2(I, Dx, 'same'), gauss_D, 'same'); % smoothed gradient according to x
Ly = conv2(conv2(I, Dy, 'same'), gauss_D, 'same'); % smoothed gradient according to y

M1 = sigma_D^2*conv2(Lx .^2, gauss_I, 'same'); % scaling convolution
M2 = sigma_D^2*conv2(Ly.^2, gauss_I, 'same'); % to produce the M matrix
M12 = sigma_D^2*conv2(Lx .* Ly, gauss_I, 'same');
R = (M1 .* M2 - M12 .^2) - alpha * (M1 + M2) .^2; % det(M) - alpha*tr(M)^2
R(R<t) = 0;
end
