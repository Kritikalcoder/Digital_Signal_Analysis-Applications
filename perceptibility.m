lake = 'LAKE.TIF';
lake_data = imread ( lake );
entropy_lake = my_entropy ( lake_data );

entropy_value = zeros ( 10, 1 );
error_value  = zeros ( 10, 1 );

% c = 1.2
result = reconstruct ( 1.2 );
imshow ( result );
error_float = RMSE ( lake_data, result );
entropy_float = my_entropy ( result );

% c = 1
result1 = reconstruct ( 1 );
%imshow ( result1 );
error_value ( 1 ) = RMSE ( lake_data, result1 );
entropy_value ( 1 ) = my_entropy ( result1 );

% c = 2
result2 = reconstruct ( 2 );
%imshow ( result2 );
error_value ( 2 ) = RMSE ( lake_data, result2 );
entropy_value ( 2 ) = my_entropy ( result2 );

% c = 3
result3 = reconstruct ( 3 );
%imshow ( result3 );
error_value ( 3 ) = RMSE ( lake_data, result3 );
entropy_value ( 3 ) = my_entropy ( result3 );

% c = 4
result4 = reconstruct ( 4 );
%imshow ( result4 );
error_value ( 4 ) = RMSE ( lake_data, result4 );
entropy_value ( 4 ) = my_entropy ( result4 );

% c = 5
result5 = reconstruct ( 5 );
%imshow ( result5 );
error_value ( 5 ) = RMSE ( lake_data, result5 );
entropy_value ( 5 ) = my_entropy ( result5 );

% c = 6
result6 = reconstruct ( 6 );
%imshow ( result6 );
error_value ( 6 ) = RMSE ( lake_data, result6 );
entropy_value ( 6 ) = my_entropy ( result6 );

% c = 7
result7 = reconstruct ( 7 );
%imshow ( result7 );
error_value ( 7 ) = RMSE ( lake_data, result7 );
entropy_value ( 7 ) = my_entropy ( result7 );

% c = 8
result8 = reconstruct ( 8 );
%imshow ( result8 );
error_value ( 8 ) = RMSE ( lake_data, result8 );
entropy_value ( 8 ) = my_entropy ( result8 );

% c = 9
result9 = reconstruct ( 9 );
%imshow ( result9 );
error_value ( 9 ) = RMSE ( lake_data, result9 );
entropy_value ( 9 ) = my_entropy ( result9 );

% c = 10
result10 = reconstruct ( 10 );
%imshow ( result10 );
error_value ( 10 ) = RMSE ( lake_data, result10 );
entropy_value ( 10 ) = my_entropy ( result10 );

% Highest value of c so that distortions are just perceptible: 
% If c has to be integer then c = 2
% If c can be a floating point number then c = 1.2

% Result10 : when c = 10
% The algorithm compresses the image with a compression factor of 10. This implies that each pixel loses an order of magnitude in its precision.
% Subwindows which lie on edges stand out in the otherwise uniform and blurry looking transformed image
% The image appears heavily segmented because of the loss of intensity values during quantization.
% Fine details within subwindows are completely lost due to the high compression rate.