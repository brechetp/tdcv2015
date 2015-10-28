I2 = imread('images/photo.jpg');
I = imread('images/baboon.tif');
I_copy = padding(I, 25, 25, 0);
I_mirror = padding(I, 25, 25, 0);
I2_copy = padding(I2, 25, 25, 0);
%mask = ones(25, 25);

J = convolution(I2, [-1, -1, -1; -1, 8,  -1; -1, -1, -1], 0)
imshow(J)

D = convolution(I, 0.9 .* ones(3, 3), 1);
%imshow(D);

 