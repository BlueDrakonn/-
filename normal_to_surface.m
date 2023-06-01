clear;
x = -pi:0.1:pi;
y = -pi:0.1:pi;
[X, Y] = meshgrid(x, y);
Z = 20 - X.^2 - Y.^2;
surf(X, Y, Z);
shading interp;

hold on;

f = @(x, y) 20 - x.^2 - y.^2;

x0 = 0;
y0 = 0;
z0 = f(x0, y0);

h = 0.000001;
derX = (f(x0+h, y0) - f(x0, y0)) / h;
derY = (f(x0, y0+h) - f(x0, y0)) / h;

ort = [-derX -derY 1] / sqrt((derX)^2 + (derY)^2 + 1);

x_norm = [x0 x0+ort(1)];
y_norm = [y0 y0+ort(2)];
z_norm = [z0 z0+ort(3)];

plot3(x_norm, y_norm, z_norm);
axis equal;
