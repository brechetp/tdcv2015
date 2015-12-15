function [ out ] = fun( R, T, A, M, m, type )

[X, Y] = size(M);

switch type
  case 'euler'
    Rot = eul2rotm(R);
  case 'exp'
    if (norm(R) > pi)
      R = (1 - (2*pi)/(norm(R))) .* R;
    end
    Rot = exp2rotm(R);
  otherwise
    error('Incorrect type')
end

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

