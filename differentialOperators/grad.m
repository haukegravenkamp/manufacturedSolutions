function gradU=grad(u)
syms x y
if numel(u)==1
    gradU=[diff(u,x);diff(u,y)];
elseif numel(u)==2
    gradU=[diff(u(1),x),diff(u(2),x);diff(u(1),y),diff(u(2),y)];
end
end