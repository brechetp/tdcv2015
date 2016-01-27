close all;
harris_image = harris(img, N, s_0, k, alpha, threshold);
harris_image_scaled = (harris_image - min(harris_image(:)))/(max(harris_image(:)) - min(harris_image(:)));
imshow(harris_image_scaled);
corners = harris_laplace(img, k, s_0, N, alpha, threshold);
Ic = display_corners(img, corners);
%figure();
%imshow(Ic);

