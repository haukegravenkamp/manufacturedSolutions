%% example: incompressible Navier-Stokes stationary manufactured solution
% Stationary maufactured solutions similar to
% R. Codina, J. Principe, O. Guasch, and S. Badia, "Time dependent
% subscales in the stabilized finite element approximation of
% incompressible flow problems," CMAME, vol. 196, pp. 2413–2430, 2007
% Section 5.1


mu = 0.1;                                                                   % viscosity

u = @(x,y) 100*[...                                                          % velocity
    +x.^2.*(1-x).^2 .* (2*y.*(1-y).^2 - 2*y.^2.*(1-y)); ...
    -y.^2.*(1-y).^2 .* (2*x.*(1-x).^2 - 2*x.^2.*(1-x))  ];

p = @(x,y) 100*x.^2;                                                % pressure

U = @(x,y) [u(x,y); p(x,y)];            % collect all degrees of freedom

%% evaluate PDE

epsi=@(u) 1/2*(grad(u)+(grad(u)).');                                        % strain rate

% momentum equation
fMomFun=@(u,p) ((u.')*grad(u)).' - mu*lapl(u) + grad(p);

% continuity equation
fConFun=@(u,p) div(u) ;

% compute right-hand sides
[fMom,fMomSym] = manufacturedSolution({u,p},fMomFun);                       % momentum equation
[fCon,fConSym] = manufacturedSolution({u,p},fConFun);                       % continuity equation (should vanish)

f = @(x,y) [fMom(x,y); fCon(x,y)];                                          % assemble in one vector

%% plotting
domain = [[0,1];[0,1]];                                                     % x- and y-limits for plotting
varNames = {'u^x','u^y','p'};     % names of each dof for plots
plotManufactured(U,f,domain,0,100,varNames);                                % call plot function



