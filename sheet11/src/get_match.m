function match = get_match(image, template, mask)

threshold = 0.02; % discards ~ 5% of the grads

[GradI, OriI] = compute_gradient(image);
[GradT, OriT] = compute_gradient(template);
[Ni, Mi] = size(GradI);
[Nt, Mt] = size(GradT); % it should be odd thanks to getrect2
[cols, rows] = meshgrid(1:Mi, 1:Ni);
cols = cols .* mask; % from previous scale levels
rows = rows .* mask;
EM_fun = @(i,j) EM(i, j, OriI, OriT, GradI, GradT, threshold);
match = arrayfun(EM_fun, rows, cols, 'UniformOutput', 0);
match = cell2mat(match);
return
