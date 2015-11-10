corners = harris_laplace(img, k, s_0, N, alpha, threshold);
Ic = display_corners(img, corners);
imshow(Ic);

