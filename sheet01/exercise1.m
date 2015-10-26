I = imread('baboon.tif');
I_copy = padding(I, 25, 25, 0);
I_mirror = padding(I, 25, 25, 0);

%mask = ones(25, 25);

J = convolution(I, [-1, -1, -1; -1, 8,  -1; -1, -1, -1], 1);
imshow(J)


