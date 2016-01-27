function [ out ] = integralImages( I )

[X, Y, Z] = size(I);

out = zeros(X,Y,Z);
for c = 1:Z
   for x = 1:X
       counter = uint64(0);
       for y = 1:Y
           counter = counter + uint64(I(x,y,c));
           out(x,y,c) = out(max(x-1,1),y) + counter;
       end
   end
end

end

