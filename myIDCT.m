function [ output ] = myIDCT ( image1, transform1 )
    %image1 = imread (image1);
    image1 = double(image1);
    output = inv ( transform1 ) * image1 * transform1 ;
    %imshow ( uint8 ( output ) );
end