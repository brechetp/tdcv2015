
%% Exercise 2
%a
close all;
img = imread('images/baboon.tif');
tic
gauss_mask_1 = gauss(1);
img_blur_1_1 = convolution(img, gauss_mask_1, 0);
toc
tic
gauss_mask_3 = gauss(3);
img_blur_1_2 = convolution(img, gauss_mask_3, 0);
toc
figure('Name', 'Gaussian blur with sigma = 1, 3');
subplot(1, 3, 1), subimage(img)
subplot(1, 3, 2), subimage(img_blur_1_1)
subplot(1, 3, 3), subimage(img_blur_1_2)

% the more sigma is important, the more blurry the image is


% gauss_(x|y)(sigma) gives a 1D gaussian filter according to sigma
tic
m_x_1 = gauss_x(1);
m_y_1 = gauss_y(1);
im_tmp = convolution(img, m_x_1, 0);
img_blur_2_1 = convolution(im_tmp, m_y_1, 0); % second blur with sigma = 1
toc
tic
m_x_2 = gauss_x(3);
m_y_2 = gauss_y(3);
im_tmp = convolution(img, m_x_2, 0);
img_blur_2_2 = convolution(im_tmp, m_y_2, 0); % second blur with sigma = 1
toc
figure('Name', 'Gaussian blur sigma=1, 3 on X then Y')
subplot(1, 3, 1), subimage(img)
subplot(1, 3, 2), subimage(img_blur_2_1)
subplot(1, 3, 3), subimage(img_blur_2_2)
diff = [sqr_diff(img_blur_1_1, img_blur_2_1), sqr_diff(img_blur_1_2, img_blur_2_2)]
ratio = diff ./ [sum(sum(sum(img_blur_1_1 .^2))), sum(sum(sum(img_blur_1_2 .^2)))]


% the ratio of the square difference by the total value of squared pixels is quite small (about 0.0001)
 
