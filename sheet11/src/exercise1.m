close all;

img = im2double(imread('img.jpg'));
%img = im2double(rgb2gray(imread('img.jpg')));

%img = imresize(img, 0.5);


img = imresize(img, 0.25);

imshow(img);

what = 0;

rect = getrect;

part = img(rect(2):rect(2)+rect(4), rect(1):rect(1)+rect(3),:);

figure;
imshow(part);


%img = imresize(img, 0.5);

figure;
imshow(img);


[X, Y, Z] = size(img)
[XT, YT, ZT] = size(part);

if or(what == 0, what == 1)
    tic
    resp = zeros(X-XT, Y-YT);
    for x = 1:X-XT 
        x;
        for y = 1:Y-YT
            %r = ssd(img, part, x, y, 1);
            %g = ssd(img, part, x, y, 2);
            %b = ssd(img, part, x, y, 3);
            resp(x,y) = ssd(img, part, x, y, 1);
        end
    end

    figure;
    imshow(mat2gray(resp));
    [M,I] = min(resp(:));
    [bx, by] = ind2sub(size(resp), I);
    figure;
    imshow(img);
    hold on;
    scatter(by, bx);
    rectangle('Position', [by, bx, YT, XT]);
    fid = getFidelity(resp, 0)
    toc
end

if or(what == 2, what == 0)

    tic
    orig = img;
    partOrig = part;


    lastResp = zeros(X / 4, Y / 4);
    thresh = 10;
    inf = 10000000;
    for s = 4:-1:0
       img = imresize(orig, 1/ (2^s)); 
       part = imresize(partOrig, 1/(2^s));
       [X, Y, Z] = size(img);
       [XT, YT, ZT] = size(part);
       resp = zeros(X-XT, Y-YT) + inf;
       for x = 1:X-XT-1
           for y = 1:Y-YT-1
               if lastResp(uint8(x/2), uint8(y/2)) <  thresh*1.1;
                   resp(x,y) = ssd(img, part, x, y, 1);
               end
           end
       end


       [B, I] = sort(resp(:));
       resp;
       A = size(resp(:), 1);
       thresh = B(uint8(A / 2));

       figure;
       respIm = resp;
       respIm(respIm == inf) = -1;
       maxim = max(max(respIm)) + 2;
       respIm(respIm < 0) = maxim;
       imshow(mat2gray(respIm));
       lastResp = resp;
       
        [M,I] = min(resp(:));
        [bx, by] = ind2sub(size(resp), I);
        figure;
        imshow(img);
        hold on;
        scatter(by, bx);
        rectangle('Position', [by, bx, YT, XT]);

    end

    [M,I] = min(resp(:));
    [bx, by] = ind2sub(size(resp), I);
    figure(42);
    imshow(img);
    figure(42);
    hold on;
    scatter(by, bx);
    rectangle('Position', [by, bx, YT, XT]);
    fid = getFidelity(resp, 0)
    toc
end


%----------------------------------------------


if or(what == 0, what == 3)
    tic
    resp = zeros(X-XT, Y-YT);
    for x = 1:X-XT 
        x;
        for y = 1:Y-YT
            %r = ssd(img, part, x, y, 1);
            %g = ssd(img, part, x, y, 2);
            %b = ssd(img, part, x, y, 3);
            resp(x,y) = ncc(img, part, x, y, 1);
        end
    end

    figure;
    imshow(mat2gray(resp));
    [M,I] = max(resp(:));
    [bx, by] = ind2sub(size(resp), I);
    figure;
    imshow(img);
    hold on;
    scatter(by, bx);
    rectangle('Position', [by, bx, YT, XT]);
    fid = getFidelity(resp, 1)
    toc
end

if or(what == 4, what == 0)

    tic
    orig = img;
    partOrig = part;


    lastResp = ones(X / 4, Y / 4);
    thresh = 0;
    inf = 10000;
    for s = 4:-1:0
       img = imresize(orig, 1/ (2^s)); 
       part = imresize(partOrig, 1/(2^s));
       [X, Y, Z] = size(img);
       [XT, YT, ZT] = size(part);
       resp = -ones(X-XT, Y-YT);
       for x = 1:X-XT-1
           for y = 1:Y-YT-1
               if lastResp(uint8(x/2), uint8(y/2)) >=  thresh;
                   resp(x,y) = ncc(img, part, x, y, 1);
               end
           end
       end


       [B, I] = sort(resp(:), 'descend');
       resp;
       A = size(resp(:), 1);
       thresh = B(uint8(A / 2));

       figure;
       respIm = resp;
       respIm(respIm < 0) = inf;
       minim = min(min(respIm));
       respIm(respIm == inf) = minim;
       imshow(mat2gray(respIm));
       lastResp = resp;
       
        [M,I] = max(resp(:));
        [bx, by] = ind2sub(size(resp), I);
        figure;
        imshow(img);
        hold on;
        scatter(by, bx);
        rectangle('Position', [by, bx, YT, XT]);

    end

    [M,I] = max(resp(:));
    [bx, by] = ind2sub(size(resp), I);
    figure(42);
    imshow(img);
    figure(42);
    hold on;
    scatter(by, bx);
    rectangle('Position', [by, bx, YT, XT]);
    fid = getFidelity(resp, 1)
    toc
end
