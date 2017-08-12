a=zeros(500,500);
a(251:500,:)=255;
I=mat2gray(a);
%figure;
imshow(I);
sol=[0, 0, 0; 0, 1, 0; 0, -1, 0];
result = conv2 (I,sol);
%figure;
imshow(result);


camera_image=imread('cameraman.tif');
figure;
imshow(uint8(camera_image));
camera_result1=conv2(camera_image,sol);
figure;
imshow(uint8(camera_result1));
sol_transpose=transpose(sol);
camera_result2=conv2(camera_image,sol_transpose);
figure;
imshow(uint8(camera_result2));