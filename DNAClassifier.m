function [ species ] = DNAClassifier ( DNA )
    % function to test DNA and identify its species: rhesus monkey or chimp or human
    clc;

    load('AncestorData.mat');

    maxvalue = -10.0;
    category = 0;

    
    value = corr2(abs(fft2(chimps)), abs(fft2(DNA)));
    if value > maxvalue 
        category = 1;
        maxvalue = value;
        
    end

    value = corr2(abs(fft2(humans)), abs(fft2(DNA)));
    if value > maxvalue
        category = 2;
        maxvalue = value;
        
    end

    value = corr2(abs(fft2(rhesus)), abs(fft2(DNA)));
    if value > maxvalue 
        category = 3;
        maxvalue = value;
        
    end
    
    if category == 1
        species = 'Chimp';
    elseif category == 2
        species = 'Human';
    elseif category == 3
        species = 'Rhesus Monkey';
    end

    species
    
end

