function [ bestIn, HRes ] = ransac( P1, P2, s, t, T, N)
    
    [Size, Bla] = size(P1);
    
    bestIn = [];

    for i = 1:N
       Perm = randperm(Size, 4);
       first = P1(Perm, :);
       second = P2(Perm, :);
       
       H = dlt(first, second);
       
       P1Transformed = normalcoords((H * P1')');
       P2Normal = normalcoords(P2);
      
       dist = sqrt(sum((P1Transformed - P2Normal).^2,2));
       inlier = find(dist < t);
       out = inlier;
       num = size(inlier,1);
       if num > size(bestIn);
           bestIn = inlier;
       end
       
       if num > T
           break
       end
       %min(dist)
       %break;
    end
    size(bestIn);
    HRes = dlt(P1(bestIn, :), P2(bestIn, :))

    HRes = HRes / HRes(3,3);
    %HRes(3,1) = 0
    %HRes(3,2) = 0
    
    P1Transformed = normalcoords((HRes * P1')');
    P2Normal = normalcoords(P2);

    dist = sqrt(sum((P1Transformed - P2Normal).^2,2));
    inlier = find(dist < t)
    size(inlier)
    
end

