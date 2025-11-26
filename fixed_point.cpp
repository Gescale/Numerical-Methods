#include <iostream>
#include <cmath>
#include <iomanip>

// Function g(x)
double g(double x) {
    return cos(x); // Replace with your specific g(x)
}

void fixed_point_iteration(double p0, double TOL, int N0) {
    int i = 1;
    double p;
    
    while (i <= N0) {
        p = g(p0); 
        std::cout << "Iteration " << i << ": p = " << p << "\n";
        
        
        if (std::fabs(p - p0) < TOL) {
            std::cout << "The method converged to p = " << std::setprecision(6) << p << " after " << i << " iterations.\n";
            return;
        }
        
        
        p0 = p;
        i++;
    }
    
    std::cout << "The method failed after " << N0 << " iterations.\n";
}

int main() {
    double p0 = 0.5; // Initial approximation
    double TOL = 0.001; // Tolerance
    int N0 = 10; // Maximum number of iterations
    
    fixed_point_iteration(p0, TOL, N0);
    return 0;
}
