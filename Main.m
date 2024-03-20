function Main

% Load the images
image1 = imread('grayscale_img1.png');
image2 = imread('grayscale_img2.png');

% Display the loaded images side by side
figure;
subplot(1, 2, 1);
imshow(image1);
title('Image 1');

subplot(1, 2, 2);
imshow(image2);
title('Image 2');

% Guide the user to select at least 8 corresponding points in both images
disp('Please select at least 8 corresponding points in both images.');
disp('Press ENTER when done.');

% Create separate figures to display and select points for each image
figure;
subplot(1, 2, 1);
imshow(image1);
title('Image 1');

% Collect the user's selected points for Image 1
[x1, y1] = ginput(8);
if length(x1) < 8 || length(y1) < 8
    error('Please select at least 8 corresponding points in both images.');
end

subplot(1, 2, 2);
imshow(image2);
title('Image 2');

% Collect the user's selected points for Image 2
[x2, y2] = ginput(8);
if length(x2) < 8 || length(y2) < 8
    error('Please select at least 8 corresponding points in both images.');
end

% Store the selected points as matrices
points_image1 = [x1, y1]';
points_image2 = [x2, y2]';

% Normalize the selected points before computing the fundamental matrix
[pt1, T1] = normalizePoints(points_image1);
[pt2, T2] = normalizePoints(points_image2);

% Compute the fundamental matrix using the normalized points
f = computeFundamentalMatrix22(points_image1, points_image2);

% Define matrices to store homogeneous points and epipolar lines for both images
homo_points_image1 = zeros(3, 8);
homo_points_image2 = zeros(3, 8);
lines_img1 = zeros(3, 8)';
lines_img2 = zeros(3, 8)';

% Calculate epipolar lines using the fundamental matrix
for j = 1:8
    lines_img1(j, :) = f' * pt1(j, :)';
    lines_img2(j, :) = f * pt2(j, :)';
end

% Display epipolar lines on the images
figure;
imshow(image1);
title('Epipolar lines in Image 1');
hold on;

% Draw epipolar lines on Image 1
for i = 1:size(lines_img1, 1)
    myhline(lines_img1(i, :)', 'Color', 'b');
end
hold off;

figure;
imshow(image2);
title('Epipolar lines in Image 2');
hold on;

% Draw epipolar lines on Image 2
for i = 1:size(lines_img2, 1)
    myhline(lines_img2(i, :)', 'Color', 'c');
end
hold off;

% Calculate the geometric image error (symmetric epipolar distance) for each image
errors_image1 = calculateGeometricError(points_image1, lines_img1);
errors_image2 = calculateGeometricError(points_image2, lines_img2);

% Display the overall geometric error for points in each image
disp('Overall Geometric Error for points in Image 1:');
disp(errors_image1);
disp('Overall Geometric Error for points in Image 2:');
disp(errors_image2);

end

