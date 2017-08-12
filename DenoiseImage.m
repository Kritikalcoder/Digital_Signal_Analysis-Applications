function [image] = DenoiseImage (inputimage)
% function to denoise an image of twigs by creating a high pass filter
%input=imread('twigs.png');
clc;
inputvalue=imread(inputimage);
red = inputvalue(:,:,1);
green = inputvalue(:,:,2);
blue = inputvalue(:,:,3);
fftmagr = abs(fftshift(fft2(red)));
fftangler = angle(fftshift(fft2(red)));

fftmagg = abs(fftshift(fft2(green)));
fftangleg = angle(fftshift(fft2(green)));

fftmagb = abs(fftshift(fft2(blue)));
fftangleb = angle(fftshift(fft2(blue)));

for k = 1:87
    for m = 125:129
        fftmagr(m,k) = 1;
        fftmagg(m,k) = 1;
        fftmagb(m,k) = 1;
    end
end

for k = 171:256
    for m = 125:129
        fftmagr(m,k) = 1;
        fftmagg(m,k) = 1;
        fftmagb(m,k) = 1;
    end
end

for m = 1:84
    for k = 128:130
        fftmagr(m,k) = 1;
        fftmagg(m,k) = 1;
        fftmagb(m,k) = 1;
    end
end

for m = 170:253
    for k = 128:130
        fftmagr(m,k) = 1;
        fftmagg(m,k) = 1;
        fftmagb(m,k) = 1;
    end
end

FreqDomainr = (fftmagr).*exp(i*(fftangler));
FreqDomaing = (fftmagg).*exp(i*(fftangleg));
FreqDomainb = (fftmagb).*exp(i*(fftangleb));

originalr = uint8(ifft2(ifftshift(FreqDomainr)));
originalg = uint8(ifft2(ifftshift(FreqDomaing)));
originalb = uint8(ifft2(ifftshift(FreqDomainb)));

image =  cat(3, originalr, originalg, originalb);

imshow(image);

end
