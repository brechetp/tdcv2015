function [X, Y] = centroid(points)
% returns the coordinates of the centroid of the points
X = mean(points(:, 1));
Y = mean(points(:, 2));

end

