img1 = single(imread('box.pgm'));
img2 = single(imread('scene.pgm'));
P1 = [1, 1, 1; 2, 2, 1; 3, 2, 1; 5, 5, 1];
P2 = [2, 2, 1; 3, 3, 1; 4, 3, 1; 6, 6, 1];
%H = dlt(P1, P2)
[f1,d1] = vl_sift(img1);
[f2,d2] = vl_sift(img2);
[matches, scores] = vl_ubcmatch(d1, d2);
second = f2(1:2, matches(2, :))';
first = f1(1:2, matches(1, :))';

P11 = [first, ones(size(first,1), 1)];
P22 = [second, ones(size(second,1), 1)];

% H: P11 to P22
[bestIn, H] = ransac(P11, P22, 4, 5, size(matches, 2) * 0.7, 100);
T = projective2d(H')
reference = imref2d(size(img2));
imgTrans = imwarp(uint8(img1),T,'FillValues', 255,'OutputView',reference);
figure(1);
imshow(uint8(imgTrans))
figure(2);
imshow(uint8(img2));
figure(3);
imshowpair(img2,imgTrans,'blend');
%imshow(uint8(uint8(img2)+uint8(imgTrans)));


