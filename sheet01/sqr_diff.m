function diff = sqr_diff(img_1, img_2)

diff = sum(sum(sum((img_1 - img_2).^2)));
