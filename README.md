# manufacturedSolutions

**Generate manufactured solutions of partial differential equations in Matlab**

When working with (partial) differential equations (PDEs), we oftentimes create a specific analytical test case using so-called *manufactured solutions*. 
The idea is simply to choose a solution, say $u(x,y)$, substitute it into the PDE, and compute the right-hand side, say $f(x,y)$. 
For complicated PDEs or functions $u$, the calculation by hand can become very tedious.  
This small code is intended to simplify this process in Matlab by making use of symbolic computations. 
As a result, we obtain a function handle representing the closed-form expression of the right-hand side $f(x,y)$ for a user-defined PDE.
Also, the examples provided with this code are those used in publications by the author. 
Hence, the purpose is to provide the manufactured solutions of those examples for other researchers who want to reproduce those results (as the manufactured solutions can lead to very long expressions in the rhs $f(x,y)$ they are often not printed in the papers).

**simple example**

Consider Poisson's equation:

$\Delta u(x,y) = f(x,y)$

Choose a solution:

$u(x,y) = \sin(\pi x) \sin(\pi y)$

Substitute into PDE:

$\Delta u(x,y) = -2\pi^2 \sin(\pi x) \sin(\pi y) = f(x,y)$

Hence, solving the PDE on some domain with the $f(x,y)$ given above and Dirichlet boundary conditions according to $u(x,y)$ should recover the chosen solution anywhere inside the domain. 
This can be used to test solution schemes.

**further examples**

In addition to the minimal example above, this code contains examples used in the author's publications. As of Sept 2023, this includes examples from

[1] Gravenkamp, H., Pfeil, S., & Codina, R., Stabilized finite elements for the solution of the Reynolds equation considering cavitation (under review). CMAME.

[2] Gravenkamp, H., Codina, R., & Principe, J., A stabilized finite element method for modeling dispersed multiphase flows using orthogonal subgrid scales (under review). International Journal of Computational Physics. 
