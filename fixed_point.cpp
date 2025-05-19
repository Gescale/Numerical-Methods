#include <iostream>
#include <cmath>
#include <iomanip>

// Function g(x)
double g(double x) {
    return cos(x); // Replace with your specific g(x)
}

void fixed_point_iteration(double p0, double TOL, int N0) {
    int i = 1; // Initialize iteration counter
    double p;  // Store the next approximation
    
    while (i <= N0) {
        p = g(p0); // Compute next approximation
        std::cout << "Iteration " << i << ": p = " << p << "\n";
        
        // Check convergence
        if (std::fabs(p - p0) < TOL) {
            std::cout << "The method converged to p = " << std::setprecision(6) << p << " after " << i << " iterations.\n";
            return;
        }
        
        // Update for the next iteration
        p0 = p;
        i++;
    }
    
    // If the loop completes without finding a solution
    std::cout << "The method failed after " << N0 << " iterations.\n";
}

int main() {
    double p0 = 0.5; // Initial approximation
    double TOL = 0.001; // Tolerance
    int N0 = 10; // Maximum number of iterations
    
    fixed_point_iteration(p0, TOL, N0);
    return 0;
}
