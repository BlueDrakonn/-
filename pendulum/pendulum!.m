function pendulum_animation(L, phi0, phi_dot0)
  #first_argument = lenght pendulum
  #second_argument = angle
  #third_argument = angle speed
  g = 9.81;
  time_step = 0.01;
  timeline = 0:time_step:100;

  #
  [t, phi] = ode45(
    @(timeline, y) pendulumODE(timeline, y, L, g),
    timeline,
    [phi0; phi_dot0]
  );

  x = L * sin(phi);
  y = -L * cos(phi);

  #
  figure;
  axis([-L-0.5 L+0.5 -L-0.5 L+0.5]);
  axis equal;
  hold on;

  pendulumLine = line('XData', [0 x(1)], 'YData', [0 y(1)], 'LineWidth', 2);
  pendulumBall = line(
    'XData', x(1),
    'YData', y(1),
    'Marker', 'o',
    'MarkerFaceColor', '#000',
    'MarkerSize', 20
  );

  for i = 2:length(timeline)
    set(pendulumLine, 'XData', [0 x(i)], 'YData', [0 y(i)]);
    set(pendulumBall, 'XData', x(i), 'YData', y(i));
    drawnow;
  end
end

function dydt = pendulumODE(t, y, L, g)

  dydt = [y(2); -g/L * sin(y(1))];
end

