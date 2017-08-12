function [ output ] = myDCT_quantization ( dct_block, q_matrix, comp_factor )
	%dct_block = imread ( dct_block );
	dct_block = double ( dct_block );
	q_matrix = comp_factor * q_matrix;
    imqDCT = double ( dct_block ./ q_matrix );
	imqDCT = round ( imqDCT );
	output = imqDCT;
	%imshow (uint8 (imqDCT));
end