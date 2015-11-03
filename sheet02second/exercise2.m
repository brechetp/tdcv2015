addpath('../sheet01')

img1 = rgb2gray(imread('images/lake.tiff'));
img = im2double(img1);

% tic
% %resTest = bilateral(img,5, 5, 5);
% toc
% tic
% resTest2 = bilateral2(img, 1,1, 1);
% toc
% figure(42);
% %imshow(resTest);
% figure(43);
% imshow(resTest2);


tic
res1 = bilateral2(img, 1, 1, 1);
toc
tic
res5 = bilateral2(img, 5, 5, 5);
toc
%res3 = bilateral(img, 3, 3, 3);
tic
res10 = bilateral2(img, 10, 10, 10);
toc
% tic
% res10slow = bilateral(img, 10, 10, 10);
% toc

figure('Name', 'Images')
subplot(2,3,1), subimage(res1)
subplot(2,3,2), subimage(res5)
subplot(2,3,3), subimage(res10)
subplot(2,3,4), subimage(res10slow)

tic
gaussed = convolution(img1, gauss(1), 0);
gaussed5 = convolution(img1, gauss(5), 0);
gaussed10 = convolution(img1, gauss(10), 0);
toc
subplot(2,3,4), subimage(gaussed)
subplot(2,3,5), subimage(gaussed5)
subplot(2,3,6), subimage(gaussed10)

% c) With the Gaussian filter the edges become less clear than with the
% bilateral filter.
% d) No, because the range filter weights each pixel with difference of the brightnesses which cannot
% be encoded with a static convolution mask
% e) The domain filter weights using the distance of the pixels, the range
% filter the difference of the image brightness.