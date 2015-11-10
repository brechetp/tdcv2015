function M = harris_conv(Lx2, Ly2, Lxy, sigma_I, sigma_D)
g = fspecial('gauss', max(1, round(3*sigma_I)));
M = sigma_D^2*conv2([Lx2, Lxy; Lxy, Ly2], g, 'same');
