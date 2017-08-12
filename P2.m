a=zeros(500,500);
a(251:500,:)=255;
I=mat2gray(a);
imshow(I);
sol=[0, 0, 0; 1/3, 1/3, 1/3; -1/3, -1/3, -1/3];
result = conv2 (I,sol);
imshow(result);


camera_image=imread('cameraman.tif');
imshow(camera_image);
camera_result1=conv2(camera_image,sol);
imshow(camera_result1);
sol_transpose=transpose(sol);
camera_result2=conv2(camera_image,sol_transpose);
imshow(camera_result2);
