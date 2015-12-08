function [ Full ] = normalizeImg(P)

    P;
    xShift = mean(P(:, 1));
    yShift = mean(P(:, 2));
    
    shift = [1, 0, -xShift; 0, 1, -yShift; 0, 0, 1];
    P2 = (shift * P')';
    
    norm = sqrt(sum(P2.^2, 2));
    P2Sec = P2(:, 1:2);
    norm2 = sqrt(sum(P2Sec.^2, 2));
    normalizer = sqrt(2) / mean(norm2);
    
    Normalize = [normalizer, 0, 0; 0, normalizer, 0; 0, 0, 1];
    
    P3 = (Normalize * P2')';
    
    Full = (Normalize * shift);
    
    P3Sec = (Full * P')';
    
end

