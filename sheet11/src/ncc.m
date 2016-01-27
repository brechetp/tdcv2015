function [ out ] = ncc( I, T, x, y , c)

    [X, Y, Z] = size(I);
    [XT, YT, ZT] = size(T);
    TOrig = T;
    
    out = 0;
    for z = 1:Z
        IPart = I(x:x+XT-1, y:y+YT-1, z);
        T = TOrig(:,:,z);

        nom = sum(sum(T .* IPart));

        divider = sqrt(sum(sum(T .* T))) * sqrt(sum(sum(IPart .* IPart)));

        out = out + nom / divider;
    end
    
    out = out / 3;

end

