function [x,y] = getrect2(image)
fig = figure;
imshow(image);
rect = round(getrect);
close(fig);
x = rect(2):rect(2)+((mod(rect(4), 2) == 1)*1)+rect(4); % assures the height is odd
y =  rect(1):+rect(1)+((mod(rect(3), 2) == 1)*1)+rect(3); % same for the width
return

