%the advantage of Y Cb Cr is that any noise in Cb Cr is very minimally noticed when converted back to RGB

%Experimentally proving perceptual redundancy
fruits = '7.jpg';
image_data = imread ( '7.jpg' );
image_size = size ( image_data );
%image still in uint8 form
% image has three channels - R, G, B

YCbCr_image_data = rgb2ycbcr( image_data );
%image now has three channels - Y, Cb, Cr 

for row_index = 1 : 256
	for column_index = 1 : 256
		YCbCr_image_data ( row_index*2 - 1, column_index*2, 1 ) = YCbCr_image_data ( row_index*2 - 1, column_index*2 - 1, 1 );
		%YCbCr_image_data ( row_index*2 - 1, column_index*2, 3 ) = YCbCr_image_data ( row_index*2 - 1, column_index*2 - 1, 3 );
	end
	
	YCbCr_image_data ( row_index*2, :, 1 ) = YCbCr_image_data ( row_index*2 - 1, :, 1 );
	%YCbCr_image_data ( row_index*2, :, 3 ) = YCbCr_image_data ( row_index*2 - 1, :, 3 );

end

RGB_result = ycbcr2rgb(YCbCr_image_data) ;

error1 = RMSE ( uint8 (image_data), uint8 (RGB_result) );

%Explanation
%Upon removing 75% data from both Cb and Cr channels and thus compressing the entire image by a factor of 2, the RMSE error is negligible
%The two images seem to be similar when percieved by the human visual system
%Thus there is high amount of perceptual redundancy which can be eliminated by using Y, Cb, Cr channels

figure,
imshow ( image_data );
imshow ( RGB_result );
