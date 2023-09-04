function plotManufactured(u,f,domain,t,nP,varNames)
% plot solution u and right-hand side f
% u: function handle defining solution
% f: function handle defining rhs
% domain: limits of rectangular domain for plotting [[xmin,xmax];[ymin,ymax]] 
% t: time value to plot in case of transient problem
% nP: number of plotting points in each direction
% varNames: names of variables in u, just for axis labels

if (nargin<6)||isempty(varNames)
    varNames = {'u'};
end

if nargin(u)==2
    uPlot = @(x,y,t) u(x,y);
    fPlot = @(x,y,t) f(x,y);
else
    uPlot = u;
    fPlot = f;
end

[xP,yP,uP,fP]=evaluateManufactured(uPlot,fPlot,domain,t,nP);
createPlot(xP,yP,uP,varNames);
createPlot(xP,yP,fP,{'f'});


    function [xP,yP,uP,fP] = evaluateManufactured(u,f,domain,t,nPlot)
        % evaluate function handles at dicrete points

        xP = linspace(domain(1,1),domain(1,2),nPlot);                       % x-values for plotting
        yP = linspace(domain(2,1),domain(2,2),nPlot);                       % y-values for plotting
        [x,y] = meshgrid(xP,yP);                                            % array of coordinate values

        sizeU = numel(u(xP(1),yP(1),t));                                    % query output size of u and f
        sizeF = numel(f(xP(1),yP(1),t));

        uP=zeros([size(x),sizeU]);                                          % allocate numerical values of u, f
        fP=zeros([size(x),sizeF]);
        for i=1:size(x,1)                                                   % loop coordinates
            for j=1:size(x,2)
                uP(i,j,:)=u(x(i,j),y(i,j),t);                               % evaluate u, f
                fP(i,j,:)=f(x(i,j),y(i,j),t);
            end
        end

    end


    function createPlot(x,y,z,label)
        % generate figures with some standard settings

        sizeZ = size(z,3);
        sizeLabel = numel(label);
        for i=1:sizeZ
            figure('defaulttextinterpreter','latex');
            surf(x,y,z(:,:,i),'FaceColor','interp');
            xlabel('$x$')
            ylabel('$y$')
            if sizeZ>sizeLabel
                zlabel(['$',label{1},'_',num2str(i),'$'])
            else
                zlabel(['$',label{i},'$'])
            end
            set(gca,'FontSize',14)
            box on
        end
    end

end