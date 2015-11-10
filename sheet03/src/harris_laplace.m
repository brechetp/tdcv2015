function corners = harris_laplace(I, k, s_0, n, alpha, t)
[P, Q] = size(I);
L = zeros(n+1, P, Q); % array of laplacianed images
corners = zeros(P, Q);
laplace_mask = fspecial('laplacian');
max_mask = ones(3);
max_mask(2, 2) = 0;

for i=0:n
  sigma_i = s_0*k^i; 
  R = harris(I, i, s_0, k, alpha, t); % response wrt the corenerness
  corner_image = R > ordfilt2(R, 8, max_mask); % binary image of the corners (we take the local maxima)
  gauss_mask = fspecial('gaussian', round(6*sigma_i), sigma_i);
  I_laplaced = abs(sigma_i ^2 *conv2(conv2(I, gauss_mask, 'same'), laplace_mask, 'same')); % convolution with laplacian
  L(i+1, :, :) = (corner_image .* I_laplaced); % the
end

for i=2:n
  Ldiff = (L(i, :, :) > L(i-1, :, :)) .* (L(i, :, :) > L(i+1, :, :)) ;
  corners(Ldiff == 1) = 1;
end













