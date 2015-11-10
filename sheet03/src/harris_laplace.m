function corners = harris_laplace(I, k, s_0, n)
sigmas = s_0* k .^(0:n);
for s = sigmas

