
numImages = 201;

start = [246, 295];
ending = [646, 759];

for i = 1:numImages;
    num = i-1;
    
    filename = sprintf('seq/im%03d.pgm', num );
    imgs{i} = im2double(imread(filename));
end


Np = 100;
coords=[[230, 260];[330, 360]];

%img = im2double(imread(

img = imgs{1};
% reshape and normalize the image
norm_i = img(coords(1,1):5:coords(2,1), coords(1,2):5:coords(2,2));
norm_i = norm_i(:);
norm_i = (norm_i - mean(norm_i)) / std(norm_i);

imStacked = img(:);

R = [1, 4, 6, 7];

for j = 1:10
    
    H = zeros(size(norm_i, 1), Np);
    Y = zeros(8, Np);
    range = j * 3;
    for i = 1:Np
        [warped, shift] = random_warp(img, coords, range);
        deltaI = norm_i - warped;
        H(:,i) = deltaI;
        Y(:,i) = shift(:);
    end
    A{j} = Y * H' * inv(H * H');
end
P = zeros(8, numImages);

for numImg = 1:numImages
   img = imgs{numImg};
   
   for numA = 1:10
      for iter = 1:5

          
      end
   end
   
end
