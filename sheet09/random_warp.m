function [warped_image, shift] = random_warp(image, coordinates, range)

x_min = min(coordinates(:, 1));
x_max = max(coordinates(:, 1));
y_min = min(coordinates(:, 2));
y_max = max(coordinates(:, 2));
X_MIN = 1;
Y_MIN = 1;
[X_MAX, Y_MAX,] = size(image);

% x_min, y_min ----------- x_max, y_min
%       |                       |
%       |                       |  
%       |                       |
% x_max, y_min ----------- x_max, y_max
% We're sure to have a well formated rectangle
corners = [[x_min, y_min]; [x_min, y_max]; [x_max, y_min]; [x_max, y_max]];
%range = 5; % range in pixels
shift = zeros(4, 2);
rand_corners = zeros(4, 2);
for i=1:4
  for j=1:2
    shift(i,j) = round(rand * (2*range) - range);
    rand_corners(i,j) = corners(i,j) + shift(i,j);
  end
end
n_corners = [corners, ones(4, 1)];
n_rand_corners = [rand_corners, ones(4, 1)];
% rand_corners are the new corners of the rectangle
H = dlt(n_corners, n_rand_corners);
invH = inv(H);
T = projective2d(H');
i=1; %  index of the warped vecotr
for x=x_min:5:x_max
  for y=y_min:5:y_max
    inv_point = invH * [x; y; 1];
    point = round(normalcoords(inv_point')); % nearest neighbour
    if point(1) >= X_MIN && point(1) <= X_MAX && point(2) >= Y_MIN && point(2) <= Y_MAX
      warped_image(i) = image(point(1), point(2));
    else
      warped_image(i) = 0;
    end
    i = i+1;
  end
end
m = mean(warped_image);
std_dev = std(warped_image);
warped_image = (warped_image' - m) / std_dev;
return







