clear;

f = @(x) 1 + (1+sin(x)-cos(x)).^2 - (sin(2*x)-cos(2*x)-0.2).^2;
h = 0.0000001;
f_der = @(x) (f(x + h) - f(x)) / h;

a = -5;
b = 5;
plot_step = 0.1;
num_of_roots = 5;
x = [a:plot_step:b];

plot(x, f(x), x, 0*x);
legend('function', 'y = 0')
grid on;
axis equal;
xlabel('x');
ylabel('y');
hold on
step = 0.2;
m = int32((b - a) / step) - 1;

epsilon = 0.1;

# ньютон

roots1 = [];
roots1 = newton(f, f_der, a, b, num_of_roots, epsilon)


# половинное деление

n = 16;
roots2 = [];
while size(roots2)(2) < num_of_roots
  h = (b - a) / n;
  for k = 1:1:n
    if sign(f(a + k * h)) != sign(f(a + (k + 1) * h))
      right = a + (k + 1) * h;
      left = a + k * h;
      root = right;
      while 1
        r_new = (left + right) / 2;

        if sign(f(left)) != sign(f(r_new))
          right = r_new;
        endif;

        if sign(f(r_new)) != sign(f(right))
          left = r_new;
        endif;

        if abs(r_new - root) < epsilon
          root = r_new;
          if ((size(roots2)(2) == 0) || (min(abs(roots2 - root)) > epsilon)) && (a < root) && (root < b)
            roots2 = cat(2, roots2, root);
          endif;
          break;
        endif;
        root = r_new;
      endwhile
    endif
  endfor
  n = n * 2;
endwhile;
roots2


#fzero

A = []

schetchik = -5

while schetchik < 5

root = fzero(f,schetchik)
k = 0
for i = A

  if i == root
    break
  endif
  k+=1
end
 if k == length(A) && ((min(abs(A - root)) > epsilon) || (size(A)(2) == 0))
   A(end+1) = root

 endif

 schetchik += 0.5


endwhile




# график
plot(roots2,0,"markersize", 20);
plot(roots1,0,"markersize", 20);
plot(A,0,"markersize", 20);


#эпсилон сделал 0.1 потому что иначе разница на графике вообще не видна между "точным решением" и методом ньютона и половинного деления
