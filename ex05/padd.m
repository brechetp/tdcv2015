function [ out ] = padd( I, x, y, z )

[X,Y,Z] = size(I);

out = I( max(min(x,X), 1), max(min(y,Y), 1), max(min(z,Z), 1));

end

