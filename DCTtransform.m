lake = 'LAKE.TIF';
lake_data = imread ( lake );
lake_size = size ( lake_data );

transform = create_mat_dct;
q_matrix = [ 16, 11, 10, 16, 24, 40, 51, 61;
             12, 12, 14, 19, 26, 58, 60, 55;
             14, 13, 16, 24, 40, 57, 69, 65;
             14, 17, 22, 29, 51, 87, 80, 62;
             18, 22, 37, 56, 68, 109, 103, 77;
             24, 35, 55, 64, 81, 104, 113, 92;
             49, 64, 78, 87, 103, 121, 120, 101;
             72, 92, 95, 98, 112, 100, 103, 99 ];
comp_factor = 2;

row = 1;
column  = 1;
counter_row = lake_size ( 1 ) / 8;
counter_column = lake_size ( 2 ) / 8;
for count1 = 1 : counter_row
	row = 8 * ( count1 - 1 ) + 1;
	for count2 = 1 : counter_column
		column = 8 * ( count2 - 1 ) + 1;
		subwindow =  double ( lake_data ( row : row + 7, column : column + 7 ) );
		%subwindow = imshow ( subwindow );
		dct_image = myDCT ( subwindow, transform );
		quant_image = myDCT_quantization ( dct_image, q_matrix, comp_factor );
		%dequant_image = myDCT_dequantization ( quant_image, q_matrix, comp_factor );
		%idct_image = myIDCT ( dequant_image, transform );
		result ( row : row + 7 , column : column + 7 ) = quant_image;
	
	end
end

result = uint8 ( result );