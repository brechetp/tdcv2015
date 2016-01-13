function display_points(image, points)
% plots the region delimited by the 4 points in the image

imshow(image);
hold on;
for i =1:size(points, 1)
  plot(points(i, 1), points(i, 2), 'r+');
end
end
