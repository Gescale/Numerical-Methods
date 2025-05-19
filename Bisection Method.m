function root = bisection_method(f, a, b, tol, max_iter)
  % Bisection Method to find a root of function f in the interval [a, b]
  % f        - function handle, e.g., @(x) x^2 - 4
  % a, b     - initial interval endpoints
  % tol      - desired tolerance (e.g., 1e-6)
  % max_iter - maximum number of iterations

  if f(a) * f(b) > 0
    error("Function must change sign on the interval [a, b]");
  end


  fprintf("Iter\t a\t\t b\t\t p\t\t f(p)\n");


  %Calculating the midpoint
  for i = 1:max_iter
    p = (a + b) / 2;       % Midpoint
    fp = f(p);             % Function value at midpoint

    %Printing results
    fprintf("%d\t %.6f\t %.6f\t %.6f\t %.6f\n", i, a, b, p, fp);

    %Checking if we have reached the end
    if abs(fp) < tol || (b - a)/2 < tol
      root = p;
      fprintf("Root found at x = %.10f after %d iterations\n", p, i);
      return;
    endif

    %Deciding which value to keep, or swap values with the midpoint
    if f(a) * fp < 0
      b = p;
    else
      a = p;
    endif
  endfor

  % If it reaches here, the method did not converge
  warning("Method did not converge after %d iterations", max_iter);
  root = (a + b) / 2;
end



%Using the function
f = @(x) x^3 + 4*x^2 - 10;        % Example function
a = 1;                            % Left endpoint
b = 2;                            % Right endpoint
tol = 1e-4;                       % Tolerance
max_iter = 100;                  % Maximum number of iterations

root = bisection_method(f, a, b, tol, max_iter);

