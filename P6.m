A = rgb2gray(imread('kumbhmela.jpg'));
B = rgb2gray(imread('shyam.jpg'));
C = normxcorr2 ( B , A );
figure, surf(C), shading flat
[xpeak, ypeak] = find(C==max(C(:)));
size(B)
size(A)
A = imread('kumbhmela.jpg');
imshow(A(xpeak-40:xpeak,ypeak-40:ypeak,:));