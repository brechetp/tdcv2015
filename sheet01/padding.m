%% Exercise 1: Convolution

function I_bordered = padding(I, M, N, param)
m = floor(M/2);
n = floor(N/2);
[X, Y, Z] = size(I);
switch param
case 0 % copy-the-border treatment
  %I_bordered = padarray(I, [m, n], 'replicate');
  for z = 1:Z
    I_bordered(1+m:m+X, 1+n:n+Y, z) = I(1:X, 1:Y, z);
    border_xu = I(1, :, z);
    border_xd = I(X, :, z);
    border_yl = I(:, 1, z);
    border_yr = I(:, Y, z);
    I_bordered(1:m, (n+1):(n+Y), z) = repmat(border_xu, [m, 1]);
    I_bordered((m+X+1):(M+X-1), (n+1):(n+Y), z) = repmat(border_xd, [m, 1]);
  end

case 1 % mirror the border treatment
    I_bordered = padarray(I, [m, n], 'symmetric');
otherwise
    error('The padding style is not recognized');

end

