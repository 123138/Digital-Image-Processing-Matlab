%Created on Wed 2022.03.09 20:57
%Author Emine DURMUSKAYA
%Last updated on 2022.03.18 22:58
%Song #Joan Osborne - One of Us

function histogramOfImage = hist4014_ED(Image)
Image = uint8(Image); % Transforms image to 8 bit
if length(size(Image))==3 % transforms RBG images to gray
    Image = rgb2gray(Image);
end
histagramOfImage = zeros(1,256); %creates an array with 256 - 8 bit- components,
%each component corresponds to one grayscale level
grayScaleLevel = 0;

while grayScaleLevel < 256; 
    %Obtains a matrix with binary components where 1's represents the pixels
    %which has a value equal to grayScaleLevel parameter, then sums the
    %1's for all rows and columns 
    histogramOfImage(grayScaleLevel+1) = sum(sum(Image == grayScaleLevel)); 
    grayScaleLevel = grayScaleLevel + 1 ;
end
end

    



    
