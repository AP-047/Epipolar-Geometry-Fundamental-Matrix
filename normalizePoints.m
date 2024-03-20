function [normalized_points, T] = normalizePoints(points)
    % Compute centroid
    centroid = abs(mean(points, 1));
      disp(centroid)
    % Shift centroid to the origin
    centered_points = points - centroid;

    % Calculate scale to normalize mean distance to sqrt(2)
    mean_distance = mean(sqrt(centered_points(:,1).^2 + centered_points(:,2).^2));
    scale = sqrt(2) / mean_distance;
    m = mean(abs(points(:, 1))); % Calculate mean absolute value of x-coordinates (first column)
    n = mean(abs(points(:, 2))); % Calculate mean absolute value of y-coordinates (second column)

    % Create normalization matrix
    T = [m, 0, -m* centroid(1);
         0, n, -n* centroid(2);
         0, 0, 1];

    % Normalize points
    % Assuming points is a 2xN matrix
    num_points = size(points, 2);
    homogeneous_points = [points; ones(1, num_points)];

    fprintf('From normalize points file, the homogeneous points are:\n');
    fprintf('%f ', points);  % Assuming matrix contains floating-point numbers
    fprintf('\n');
    disp(homogeneous_points);
    disp(size(homogeneous_points));
    normalized_points = (T * homogeneous_points)';
    fprintf('From normalize points file, the normalized points are:\n');
    fprintf('\n');;
    disp(normalized_points);
    disp(size(homogeneous_points));
    % # size of homogenous and normalized points are 8*3
end


