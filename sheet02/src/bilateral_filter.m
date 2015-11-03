function filtered_image = bilateral_filter(I, sigma_r, sigma_d)
M = 2 * floor(3 * sigma_d / 2) + 1; % M is odd
m = floor(M/2);
[P, Q, R] = size(I);
I_copy = padarray(I, m, m, 'replicate');
size(I_copy)
for k=1:R
  for i=1:P
    for j=1:Q
      s_res = 0;
      w = 0;
      for a=-m:m
        for b=-m:m
          s_res = s_res + I_copy(m+i+a, m+j+b, k) * c([m+i+a, m+j+b], [m+i+1, m+j+1], sigma_r) * s(I_copy, [m+i+a, m+j+b, k], [m+1+i, m+1+j, k], sigma_d);
          w = w + c([m+i+a, m+j+b], [m+i+1, m+j+1], sigma_r) * s(I_copy, [m+i+a, m+j+b, k], [m+1+i, m+1+j, k], sigma_d);
        end
      end
      s_res = s_res /  w;
      filtered(i+m+1, j+m+1, k) = s_res;
    end
  end
end

