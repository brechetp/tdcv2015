disc = imread('images/disc.jpg');
baboon = imread('images/baboon.tif');
img = imread('images/man.tiff');
man = imread('images/man.tiff');

close all;

img_copy = padding(img, 25, 25, 0);
img_mirror = padding(img, 25, 25, 1);
%mask = ones(25, 25);

%J = convolution(I, [-1, -1, -1; -1, 8,  -1; -1, -1, -1], 1);
imshow(img_copy)
figure()
imshow(img_mirror)
figure()

mean_mask = 0.9 * [1, 1, 1; 1, 1, 1; 1, 1, 1];
%mean_mask = [-1, -1, -1; -1, 8,  -1; -1, -1, -1]
img_filtered = convolution(disc, mean_mask, 0);
imshow(img_filtered);
figure();

%% Exercise 2
%a
tic
gauss_mask_1 = gauss(1);
img_blur_1_1 = convolution(img, gauss_mask_1, 0);
toc
%imshow(img_blur()
%figure()
tic
gauss_mask_3 = gauss(3);
img_blur_1_2 = convolution(img, gauss_mask_3, 0);
toc
%imshow(img_blur)
%figure()

% the more sigma is important, the more blurry the image is


% gauss_(x|y)(sigma) gives a 1D gaussian filter according to sigma
tic
m_x_1 = gauss_x(1);
m_y_1 = gauss_y(1);
im_tmp = convolution(man, m_x_1, 0);
img_blur_2_1 = convolution(im_tmp, m_y_1, 0); % second blur with sigma = 1
toc
figure()
tic
m_x_2 = gauss_x(3);
m_y_2 = gauss_y(3);
im_tmp = convolution(man, m_x_2, 0);
img_blur_2_2 = convolution(im_tmp, m_y_2, 0); % second blur with sigma = 1
toc
diff = [sqr_diff(img_blur_1_1, img_blur_2_1), sqr_diff(img_blur_1_2, img_blur_2_2)]


% the square difference is equal to 0, so the filterings are equivalent
% Is it really 0? In my test runs it's a very big number
 