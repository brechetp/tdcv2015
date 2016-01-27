%% Exercise 3
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
figure('Name', 'Gradient (amplitude, orientation) for the image')
subplot(1, 2, 1), subimage(mat2gray(M))
subplot(1, 2, 2), subimage(mat2gray(O))

% noise reduction

G = gauss(3);
tic
I_1 = convolution( convolution2(img, G, 0), Dx, 0);
I_2 = convolution( convolution2(img, G, 0), Dy, 0);
toc
tic
I_3 = convolution( img, convolution2(G, Dx, 0), 0);
I_4 = convolution( img, convolution2(Dy, G, 0), 0);
toc
figure('Name', 'convolutions (first row is D * (G*I))')
subplot(2, 2, 1), imshow((mat2gray(I_1))
subplot(2, 2, 2), subimage((mat2gray(I_2)))
subplot(2, 2, 3), subimage((mat2gray(I_3)))
subplot(2, 2, 4), subimage((mat2gray(I_4)))
diff = [sqr_diff(I_1, I_3), sqr_diff(I_2, I_4)]
ration = diff ./ [sum(sum(sum(I_1 .^2))), sum(sum(sum(I_2 .^2)))]


