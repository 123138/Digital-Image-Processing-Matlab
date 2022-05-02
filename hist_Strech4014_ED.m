%Created on Wed 2022.03.09 20:57
%Author Emine DURMUSKAYA
%Last updated on 2022.03.18 23:42
%Song # Pink Floyd - Another Brick in the Wall Pt.2
function StrechedImage = hist_Strech4014_ED(Image, brightness, contrast)
    Image = uint8(Image);
    [M,N,RGB]=size(Image); %gets the sizes of the image
    if length(RGB)==3 % transforms RBG images to gray
        Image = rgb2gray(Image);
    end
    Image = double(Image); %Transforms image to double, in otrder to make mathematical operations
    %For all elements of matrix applies the stretching formula
    for row = 1:M
        for col = 1:N
            if (Image(row,col)+brightness).* contrast < 0
                Image(row,col) = 0;
            elseif (Image(row,col)+brightness).* contrast > 255
                Image(row,col) = 255;
            else
                Image(row,col) = (Image(row,col)+brightness).* contrast;
            end
        end
    end
    StrechedImage = uint8(Image);
end
    
                
            
    
    
    