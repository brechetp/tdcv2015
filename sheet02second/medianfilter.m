function out = medianfilter( I, dx, dy )

[X, Y] = size(I);

X
Y

for x = 1:X
    for y = 1:Y
        region = I(max(x-dx,1):min(x+dx, X), max(y-dy, 1):min(y+dy, Y));
        a = myMedian(region(:));
        out(x,y) = a;
    end
end

end

