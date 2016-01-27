image_file = '../data/clutter.jpg';
image = im2double(imread(image_file));
new = 0;
if new || ~exist('xt')
[xt, yt] = getrect2(image); % odd width and height
end
template = image(xt, yt, :); % select the template in the image
threshold = 0.02; % discards ~ 5% of the grads

[GradI, OriI] = compute_gradient(image);
[GradT, OriT] = compute_gradient(template);
[Ni, Mi] = size(GradI);
[Nt, Mt] = size(GradT); % it should be odd thanks to getrect2
match = zeros(Ni, Mi);
[cols, rows] = meshgrid(ceil(Mt/2):(Mi-ceil(Mt/2)), ceil(Nt/2) : (Ni - ceil(Nt/2)));
EM_fun = @(i,j) EM(i, j, OriI, OriT, GradI, GradT, threshold);
match = arrayfun(EM_fun, rows, cols, 'UniformOutput', 0);



