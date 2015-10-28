close all;
Dx = repmat(-1:1, [3, 1]);
Dy = Dx';
img = imread('images/man.tiff');
%img_grad_x = convolution(img, Dx, 0);
%img_grad_y = convolution(img, Dy, 0);
%figure();
%imshow(img_grad_y)
%figure()
%imshow(img_grad_x)
[M, O] = gradient(img);
figure()
imshow(M)
figure()
imshow(mat2gray(O))

% noise reduction

G = gauss(3);
tic
I_1 = convolution( convolution(img, G, 0), Dx, 0);
I_2 = convolution( convolution(img, G, 0), Dy, 0);
toc
tic
I_3 = convolution( img, convolution(G, Dx, 0), 0);
I_4 = convolution( img, convolution(G, Dy, 0), 0);
toc
sqr_diff(I_1, I_3)
sqr_diff(I_2, I_4)
