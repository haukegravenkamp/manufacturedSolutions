function [fh,fSym]=manufacturedSolution(varFuns,fFun)
% Compute body load fFun based on an analytical solution defined by a cell
% of function handles in varFuns.
syms x y real
varSym{numel(varFuns)}={};
for i=1:numel(varFuns)
    varSym{i}=str2sym(char(varFuns{i}));
end
fSym=fFun(varSym{:});                       % symbolic expression

fh=matlabFunction(fSym,'Vars',{'x','y'});   % function handle

end






