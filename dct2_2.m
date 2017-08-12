I = imread ('LAKE.TIF');
%I = rgb2gray(I);
I = im2double(I);
J = dct2(I);

figure
imshow(log(abs(J)),[])
colormap(gca,jet(64))
colorbar

%J(abs(J) < 10) = 0;
K = idct2(J);

figure
imshowpair(I,K,'montage')
title('Original Grayscale Image (Left) and Processed Image (Right)');

D = dctmtx(8);


I = imread ('LAKE.TIF');
%I = rgb2gray(I);
I = im2double(I);
J = dct2(I);

figure
imshow(log(abs(J)),[])
colormap(gca,jet(64))
colorbar

%J(abs(J) < 10) = 0;
K = idct2(J);

figure
imshowpair(I,K,'montage')
title('Original Grayscale Image (Left) and Processed Image (Right)');