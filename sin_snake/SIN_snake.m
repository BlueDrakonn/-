
startX = 0;
startY = 0;
R = 0.5;
num_of_circles = 4;

ploths = zeros(num_of_circles);
for i = 1:1:num_of_circles
  ploths(i) = drawcircle(startX - i, startY, R);
  hold on;
endfor;


axis([-20 20 -20 20]);
axis equal;

t = 0:0.1:2*pi;
x = @(startX) R * cos(t) + startX;
y = @(startY) R * sin(t) + startY;

traj_x = @(k) 3 * k;
traj_y = @(k) 4 * sin(k);

for k = -10:0.05:10
  for i = 1:1:num_of_circles
    if i == 1
      x_coords = x(traj_x(k));
      y_coords = y(traj_y(k));
      k_prev = k;
    else
      step = 0.01;
      k_next = k_prev;
      while abs( (traj_x(k_prev) - traj_x(k_next))^2 + (traj_y(k_prev) - traj_y(k_next))^2 )< (R * 2)^2
        k_next -= step;
      endwhile;
      x_coords = x(traj_x(k_next));
      y_coords = y(traj_y(k_next));
      k_prev = k_next;
    endif;
    set(ploths(i), 'XData', x_coords, 'YData', y_coords);
  endfor;
  drawnow;
endfor;
