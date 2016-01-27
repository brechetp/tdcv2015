
numImages = 201;

%start = [246, 295];
%ending = [646, 759];

for i = 1:numImages;
    num = i-1;
    
    filename = sprintf('seq/im%03d.pgm', num );
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
    valueRef = warp(img, coords, zeros(4, 2));
    A = cell(1);
    for j = 1:10
        H = zeros(441, Np);
        Y = zeros(8, Np);
        range = j * 3;
        for i = 1:Np
            [warped, shift] = random_warp(img, coords, range);


            deltaI = valueRef - warped;

            H(:,i) = deltaI';

            Y(:,i) = shift(:);

        end
        A{j} = Y * H' * inv(H * H');
    end
end
p = zeros(4, 2);
%for numImg = 2:numImages
for numImg = 1:numImages
   img = imgs{numImg};
   for numA = 10:-1:1
      for iter = 1:5

          val = warp(img, coords, p);
          diff = val - valueRef;
          
          deltaP = reshape(A{numA} * diff, [4, 2]);
          %Hc = dlt([P{1}, ones(4, 1)], [p, ones(4, 1)]);
          %Hu = dlt([p, ones(4, 1)], [p + delta_p, ones(4, 1)]);
          %Hn = Hc * Hu;
          


          p = p + deltaP;
          
      end
   end
   display_p(img, coords, p)
   %figure;
   %imshow(img);
   
   %hold on;
   %pReal = reshape(p, [4,2]);
   
   
end
