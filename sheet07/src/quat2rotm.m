function mat = quat2rotm(q)
n = norm(q);
if (n == 0)
  error('q is 0');
end
q = q ./ (norm(q));
r = q(1);
i = q(2);
j = q(3);
k = q(4);
m11 = 1 - 2*(j^2) - 2*(k^2);
m12 = 2*(i*j - k*r);
m13 = 2*(i*k + j*r);
m21 = 2*(i*j + k*r);
m22 = 1 - 2*(i^2) - 2*(k^2);
m23 = 2*(j*k - i*r);
m31 = 2*(i*k-j*r);
m32 = 2*(j*k + i*r);
m33 = 1 - 2*(i^2) - 2*(j^2);
mat = [[m11, m12, m13]; [m21, m22, m23]; [m31, m32, m33]]';
end
