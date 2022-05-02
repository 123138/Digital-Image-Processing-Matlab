%Created on Wed 2022.03.16 14:32
%Author Emine DURMUSKAYA
%Last updated on 2022.03.19 00:06
%Song # Scorpions - No One Like You

function equalizedImage = hist_Equalize4014_ED(Image)
    Image = uint8(Image);
    [M,N,RGB]=size(Image);  
    if length(RGB)==3   %transform image to black and white image
        Image = rgb2gray(Image);
    end
    numberOfPixels = numel(Image);  %getting the pixel number of the image
    histogramOfImage = hist4014_ED(Image); % obtaining histogram vector of the image
    
    %Finding probability of the occurance by dividing histogram components
    %by number of pixels, hence getting a number between 0 and 1
    probabilityOfOccurance = double(histogramOfImage)/numberOfPixels;
    
    %assuming image is 8 bit
    maxIntensityLevel = 256;
    equalizedImage = uint8(zeros(size(Image)));
    
    for i = 1:maxIntensityLevel
        %summing all probability of occurance values until specified i'th
        %one and assigning it to i'th histogram level
        equalizedHistogram(i) = (maxIntensityLevel-1)*sum(probabilityOfOccurance(1:i)); %Applying equalization formula
        uint8_equalizedHistogram(i) = uint8(equalizedHistogram(i)); % converting to 8 bit
        equalizedImage(Image==i) = uint8_equalizedHistogram(i); 
    end
    
    
    
    
    
    