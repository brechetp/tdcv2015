
img = imread('files/2007_000032.jpg');

I = integralImages(img);

numT = 10;
for i = 1:numT
   [Tree, Leaf] = readTree(i-1);
   Tr{i} = Tree;
   Le{i} = Leaf;
end

[X,Y, Z] = size(img)
%X = 1000
%Y = 1000
num = zeros(X,Y);
for x = 1:X
    x
   for y = 1:Y
      votes = zeros(numT, 2);
      for t = 1:numT
         votes(t, :) = getVote(I, Tr{t}, Le{t}, x, y);
      end
      realVote = round(mean(votes));
      
      ix = min(max(realVote(1)+x, 1), X);
      iy = min(max(realVote(2)+y, 1), Y);
      num(ix, iy) = num(ix, iy)+1;
   end
end

