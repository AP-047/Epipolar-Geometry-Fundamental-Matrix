% Load the image
I = imread('img1.png');

% Convert to grayscale
gray_image = rgb2gray(I);

% Display the original and grayscale images
figure; imshow(I);
figure; imshow(gray_image);
imwrite(gray_image, 'grayscale_img1.png');


