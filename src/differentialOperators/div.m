function divU=div(u)
syms x y
if numel(u)==2                                                              % vector
%     divU=divergence(u);
    divU=diff(u(1),x)+diff(u(2),y);
elseif numel(u)==4                                                          % matrix
%     divU=[divergence(u(:,1));divergence(u(:,2))];
    divU=[diff(u(1,1),x)+diff(u(2,1),y);diff(u(1,2),x)+diff(u(2,2),y)];
end
end