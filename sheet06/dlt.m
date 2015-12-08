function [ H ] = dlt(P1, P2 )

    P1;
    P2;
    U = normalizeImg(P1); % Original Image
    T = normalizeImg(P2); % Warped Image.

    P1W = (U * P1')';
    P2W = (T * P2')';
    [X, Y] = size(P1);
    
    A = [];
    for i= 1:X
       p1 = P1W(i,:);
       p2 = P2W(i,:);
       Ai = [0, 0, 0, -p2(3) * p1, p2(2) * p1; p2(3) * p1, 0, 0, 0, -p2(1) * p1];
       A = [A; Ai];
       %Ai = [0, -p2(3) * ]
    end
    
    A;
    [UU, S, V] = svd(A);
    
    %V = VTransp'
    [SX, SY] = size(V);
    h = V(:, SY);
    
    HW = reshape(h, [3, 3])';
    
    inv(T);
    U;
    H = inv(T) * HW * U;
    
    P2;
    Res = (H * P1')';
    normalcoords(Res);
    
%     for i=1:4
%         Res(i,1) / Res(i,3)
%         Res(i,2) / Res(i,3)
%     end
end

