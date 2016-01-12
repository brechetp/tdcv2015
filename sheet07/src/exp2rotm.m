function mat = exp2rotm(w)
theta = norm(w);
x = w(1);
y = w(2);
z = w(3);
Omega = [[0, -z, y]; [z, 0, -x]; [-y, x, 0]];
mat = expm(Omega);
end
