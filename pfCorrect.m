% function Particles = pfCorrect(Particles)
% This function performs particle Correct
% move particles into centroid
% Inputs:   
%           Particles:         structure
%           centroid:          array
% Outputs:
%           Particles:         structure
function  Particles = pfCorrect(Particles, centroid)
    Particles=repmat(centroid,size(Particles,1),1);
end