function [ output ] = create_mat_dct ()
	%function to create an n-point dct matrix
	point = 8;
	%dct_matrix = zeros ( point, point )
	for i2 = 1 : point
		dct_matrix ( 1, i2 ) = 1 / sqrt ( point );
	end
	for i1 = 2 : point
		for i2 = 1 : point
			dct_matrix ( i1, i2 ) = sqrt ( 2 / point ) * cos (( pi * ( 2 * i2 - 1 ) * ( i1 - 1 ) ) / ( 2 * point ));
		end
	end
	output = dct_matrix;

	verification = dctmtx ( 8 );
	%They both are the exact same
	
end
