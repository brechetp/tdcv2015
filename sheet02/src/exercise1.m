close all;
img = imread('../../images/pirate.tif');
sp_img = sp_noise(img, 1, 1);
gauss_img = gauss_noise(img, 0, 5);
[M, N, P] = size(img);
sp_img_median = median_filter(sp_img, [3, 3]);
gauss_img_median = median_filter(gauss_img, [3, 3]);
figure()
subplot(2, 2, 1); subimage(sp_img);
subplot(2, 2, 2); subimage(gauss_img);
subplot(2, 2, 3); subimage(sp_img_median);
subplot(2, 2, 4); subimage(gauss_img_median);

mask_x = gauss_x(5);
mask_y = gauss_y(5);
gauss_img_gauss = convolution_1D(convolution_1D(gauss_img, mask_x), mask_y);
sp_img_gauss = convolution_1D(convolution_1D(sp_img, mask_x), mask_y);
figure()
subplot(2, 2, 1); subimage(sp_img);
subplot(2, 2, 2); subimage(gauss_img);
subplot(2, 2, 3); subimage(uint8(sp_img_gauss));
subplot(2, 2, 4); subimage(uint8(gauss_img_gauss));
% we see that the median filter removes the salt and pepper noise (since its variance is really high) and the gaussian filter removes best the gaussian noise (since it filters in the same fashion the noise is generated)
