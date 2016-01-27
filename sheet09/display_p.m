function display_p(image, origin, shift)
x_min = min(origin(:, 1));
x_max = max(origin(:, 1));
y_min = min(origin(:, 2));
y_max = max(origin(:, 2));
corners = [[x_min, y_min]; [x_min, y_max]; [x_max, y_min]; [x_max, y_max]];
display_points(image, corners+shift)
end
