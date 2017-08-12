function [ output ] = RMSE ( image1, image2 )
	%image1 = imread ( image1 );
	image1 = double ( image1 );
	%image2 = imread ( image2 );
	image2 = double ( image2 );
	size1 = size ( image1 );
	size2 = size ( image2 );

	originalRowSize = size(image1,1);
	originalColSize = size(image1,2);

	signal1 = image1(:);
	signal2 = image2(:);

	mse = sum((signal1 - signal2).^2)./(originalRowSize*originalColSize);
	rmse = sqrt(mse);

	output = rmse;
end