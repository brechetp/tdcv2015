close all;
pot_rgb = imread('../imgs/pot.jpg');
pot = single(rgb2gray(pot_rgb));
pot_test_1_rgb = imread('../imgs/test_pot2.jpg');
pot_test_1 = single(rgb2gray(pot_test_1_rgb));

[fp, dp] = vl_sift(pot);
[fpt1, dpt1] = vl_sift(pot_test_1);

[matches, scores] = vl_ubcmatch(dp, dpt1);

[n_pot, m_pot] = size(pot);
[n_pt1, m_pt1] = size(pot_test_1);
stacked_pot_1 = zeros(max(n_pot, n_pt1), m_pot + m_pt1, 3);
stacked_pot_1 = cast(stacked_pot_1, class(pot_rgb));
stacked_pot_1(1:n_pot, 1:m_pot, :) = pot_rgb;
stacked_pot_1(1:n_pt1, m_pot+1:m_pot+m_pt1, :) = pot_test_1_rgb;

fpt1_stacked = [fpt1(1, :) + m_pot; fpt1(2, :); fpt1(3, :); fpt1(4, :)];
figure;
imshow(pot_rgb);

h1 = vl_plotframe(fp) ;
h2 = vl_plotframe(fp) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;
figure;
imshow(stacked_pot_1);
hold on;
h3 = vl_plotframe(fpt1_stacked(:, matches(2, :)));
h4 = vl_plotframe(fp(:, matches(1, :)));
for i = 1:size(matches, 2)
  plot([fp(1, matches(1, i)), fpt1(1, matches(2, i)) + m_pot], [fp(2, matches(1, i)), fpt1(2, matches(2, i))], 'b');
end

figure;
showMatchedFeatures(pot, pot_test_1, fp(1:2, matches(1, :))', fpt1(1:2, matches(2, :))'); 

figure;
[tform,inlierPtsDistorted,inlierPtsOriginal] = estimateGeometricTransform(cornerPoints(fpt1(1:2, matches(2, :))'),cornerPoints(fp(1:2, matches(1, :))'),'affine');
pot_points = inlierPtsOriginal.Location;
pot_test_1_points = inlierPtsDistorted.Location;
imshow(stacked_pot_1);
hold on;
for i = 1:size(pot_points, 1)
  plot([pot_points(i, 1), pot_test_1_points(i, 1) + m_pot], [pot_points(i, 2), pot_test_1_points(i, 2)], 'b');
end

x_min = min(pot_test_1_points(:, 1)) + m_pot;
y_min = min(pot_test_1_points(:, 2));
x_max = max(pot_test_1_points(:, 1)) + m_pot;
y_max = max(pot_test_1_points(:, 2));

B = vl_plotbox([x_min; y_min; x_max; y_max]);
set (B, 'color', 'green', 'linewidth', 4);
