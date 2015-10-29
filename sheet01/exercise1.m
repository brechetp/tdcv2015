disc = imread('images/disc.jpg');
baboon = imread('images/baboon.tif');
img = imread('images/baboon.tif');
man = imread('images/man.tiff');

close all;

img_copy = padding(img, 25, 25, 0);
img_mirror = padding(img, 25, 25, 1);
%mask = ones(25, 25);

%J = convolution(I, [-1, -1, -1; -1, 8,  -1; -1, -1, -1], 1);
mean_mask = 1/9 * [1, 1, 1; 1, 1, 1; 1, 1, 1];
%mean_mask = [-1, -1, -1; -1, 8,  -1; -1, -1, -1]
img_filtered = convolution(disc, mean_mask, 0);
figure('Name', 'Mean filter')
subplot(1,2,2), subimage(img_filtered)
subplot(1,2,1), subimage(disc)

