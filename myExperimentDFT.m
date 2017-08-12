function [ output ] = myExperimentDFT ( image_data, comp_factor )

image_size = size ( image_data );
 
transform = create_mat_dct;

YCbCr_input = image_data ;
result = YCbCr_input;
q_matrix = [ 16, 11, 10, 16, 24, 40, 51, 61;
             12, 12, 14, 19, 26, 58, 60, 55;
             14, 13, 16, 24, 40, 57, 69, 65;
             14, 17, 22, 29, 51, 87, 80, 62;
             18, 22, 37, 56, 68, 109, 103, 77;
             24, 35, 55, 64, 81, 104, 113, 92;
             49, 64, 78, 87, 103, 121, 120, 101;
             72, 92, 95, 98, 112, 100, 103, 99 ];
%comp_factor = 2;


row = 1;
column  = 1;
counter_row = image_size ( 1 ) / 8;
counter_column = image_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  YCbCr_input ( row : row + 7, column : column + 7 );

		dct_image = myDCT ( subwindow, transform );
		quant_image = myDCT_quantization ( dct_image, q_matrix, comp_factor );
		quant_image (:, 5:8 ) = 0;
		quant_image (:, 5:8 ) = 0;
		dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		idct_image = myIDCT ( dequant_image, transform );
		
		result_DCT ( row : row + 7, column : column + 7 ) = idct_image;
	end
end

row = 1;
column  = 1;
counter_row = image_size ( 1 ) / 8;
counter_column = image_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  YCbCr_input ( row : row + 7, column : column + 7 );

		fftmag = abs(fft2( subwindow ));
		fftangle = angle(fft2( subwindow ));

		quant_image = myDCT_quantization ( fftmag, q_matrix, comp_factor );
		quant_image (:, 5:8 ) = 0;
		quant_image (:, 5:8 ) = 0;
		dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		
		FreqDomain = ( dequant_image ).* exp ( i * ( fftangle ) );
		result ( row : row + 7, column : column + 7 ) = real ( ifft2 ( FreqDomain ));
	
	end
end

DFT_result = uint8 ( result );
DCT_result = uint8 ( result_DCT );

error1 = RMSE ( image_data , DCT_result );
error2 = RMSE ( image_data , DFT_result ); 

output = [ error1, error2 ] ;

% DFT performs better than DCT with the same quantization matrix.
% error by DCT > error by DFT

end
