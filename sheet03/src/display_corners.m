function cornered_image = display_corners(I, corners)
% takes an image and a binary corner image, outputs the same image with boxes around the corner
[n, p] = size(I);
cornered_image = I;
[xx, yy]= find(corners);
coords = [xx, yy];
for r=1:size(coords, 1)
  x =coords(r, 1);
  y = coords(r, 2);
  cornered_image(max(1, x-5):min(n, x+5), max(1, y-5)) = 1 - round(I(max(1, x-5):min(n, x+5), max(1, y-5)));
  cornered_image(max(1, x-5):min(n, x+5), min(p, y+5)) = 1 - round(I(max(1, x-5):min(n, x+5), min(p, y+5)));
  cornered_image(max(1, x-5), max(1, y-5):min(p, y+5)) = 1 - round(I(max(1, x-5), max(1, y-5):min(p, y+5)));
  cornered_image(min(n, x+5), max(1, y-5):min(p, y+5)) = 1 - round(I(min(n, x+5), max(1, y-5):min(p, y+5)));
end
