
numImages = 201;

%start = [246, 295];
%ending = [646, 759];

for i = 1:numImages;
    num = i-1;
    
    filename = sprintf('../../ex09/seq/im%03d.pgm', num );
    imgs{i} = im2double(imread(filename));
end
Np = 1000;
%Np = 100;
%coords=[[230, 260];[330, 360]];

%img = im2double(imread(

img = imgs{1};

%imStacked = img(:);

R = [1, 4, 6, 7];

xMin = 300;

xMax = 400;
yMin = 300;
yMax = 400;

coords = [xMin, yMin; xMax, yMax];

%imshow(img(xMin:xMax, yMin:yMax));

if 1
    valueRef = computeRectangleValue(img, coords, zeros(1, 8));
    A = cell(1);
    for j = 1:10
        H = zeros(441, Np);
        Y = zeros(8, Np);
        range = j * 3;
        for i = 1:Np
            [warped, shift] = random_warp(img, coords, range);


            deltaI = valueRef - warped';

            H(:,i) = deltaI';

            Y(:,i) = shift(:);

        end
        A{j} = Y * H' * inv(H * H');
    end
end
P = zeros(8, numImages);

42
p = zeros(8, 1)
%for numImg = 2:numImages
for numImg = 1:numImages
   img = imgs{numImg};
   for numA = 10:-1:1
       numA;
      for iter = 1:5

          val = computeRectangleValue(img, coords, p);
          diff = val - valueRef;
          
          size(diff);
          size(A{numA});
          
          val;
          numImg;
          numA;
          diff;
          deltaP = A{numA} * diff';
          
          p = p + deltaP;
          
      end
   end
   p
   %figure;
   %imshow(img);
   
   %hold on;
   %pReal = reshape(p, [4,2]);
   
   
end
