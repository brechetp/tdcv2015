
numImages = 201;

start = [246, 295];
ending = [646, 759];

for i = 1:numImages;
    num = i-1;
    
    filename = sprintf('../../ex09/seq/im%03d.pgm', num );
    imgs{i} = im2double(imread(filename));
end


Np = 100;

%img = im2double(imread(

img = imgs{1};

imStacked = img(:);

R = [1, 4, 6, 7];

for j = 1:10
    
    H = zeros(size(R,2), Np);
    Y = zeros(8, Np);
    range = j * 3;
    for i = 1:Np
        [warped, shift] = random_warp(img, coords, range);

        warpedStacked = warped(:);

        deltaI = imgStacked(R) - warpedStacked(R);

        H(:,i) = deltaI;

        Y(:,i) = shift;

    end
    A{j} = Y * H' * inv(H * H');
end

for numImg = 1:numImages
   img = imgs{numImg};
   
   for numA = 1:10
      for iter = 1:5
          
      end
   end
   
end
