
if ispc
    addpath(genpath('.\code'))
    addpath(genpath('.\differentialOperators'))         % windows
else
    addpath(genpath('./code'))                % not windows
    addpath(genpath('./differentialOperators'))                % not windows
end