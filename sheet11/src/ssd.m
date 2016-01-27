function [ out ] = ssd( I, T, x, y , c)

    [X, Y, Z] = size(I);
    [XT, YT, ZT] = size(T);
    
    IPart = I(x:x+XT-1, y:y+YT-1, :);
    diff = T - IPart;
    diff = diff .* diff;
    out = sum(sum(mean(diff, 3)));
    %out = sum(sum(sum(diff)));

end

