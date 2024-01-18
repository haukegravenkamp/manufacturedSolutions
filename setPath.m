
if ispc
    addpath(genpath('.\src'))
    addpath(genpath('.\examples'))         % windows
else
    addpath(genpath('./src'))                % not windows
    addpath(genpath('./examples'))                % not windows
end