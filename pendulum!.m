function pendulum_animation(L, phi0, phi_dot0)
  # Parameters
  g = 9.81;
  time_step = 0.01;
  timeline = 0:time_step:10;

  # Solve the ODE
  [t, phi] = ode45(
    @(timeline, y) pendulumODE(timeline, y, L, g),
    timeline,
    [phi0; phi_dot0]
  );

  x = L * sin(phi);
  y = -L * cos(phi);

  # Animation
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
    'MarkerSize', 10
  );

  for i = 2:length(timeline)
    set(pendulumLine, 'XData', [0 x(i)], 'YData', [0 y(i)]);
    set(pendulumBall, 'XData', x(i), 'YData', y(i));
    drawnow;
  end
end

function dydt = pendulumODE(t, y, L, g)
  # y(1) - phi
  # y(2) - phi_dot
  dydt = [y(2); -g/L * sin(y(1))];
end

