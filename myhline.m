function myhline(l, varargin)
    % Extract limits of the current axes
    xlim = get(gca, 'XLim');
    ylim = get(gca, 'YLim');

    % Check if the line is more horizontal or vertical
    if abs(l(1)) > abs(l(2))
        % Calculate intersection points with the y-axis
        y1 = (-l(3) - l(1) * xlim(1)) / l(2);
        y2 = (-l(3) - l(1) * xlim(2)) / l(2);

        % Plot the line
        line([xlim(1), xlim(2)], [y1, y2], varargin{:});
    else
        % Calculate intersection points with the x-axis
        x1 = (-l(3) - l(2) * ylim(1)) / l(1);
        x2 = (-l(3) - l(2) * ylim(2)) / l(1);

        % Plot the line
        line([x1, x2], [ylim(1), ylim(2)], varargin{:});
    end
end

