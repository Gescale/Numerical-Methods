pkg load symbolic

% 1. Define symbolic variables and functions
syms x y
F_sym_func(x,y) = [x^2 - y - 1; x - y^2 + 1];
J_sym = jacobian(F_sym_func, [x,y]);

disp("Symbolic F(x,y):")
disp(F_sym_func)
disp("Symbolic Jacobian J(x,y):")
disp(J_sym)

% 2. Current numerical guess (e.g., from a previous iteration or initial guess)
x_current_val = 2;
y_current_val = 1;
current_xn_vec = [x_current_val; y_current_val]; % Column vector

fprintf("\nCurrent guess x_n = [%f; %f]\n", current_xn_vec(1), current_xn_vec(2));

% 3. Evaluate F(x_n) numerically
% First, apply the symbolic function to symbolic variables representing the current values
% This is needed because F_sym_func is a symfun
F_evaluated_sym = F_sym_func(current_xn_vec(1), current_xn_vec(2));
F_at_xn_num = double(F_evaluated_sym); % Convert to numerical

disp("F(x_n):")
disp(F_at_xn_num)

% 4. Evaluate J(x_n) numerically
J_at_xn_sym = subs(J_sym, {x, y}, {current_xn_vec(1), current_xn_vec(2)});
J_at_xn_num = double(J_at_xn_sym); % Convert to numerical

disp("J(x_n):")
disp(J_at_xn_num)

% 5. Form the right-hand side for Newton's method: -F(x_n)
rhs = -F_at_xn_num;
disp("Right hand side (-F(x_n)):")
disp(rhs)

% 6. Solve J(x_n) * d_n = -F(x_n) for d_n
d_n = J_at_xn_num \ rhs;

disp("Solved d_n:")
disp(d_n)

% 7. Calculate the next guess x_{n+1} = x_n + d_n
next_xn_vec = current_xn_vec + d_n;
fprintf("Next guess x_{n+1} = [%f; %f]\n", next_xn_vec(1), next_xn_vec(2));

% You would then loop, using next_xn_vec as current_xn_vec in the next iteration,
% until F(next_xn_vec) is close to zero or d_n is very small.
