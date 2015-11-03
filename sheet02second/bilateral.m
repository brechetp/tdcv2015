function [ out ] = bilateral( I, sigma, sigD, sigR )

[X, Y] = size(I);

for x = 1:X
    for y = 1:Y
        region = I(max(x-sigma,1):min(x+sigma, X), max(y-sigma, 1):min(y+sigma, Y));
        [XX, YY] = size(region);
        first = [1:sigma];
        
        cc = 0;
        r = 0;
        for xx = max(x-sigma,1):min(x+sigma, X)
           for yy = max(y-sigma, 1):min(y+sigma, Y)
               dist = norm([x-xx, y-yy]);
               c = bilateralhelper(dist / sigD);
               sDist = abs(I(x,y)-I(xx,yy));
               s = bilateralhelper(sDist/sigR);
               cc = cc + c * s;
               r = r + I(xx,yy) * c * s;
           end
        end
        out(x,y) = r / cc;
    end
end

end

