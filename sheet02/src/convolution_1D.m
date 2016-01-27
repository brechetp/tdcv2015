function filtered = convolution_1D(I, mask)
% convolutes a mtrix with a vector
[Q, R, S] = size(I);
[M, N, P] = size(mask);
if (M == 1)
  I_padded = double(padarray(I, [0, floor(N/2)], 'replicate'));
  for k=1:S
    for j=1:R
      filtered(:, j, k) = conv(I_padded(:, j, k), mask, 'same');
    end
  end
end
if (N == 1)
  I_padded = padarray(I, [floor(M/2), 0], 'replicate');
  for k=1:S
    for i=1:Q
      filtered(i, :, k) = conv(I_padded(i, :, k)', mask', 'same');
    end
  end
end

