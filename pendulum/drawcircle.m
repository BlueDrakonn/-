function ploth = drawcircle(centerx, centery, R)
  t = 0:0.1:2*pi;
  x = R * cos(t) + centerx;
  y = R * sin(t) + centery;
  ploth = plot(x, y, 'linewidth', 3);
endfunction;
