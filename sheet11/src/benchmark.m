function [] = benchmark(image, template, color, n_level)

fprintf('Version color: %d, pyramid level: %d', color, n_level);
tic
possible = 1;
figure
if ~color
  image = rgb2gray(image);
  template = rgb2gray(template);
end
for level=(n_level-1):-1:0
  scale = 2^(-level);
  level_image = imresize(image,scale);
  level_template = imresize(template, scale);
  [Nt, Mt] = size(level_template(:, :, 1));
  [Ni, Mi] = size(level_image(:, :, 1));
  level_possible = imresize(possible, 2, 'nearest');
  [Nm, Mm] = size(level_possible);
  mask = padarray(level_possible, [Ni-Nm, Mi-Mm], 1, 'pre');
  subplot(2, 2, 2)
  imshow(level_template)
  title(['subsampled template at scale ', num2str(scale)]);
  tmplt = padarray(level_template, [(mod(Nt, 2) == 0)*1, (mod(Mt, 2) == 0)*1], 'replicate', 'pre');
  %sigma = 2^((step+level*s)/(s-1)) * sigma0;
  %img = imgaussfilt(level_image, sigma);
  img = level_image;
  subplot(2, 2, 1);
  imshow(img);
  title([ 'subsampled image at scale ', num2str(scale) ]);
  match = get_match(img, tmplt, mask);
  norm_match = (match - mean(match(:))) / std(match(:));
  possible = zeros(Ni, Mi);
  good_match = 4;
  while sum(possible(:)) < Ni*Mi / 16
    possible = norm_match > good_match;
    good_match = good_match / 1.2;
  end
  subplot(2, 2, 3);
  imshow(mat2gray(match))
  title('Possible maxima location')
  [m, idx] = max(match(:));
  [x0, y0] = ind2sub(size(match), idx);
  subplot(2, 2, 1);
  R = rectangle('Position', [y0-floor(Mt/2), x0 - floor(Nt/2), Mt, Nt]) ;
  R.LineWidth = 1;
  R.EdgeColor = [0, 0, 1]; % blue
  found = img(max(1, x0-floor(Nt/2)): min(Ni,  x0+ floor(Nt/2)), max(1, y0-floor(Mt/2)):min(Mi, y0+floor(Mt/2)), :);
  subplot(2, 2, 4);
  imshow(found)
  title([ 'best match at scale ', num2str(scale) ]);
  %differ = sum(tmplt(:) - found(:)) / sum(tmplt(:))
  drawnow;
end
found = padarray(found, size(tmplt) - size(found), 'pre');
score = 100 * sum(tmplt(:) - found(:)) / sum(tmplt(:));
fprintf(', diff: %d %%\n', score);
toc


