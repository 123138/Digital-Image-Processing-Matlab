% DIP homework 5 
% Emine Durmuşkaya 2022.04.28 14:46

function sinogramOfImage = radonED_4014(image, theta)
    
    if size(image,3)== 3
        image = rgb2gray(image);  %convert rgb image to gray
    end
    image = double(image);
    
    N = length(theta);     % row size of sinogram
    M = size(image,2);     %column size of sinogram
    
    sinogram = zeros(N,M);
    
    for i = 1:length(theta)
        rotatedImage = imrotate(image,theta(i),'nearest','crop');
        instantSinogram = sum(rotatedImage);   % sum all column components to a row vector
        sinogram(i,:) = instantSinogram(:);
    end
    
    sinogramOfImage = sinogram;
    
end