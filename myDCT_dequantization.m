function [ output ] = myDCT_dequantization ( imqDCT, q_matrix, comp_factor )
	%imqDCT = imread ( imqDCT );
	imqDCT = double ( imqDCT );
	q_matrix = comp_factor * q_matrix;
    result = double ( imqDCT .* q_matrix );
    output = result;
    %imshow ( uint8 ( result ));
end