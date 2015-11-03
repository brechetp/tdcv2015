function out = myMedian( A )

[S, Y] = size(A);

T = sort(A);
ind = uint8(S/2);
out = T(ind);

end

