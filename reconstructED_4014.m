% DIP homework 5 
% Emine Durmuşkaya 2022.04.30 15:05


function reconImage = reconstructED_4014(image);
    if size(image,3)== 3
        image = rgb2gray(image);
    end
    image = double(image);
    
    ramlakFilter = abs(linspace(-1,1,size(image,2))); %create ramlak filter function
    
    backProjectedImage = zeros(size(image,2));
    
        for i=1:size(image,1)
            
            %applying RAMLAK
            fProjection=fftshift(fft(image(i,:)));
            fProjectionFilt= ramlakFilter.*fProjection;
            image(i,:)=real(ifft(ifftshift(fProjectionFilt)));

            instantRow = image(i,:);
            tempImage = repmat(instantRow,size(image,2),1); %create 2D images from rows and assign tempimage
            tempImage = imrotate(tempImage,i-1,'nearest','crop');  %rotate images
            backProjectedImage = backProjectedImage + tempImage;   %add all images together
        end
        
    reconImage = uint8(backProjectedImage / size(image,1)); %divide by number of projections and convert uint8
end