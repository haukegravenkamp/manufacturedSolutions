function ff=manufacturedSolution(varFuns,fFun)
% Compute body load fFun based on an analytical solution defined by a cell
% of function handles in varFuns.
syms x y real
varSym{numel(varFuns)}={};
for i=1:numel(varFuns)
    varSym{i}=str2sym(char(varFuns{i}));
end
f=fFun(varSym{:});

ff=matlabFunction(f,'Vars',{'x','y'});

end






