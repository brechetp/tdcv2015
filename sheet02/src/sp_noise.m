function noisy = sp_noise(I, percent_b, percent_w)
[M, N, Z] = size(I);
nbr_white = round(percent_w/100 * M * N);
nbr_black = round(percent_b/100 * M * N);
noisy = I;
for z = 1:Z

  for i=1:nbr_white
    row = round(unifrnd(1, M));
    col = round(unifrnd(1, N));
    noisy(row, col, z) = 255;
  end

  for i=1:nbr_black
    row = round(unifrnd(1, M));
    col = round(unifrnd(1, N));
    noisy(row, col, z) = 0;
  end
end
