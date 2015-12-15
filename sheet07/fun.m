function [ out ] = fun( R, T, A, M, m )

[X, Y] = size(M);

Rot = eul2rotm(R);

for i = 1:X
   MM = M(i,:)';
   MTrans = A * (Rot * MM + T');
   MTrans = MTrans ./ MTrans(3);
   mtrans = m(i,:)' ./ m(i,3);
   diff = MTrans - mtrans;
   summer(i) = norm(diff);
end

out = sum(summer);

end

