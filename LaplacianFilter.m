%Created on Wed 2022.04.01 20.55
%Author Emine DURMUSKAYA
%Last updated on 2022.04.01 21.13
%Song # Danzig - Mother

clc;
clear;
kernel_name{1} = 'Laplacian Filter';
kernel_name{2} = 'Laplacian Filter + Original Image';
kernel{1}=[1 1 1; 1 -8 1; 1 1 1];
A=2;
E=[0 0 0;0 1 0; 0 0 0];
kernel{2}=E- A*kernel{1};

Image{1} = imread('SC_SK3.TIF');
Image{2} = imread('SC_SK2.TIF');
Image{3} = imread('SC_CH2.TIF');
Image{4} = imread('DVI_BR_2.TIF');
%% 
figure;
for k = 1:length(Image)
if k == 1
subplot(4,3,1);
imshow(Image{k});
title('Original Image');
counter= 1;
end
if k == 2
subplot(4,3,4);
imshow(Image{k});
title('Original Image');
counter= 4;
end
if k == 3
subplot(4,3,7);
imshow(Image{k});
title('Original Image');
counter= 7;
end
if k == 4
subplot(4,3,10);
imshow(Image{k});
title('Original Image');
counter= 10;
end


for i = 1: length(kernel)
filteredImage = Convolution2D_ED(Image{k}, kernel{i});
subplot(4,3,i+counter);
imshow(filteredImage);
title(kernel_name{i});  

end

end