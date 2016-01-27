function [ out ] = bilateral2( I, sigma, sigD, sigR )

[X, Y] = size(I);


for x = 1:X
    for y = 1:Y
        mult = sigma * 2 + 1;
        %wantedDimension = ones(mult)
        region = I(max(x-sigma,1):min(x+sigma, X), max(y-sigma, 1):min(y+sigma, Y));
       
        
        [XX, YY] = size(region);
        first = [1:sigma];
        second = fliplr(first);
        full = [second,0,first];
        full1 = repmat(full,mult,1);
        full2 = repmat(full',1,mult);
        
        coords = [-second,0,first];
        coordsX = coords + x;
        coordsY = coords + y;
        coordsX(coordsX<0)=0;
        coordsX(coordsX>X)=0;
        coordsX(coordsX>0)=1;
        
        coordsY(coordsY<0)=0;
        coordsY(coordsY>X)=0;
        coordsY(coordsY>0)=1;
        Trunc1 = repmat(coordsX', 1, mult);
        Trunc2 = repmat(coordsY, mult, 1);
        
        sqrdists = full1.^2+full2.^2;
        dists = sqrt(sqrdists);
        dists2 = dists ./ sigD;
        cMat = exp(-0.5 * double(dists2).^2);
        
        cMat = truncatezeros(cMat .* Trunc1 .* Trunc2);
        
        sDists = abs(region - I(x,y));
        sMat = exp(-0.5 * double(sDists ./ sigR).^2);
        %sMat = truncatezeros(sMat .* Trunc1 .* Trunc2)
        
        ccc = sum(sum(cMat .* sMat));
        
        out(x,y) = sum(sum(cMat .* sMat .* region)) / ccc;
        
%         cc = 0;
%         r = 0;
%         for xx = max(x-sigma,1):min(x+sigma, X)
%            for yy = max(y-sigma, 1):min(y+sigma, Y)
%                dist = norm([x-xx, y-yy]);
%                c = bilateralhelper(dist / sigD);
%                sDist = abs(I(x,y)-I(xx,yy));
%                s = bilateralhelper(sDist/sigR);
%                cc = cc + c * s;
%                r = r + I(xx,yy) * c * s;
%            end
%         end
%         out(x,y) = r / cc;
    end
end

end

