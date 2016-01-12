function [ out ] = fun_quat( qT, A, M, m )

[X, Y] = size(M);
q = qT(1:4);
T = qT(5:7);
Rot = quat2rotm(q);
for i = 1:X
  MM = M(i,:);
  MTrans = A * (Rot * MM' + T');
  MTrans = MTrans ./ MTrans(3);
  mtrans = m(i,:)' ./ m(i,3);
  diff = MTrans - mtrans;
  summer(i) = norm(diff);
end
out = sum(summer);
end

