function F = computeFundamentalMatrix22(points1, points2)
    % Normalize points
    [norm_points1, T1] = normalizePoints(points1);
    [norm_points2, T2] = normalizePoints(points2);

    % Assemble the design matrix
    A = []; % Initialize matrix A

    for i = 1:size(norm_points1, 1)
        product_row = kron(norm_points2(i, :), norm_points1(i, :)); % Kronecker product of corresponding rows
        A = [A; product_row]; % Append the result to matrix A
    end

    % Compute SVD of A and extract F from the column of V corresponding to the smallest singular value
    [~, ~, V] = svd(A);
    F_vector = V(:, end);
    F_matrix = reshape(F_vector, 3, 3)';

    result = T2' * F_matrix* T1;
    result = result/result(3,3);
    [uf, df, vf] = svd(result);
    % dp = dp - dp(end, end)
    df(end, end) = 0;
    F = uf*df*vf'
