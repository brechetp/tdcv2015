close all;
image_file = '../data/clutter.jpg';
image = im2double(imread(image_file));
new = 0;
if new || ~exist('xt')
[xt, yt] = getrect2(image); % odd width and height
end
template = image(xt, yt, :); % select the template in the image
figure
imshow(template);
benchmark(image, template, 1, 1) % color and no pyramid
benchmark(image, template, 0, 1) % B&W and no pyramid
benchmark(image, template, 1, 4) % color and pyramid
benchmark(image, template, 0, 4) % B&W and pyramid
