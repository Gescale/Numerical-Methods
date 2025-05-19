#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Define the function f(x)
double f(double x) {
    return x * x - 2; // Example: f(x) = x^2 - 2
}

// Define the derivative f'(x)
double f_prime(double x) {
    return 2 * x; // Derivative of f(x) = x^2 - 2 is f'(x) = 2x
}

void newtons_method(double initial_guess, double tolerance, int max_iterations) {
    double x = initial_guess; // Starting point (initial guess)
    double fx, fx_prime;      // Function and derivative values at x
    int iteration = 0;        // Iteration counter

    cout << "Newton's Method for Root Finding" << endl;
    cout << "--------------------------------" << endl;
    cout << "Initial guess: x = " << x << endl;

    while (iteration < max_iterations) {
        fx = f(x);             // Evaluate f(x) at the current x
        fx_prime = f_prime(x); // Evaluate f'(x) at the current x

        // Check if the derivative is too small (to avoid division by zero)
        if (abs(fx_prime) < 1e-10) {
            cout << "Error: Derivative near zero. Newton's Method cannot proceed." << endl;
            return;
        }

        // Compute the next approximation using the formula
        double x_next = x - fx / fx_prime;

        // Display the iteration details
        cout << "Iteration " << iteration + 1 << ": x = " << x_next
             << ", f(x) = " << fx << ", |x_next - x| = " << abs(x_next - x) << endl;

        // Check if the current approximation is within the desired tolerance
        if (abs(x_next - x) < tolerance) {
            cout << "The root is approximately: x = " << x_next
                 << " (found in " << iteration + 1 << " iterations)" << endl;
            return;
        }

        // Update x for the next iteration
        x = x_next;
        iteration++;
    }

    // If the method reaches the maximum number of iterations without converging
    cout << "The method failed to converge after " << max_iterations << " iterations." << endl;
}

int main() {
    double initial_guess = 1.0;    // Starting point
    double tolerance = 1e-6;       // Convergence tolerance
    int max_iterations = 20;      // Maximum number of iterations

    newtons_method(initial_guess, tolerance, max_iterations);

    return 0;
}
