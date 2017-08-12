function [ output ] = myDCT ( image1, transform1 )
    %image1 = imread (image1);
    image1 = double(image1);
    output = transform1 * image1 * inv ( transform1 );
    %imshow ( uint8 ( output ) );
end