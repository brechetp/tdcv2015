function J = convolution(I, mask, pad_type)
[X, Y, Z] = size(I);
[M,N] = size(mask);
I_bordered = padding(I, M, N, pad_type);
<<<<<<< HEAD
%if and((sum(sum(mask)) ~= 0), false)
 % mask_s= flipud(fliplr(mask))/(sum(sum(mask)));
%else
 % mask_s= flipud(fliplr(mask));
%end
mask_s= flipud(fliplr(mask));
=======
if sum(sum(mask)) ~= 0
  mask_s= flipud(fliplr(mask))/(sum(sum(mask)));
else
  mask_s= flipud(fliplr(mask));
end
%mask_s= flipud(fliplr(mask));
>>>>>>> cde9c21685847f9572c4b9ad147fb4b24d040465


for z =1:Z
  for x=1:X
    for y=1:Y
<<<<<<< HEAD
      J(x, y, z) = uint8(sum(sum(double(mask_s) .* double(I_bordered(x:x+M-1, y:y+N-1, z)))));
     
     
=======
      J(x, y, z) = (sum(sum(double(mask_s) .* double(I_bordered(x:x+M-1, y:y+N-1, z)))));
>>>>>>> cde9c21685847f9572c4b9ad147fb4b24d040465
    end
  end
end
