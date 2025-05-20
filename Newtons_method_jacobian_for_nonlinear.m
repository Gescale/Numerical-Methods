%Newton Method for Nonlinear Equations
pkg load symbolic
syms x y F(x,y)

F(x,y) = [x^2-y-1; x-y^2+1]  %The equation
J_sym = jacobian(F, [x,y])   % Calculate the full Jacobian matrix

% Define the numerical values for x and y
% Values at this point have to be carefuly be picked for efficiency
x_val = 1;
y_val = 1;

J_numerical = subs(J_sym, {x, y}, {x_val, y_val}) % To substitute values into the entire Jacobian matrix:
%invJ = inv(J)               %The inverse of the jacobian
%iJF = invJ*F                %The jacobian inverse multiplied by the
F(1,1)



