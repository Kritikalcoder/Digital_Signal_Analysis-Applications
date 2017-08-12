lake = 'LAKE.TIF';
lake_data = imread ( lake );
entropy_lake = my_entropy ( lake_data );
compression_set = ( 1 : 0.1 : 10 );

entropy_value = zeros ( 1, 20 );
error_value  = zeros ( 1, 20 );

for index = 1 : 100

	c = index;
	result = reconstruct ( c );
	error_value ( 1, index ) = RMSE ( lake_data, result );
	entropy_value ( 1, index ) = my_entropy ( result );

end

stem ( error_value, entropy_value )

plot ( error_value , entropy_value )
axis equal

plot ( error_value, compression_set )
axis equal

plot ( entropy_value, compression_set )
axis equal

%Observations:
%With increase in the compression rate, the RMSE error obviously increases
%With increase in the compression rate, the entropy decreases non-linearly
%RMSE error and entropy are linearly inversely proportional