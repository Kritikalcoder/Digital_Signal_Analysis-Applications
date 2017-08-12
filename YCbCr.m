function [ output ] = YCbCr ( image_data, luminance_factor, chrominance_factor )
% 3 channel jpeg compression without removal of perceptual redundancy

%image_data = imread ( input_image );
image_size = size ( image_data );
%image still in uint8 form
% image has three channels - R, G, B

YCbCr_image_data = rgb2ycbcr( image_data );
%image now has three channels - Y, Cb, Cr 

transform = create_mat_dct;
luminance_matrix = [ 16, 11, 10, 16, 24, 40, 51, 61;
             		12, 12, 14, 19, 26, 58, 60, 55;
             		14, 13, 16, 24, 40, 57, 69, 65;
             		14, 17, 22, 29, 51, 87, 80, 62;
             		18, 22, 37, 56, 68, 109, 103, 77;
             		24, 35, 55, 64, 81, 104, 113, 92;
             		49, 64, 78, 87, 103, 121, 120, 101;
             		72, 92, 95, 98, 112, 100, 103, 99 ];

chrominance_matrix = [ 17, 18, 24, 47, 99, 99, 99, 99;
					   18, 21, 26, 66, 99, 99, 99, 99;
					   24, 26, 56, 99, 99, 99, 99, 99;
					   47, 66, 99, 99, 99, 99, 99, 99;
					   99, 99, 99, 99, 99, 99, 99, 99;
					   99, 99, 99, 99, 99, 99, 99, 99;
					   99, 99, 99, 99, 99, 99, 99, 99;
					   99, 99, 99, 99, 99, 99, 99, 99 ];

%luminance_factor = 1;
%chrominance_factor = 2;

result = zeros ( image_size ( 1 ) / 2, image_size ( 2 ) / 2, 3 );

channel_data = YCbCr_image_data ( :, :, 1 );
q_matrix = luminance_matrix;
comp_factor = luminance_factor;
%Luminance

row = 1;
column  = 1;
counter_row = image_size ( 1 ) / 8;
counter_column = image_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  double ( channel_data ( row : row + 7, column : column + 7 ) );
		%subwindow = imshow ( subwindow );
		dct_image = myDCT ( subwindow, transform );
		quant_image = myDCT_quantization ( dct_image, q_matrix, comp_factor );
		dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		idct_image = myIDCT ( dequant_image, transform );
		result ( row : row + 7 , column : column + 7, 1 ) = idct_image;
	
	end
end

channel_data = YCbCr_image_data ( :, :, 2 );
q_matrix = chrominance_matrix;
comp_factor = chrominance_factor;
%chrominance Cb

row = 1;
column  = 1;
counter_row = image_size ( 1 ) / 8;
counter_column = image_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  double ( channel_data ( row : row + 7, column : column + 7 ) );
		%subwindow = imshow ( subwindow );
		dct_image = myDCT ( subwindow, transform );
		quant_image = myDCT_quantization ( dct_image, q_matrix, comp_factor );
		dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		idct_image = myIDCT ( dequant_image, transform );
		result ( row : row + 7 , column : column + 7, 2 ) = idct_image;
	
	end
end


channel_data = YCbCr_image_data ( :, :, 3 );
q_matrix = chrominance_matrix;
comp_factor = chrominance_factor;
%chrominance Cr

row = 1;
column  = 1;
counter_row = image_size ( 1 ) / 8;
counter_column = image_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  double ( channel_data ( row : row + 7, column : column + 7 ) );
		%subwindow = imshow ( subwindow );
		dct_image = myDCT ( subwindow, transform );
		quant_image = myDCT_quantization ( dct_image, q_matrix, comp_factor );
		dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		idct_image = myIDCT ( dequant_image, transform );
		result ( row : row + 7 , column : column + 7, 3 ) = idct_image;
	
	end
end

result = uint8 ( result );
RGB_result = ycbcr2rgb( result );

error = RMSE ( image_data, RGB_result );
output = RGB_result;

end