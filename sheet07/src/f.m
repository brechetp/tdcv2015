function [ out ] = f( R, T, A, M, m, type )

[X, Y] = size(M);

switch type
case 'euler'
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
  case 'quaternion'
    q = R(1:4);
    k = R(5);
    Rot = quat2rotm(q);
    for i = 1:X
      MM = M(i,:)';
      MTrans = A * (Rot * MM + T');
      MTrans = MTrans ./ MTrans(3);
      mtrans = m(i,:)' ./ m(i,3);
      diff = MTrans - mtrans;
      summer(i) = norm(diff);
    end
    out = sum(summer) + k*(1 - norm(R));
  case 'exp'
    if (norm(R) > pi)
      R = (1 - (2*pi)/(norm(R))) .* R
    Rot = exp2rotm(R)
    for i = 1:X
      MM = M(i,:)';
      MTrans = A * (Rot * MM + T');
      MTrans = MTrans ./ MTrans(3);
      mtrans = m(i,:)' ./ m(i,3);
      diff = MTrans - mtrans;
      summer(i) = norm(diff);
    end
    out = sum(summer);
else if



end

