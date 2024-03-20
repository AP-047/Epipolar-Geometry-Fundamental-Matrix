function errors = calculateGeometricError(points, lines)
    % points: 2xN matrix of point coordinates [x; y]
    % lines: Nx3 matrix of line parameters [a, b, c]

    num_points = size(points, 2);
    errors = zeros(num_points, 1);

    for i = 1:num_points
        x = points(1, i);
        y = points(2, i);

        a = lines(i, 1);
        b = lines(i, 2);
        c = lines(i, 3);

        % Calculate distance between point and line
        errors(i) = abs(a * x + b * y + c) / sqrt(a^2 + b^2);
    end
end

