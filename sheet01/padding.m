%% Exercise 1: Convolution

function I_bordered = padding(I, M, N, param)
m = floor(M/2);
n = floor(N/2);
[X, Y, Z] = size(I);
switch param
case 0 % copy-the-border treatment
  % body replication
  I_bordered(1+m:m+X, 1+n:n+Y, :) = I(1:X, 1:Y, :);
  border_xu = I(1, :, :);
  border_xd = I(X, :, :);
  border_yl = I(:, 1, :);
  border_yr = I(:, Y, :);
  I_bordered(1:m, (n+1):(n+Y), :) = repmat(border_xu, [m, 1]);
  I_bordered((m+X+1):(M+X-1), (n+1):(n+Y), :) = repmat(border_xd, [m, 1]);
  I_bordered((m+1):(m+X), 1:n, :) = repmat(border_yl, [1, n]);
  I_bordered((m+1):(m+X), (n+Y+1):(N-1+Y), :) = repmat(border_yr, [1, n]);

  % Corner replication

  I_bordered(1:m, 1:n, :) = repmat(I(1, 1, :), [m, n]);
  I_bordered((m+X+1):(M+X-1), 1:n, :) =repmat(I(X, 1, :), [m, n]);
  I_bordered(1:m, (n+Y+1):(N-1+Y), :) = repmat(I(1, Y, :), [m, n]);
  I_bordered((m+X+1):(M+X-1), (n+Y+1):(N-1+Y), :) = repmat(I(X, Y, :), [m, n]);


case 1 % mirror the border treatment
    %I_bordered = padarray(I, [m, n], 'symmetric');
    
  I_bordered(1+m:m+X, 1+n:n+Y, :) = I(1:X, 1:Y, :);
  border_xu = I(1:m, :, :);
  border_xd = I(X-m+1:X, :, :);
  border_yl = I(:, 1:n, :);
  border_yr = I(:, Y-n+1:Y, :);
  I_bordered(1:m,               (n+1):(n+Y), :) = flipud(border_xu);
  I_bordered((m+X+1):(M+X-1),   (n+1):(n+Y), :) = flipud(border_xd);
  I_bordered((m+1):(m+X),       1:n, :) = fliplr(border_yl);
  I_bordered((m+1):(m+X),       (n+Y+1):(N-1+Y), :) = fliplr(border_yr);
  
  border_tl = I(1:m,    1:n, :);
  border_tr = I(1:m,    Y-n+1:Y, :);
  border_dl = I(X-m+1:X,1:n, :);
  border_dr = I(X-m+1:X,Y-n+1:Y, :);
  %disp(size(border_tr));
  %disp(size(I_bordered(1:m, (n+1):(n+Y), :)));
  I_bordered(1:m,               1:n, :) = flipud(fliplr(border_tl));
  I_bordered(1:m,               (n+Y+1):(N-1+Y), :) = flipud(fliplr(border_tr));
  I_bordered((m+X+1):(M+X-1),   1:n, :) = flipud(fliplr(border_dl));
  I_bordered((m+X+1):(M+X-1),   (n+Y+1):(N-1+Y), :) = flipud(fliplr(border_dr));
otherwise
    error('The padding style is not recognized');

end

