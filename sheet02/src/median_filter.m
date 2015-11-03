function filtered = median_filter(I, D)
D= 2* (floor(D/2)) + 1 ;%D(1), D(2) are the odd dimensions of the area
I_mirror = padarray(I, [floor(D(1)/2), floor(D(2)/2)], 'replicate') ; % mirror padding
[m, n, Z] = size(I); % original size
for i=1:m
  for j=1:n
    for z=1:Z
      filtered(i, j, z) = median(I_mirror((i):(i+D(1)-1), (j):(j+D(2)-1), z));
    end
  end
end


