function [ number ] = Eavesdrop ( audiofilename )
    % function used to identify the digits in a phone number by hearing its audio 
    % function performs correlation of each digit with a part of the audio file

    clc;
    [digit(1).audio, digit(1).frequency ] = audioread('1.ogg');
    [digit(2).audio, digit(2).frequency ] = audioread('2.ogg');
    [digit(3).audio, digit(3).frequency ] = audioread('3.ogg');
    [digit(4).audio, digit(4).frequency ] = audioread('4.ogg');
    [digit(5).audio, digit(5).frequency ] = audioread('5.ogg');
    [digit(6).audio, digit(6).frequency ] = audioread('6.ogg');
    [digit(7).audio, digit(7).frequency ] = audioread('7.ogg');
    [digit(8).audio, digit(8).frequency ] = audioread('8.ogg');
    [digit(9).audio, digit(9).frequency ] = audioread('9.ogg');
    [digit(10).audio, digit(10).frequency ] = audioread('0.ogg');
    
    format long g;
    %to remove scientific notation

    [dialednumber, Fs] = audioread(audiofilename);
    signallength = length(dialednumber);
    
    number = 0;

    while signallength > 0

        maxvalue = -10.0;
        current = dialednumber(1:Fs);
        
        curdigit = 0;

        for ind = 1:10

            value = corrcoef(fft(current), fft(digit(ind).audio));
            value = value(1,2);

            if value > maxvalue
                maxvalue = value;
                %setting current digit to ind 
                curdigit = mod(ind,10);
            end
        end

        number = number * 10 + curdigit; 
        dialednumber = dialednumber((Fs + 1):end);
        signallength = length(dialednumber);

    end

    
    number = number

end

