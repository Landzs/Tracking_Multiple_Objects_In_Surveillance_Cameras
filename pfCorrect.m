% function Particles = pfCorrect(Particles)
% This function performs particle weighting
% Inputs:   
%           Particles:         structure
% Outputs:
%           Particles:       structure
function  Particles = pfCorrect(Particles, centroid)
    Particles=repmat(centroid,size(Particles,1),1);
end