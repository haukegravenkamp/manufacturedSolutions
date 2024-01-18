
%% example: linear elasticity


%% Material properties
E  = 1;                                                                     % Young's modulus
nu = 0;                                                                     % Poisson's ratio

lambda = E*nu/((1+nu)*(1-2*nu));                                            % Lamé parameters
mu = E/(2*(1+nu));

%% problem-dependent functions
u = @(x,y) [x^5+y^2; x^2+y^5];                                              % displacement vector field

%% PDE
epsilon = @(u) 1/2*(grad(u)+(grad(u)).');                                   % strains                                
sigma  =  @(u) 2*mu*epsilon(u) + lambda*trace(epsilon(u))*eye(2);           % stresses
fFun = @(u) -div(sigma(u));                                                 % define PDE (left-hand side)

%% compute right-hand side
f = manufacturedSolution({u},fFun);                                         % compute body load

%% plotting
domain = [[0,1];[0,1]];                                                     % x- and y-limits for plotting
varNames = {'u_x','u_y'};                                                   % names of each dof for plots
plotManufactured(u,f,domain,0,100,varNames);                                % call plot function
