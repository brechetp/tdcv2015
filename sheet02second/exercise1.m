

baboon = rgb2gray(imread('images/lake.tiff'));

M = medianfilter(baboon, 1, 1);
imshow(M);