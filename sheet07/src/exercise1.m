close all;
run('/usr/local/src/vlfeat-0.9.20/toolbox/vl_setup.m');
rthreshold = 5; % threshold for RANSAC
A = [[472.3, 0.64, 329.0]; [0, 471.0, 268.3]; [0, 0, 1]];
T = 45;
img0 = imread('../data/0000.png');
[height, width, color] = size(img0); 
imgs = cell(T, 1);
for t =2:T
  number = [repmat('0', [1, 3-floor(log10(t-1))]), num2str(t-1)];
  imgs{t} = imread(['../data/', number, '.png']);
end
[f0, d0] = vl_sift(single(rgb2gray(img0)));
x = f0(1, :);
y = f0(2, :);
idx = [];
for i=1:size(f0, 2)
  if (x(i) > 103) && (x(i) < 552) && (y(i) > 74) && (y(i) < 389)
    idx = [idx,i]; % list of indices we keep
  end
end
f0 = f0(:, idx);
d0 = d0(:, idx);
m_tilde = cell(T, 1); % we store all T Nt*2 pair correspondence points
M = cell(T, 1); % all points from the original image projeted in 3D
m0 = [f0(1, :); f0(2, :)]';
n = size(m0, 1);
m_tilde{1} = [m0, ones(n, 1)];
M{1} = (inv(A) * m_tilde{1}')';


for t = 2:T
  [f, d] = vl_sift(single(rgb2gray(imgs{t})));
  [matches, scores] = vl_ubcmatch(d0, d);
  P1 = f0(1:2, matches(1, :))';
  P2 = f(1:2, matches(2,:))';
  P1 = [P1, repmat(1, [size(P1, 1), 1])]; % homogenous coordinates
  P2 = [P2, repmat(1, [size(P1, 1), 1])];
  [H inliers_indices] = ransac_adapt(P1, P2, rthreshold, 0.99); % threshold 2


  %stacked = zeros(height, 2*width, 3);
  %stacked = cast(stacked, class(img0));
  %stacked(1:height, 1:width, :) = img0;
  %stacked(1:height, width+1:width+width, :) = imgs{t};

  %f_stacked = [f(1, :) + width; f(2, :); f(3, :); f(4, :)];
  %fig = figure;
  %imshow(stacked);
  %hold on;
  %h3 = vl_plotframe(f_stacked(:, matches(2, :)));
  %h4 = vl_plotframe(f0(:, matches(1, :)));

  M{t} = (inv(A) * P1(inliers_indices, :)')';
  m_tilde{t} = P2(inliers_indices, :); % the filtered correspondant points
  

  %object_points = normalcoords(P1(inliers_indices, :));
  %scene_points = normalcoords(P2(inliers_indices, :));
  %for j = 1:size(object_points, 1)
   % plot([object_points(j, 1), scene_points(j, 1) + width], [object_points(j, 2), scene_points(j, 2)], 'b');
  %end
  %title([num2str(size(inliers_indices, 1)) ' inliers (' num2str(size(inliers_indices, 1) / size(matches, 2)) '%)'])
  %number = [repmat('0', [1, 3-floor(log10(t-1))]), num2str(t-1)]
  %saveas(fig, ['../res/', number, '.png']);
end




