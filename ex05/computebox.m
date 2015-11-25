function [ out ] = computebox( I, x, x0, y, y0, z, s )

    out = padd(I, x+x0+s, y+y0+s, z) - padd(I, x+x0-s,y+y0+s, z) - padd(I, x+x0+s,y+y0-s, z) + padd(I, x+x0-s,y+y0-s, z);

end
