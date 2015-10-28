% returns the gradient images (magnitude and orientation for I
function [magn, orient]= gradient(I)
Dx = repmat(-1:1, [3, 1]);
Dy = Dx';
if size(I, 3) == 3
  I = rgb2gray(I);
end
X = convolution(I, Dx, 0);
Y = convolution(I, Dy, 0);
magn = mat2gray(sqrt(double(X.^2 + Y.^2)));
orient = atan(double(Y./X));
