function p = get_points

  p = []; but = 1;
  while but == 1
    [x, y, but] = ginput(1);
    if but == 1
      p = [p [x y 1]'];
      hold on; plot(x, y, 'r+'); hold off;
    end
  end

