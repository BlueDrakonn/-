function roots_vec = newton(f, f_der, a, b, num_of_roots, epsilon)
  roots_vec = [];
  n = 16;
  while size(roots_vec)(2) < num_of_roots
    h = (b - a) / n;
    for k = 1:1:n
      if sign(f(a + k * h)) != sign(f(a + (k + 1) * h))
        right = a + (k + 1) * h;
        left = a + k * h;
        root = right;
        while 1
          r_new = root - (f(root) / f_der(root));

          if sign(f(left)) != sign(f(r_new))
            right = r_new;
          endif;

          if sign(f(r_new)) != sign(f(right))
            left = r_new;
          endif;

          if abs(r_new - root) < epsilon
            root = r_new;
            if ((size(roots_vec)(2) == 0) || (min(abs(roots_vec - root)) > epsilon)) && (a < root) && (root < b)
              roots_vec = cat(2, roots_vec, root);
            endif;
            break;
          endif;
          root = r_new;
        endwhile
      endif
    endfor
    n = n * 2;
  endwhile;
endfunction
