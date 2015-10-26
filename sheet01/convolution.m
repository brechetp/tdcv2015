function J = convolution(I, mask, pad_type)
[X, Y, Z] = size(I);
[M,N] = size(mask);
I_bordered = padding(I, M, N, pad_type);
if sum(sum(mask)) ~= 0
  mask_s= flipud(fliplr(mask))/(sum(sum(mask)));
else
  mask_s= flipud(fliplr(mask));
end

for x=1:X
  for y=1:Y
    for z =1:3
      J(x, y, z) = uint8(sum(sum(mask_s .* double(I_bordered(x:x+M-1, y:y+N-1, z)))));
    end
  end
end
