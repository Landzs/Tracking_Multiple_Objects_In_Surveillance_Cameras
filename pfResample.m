% function Particles = pfresample(Particles)
% This function performs systematic re-sampling
% Inputs:   
%           Particles:       structure
%           mask:            array
%           centroids:       array
% Outputs:
%           Particles:       structure
function Particles = pfresample(Particles,mask,centroids)
    W = zeros(1,100)'; 
    for i=1:size(Particles,1)
        W(i) = mask(round(Particles(i,2)),round(Particles(i,1)));
    end
    
    if ~sum(W)
        return;
    end
    
    W=W/sum(W);
    cdf = cumsum(W);
    M = size(Particles,1);
    r_0 = rand / M;
    for m = 1 : M
        i = find(cdf >= r_0,1,'first');
        Particles(m,1) = Particles(i,1);
        Particles(m,2) = Particles(i,2);
        r_0 = r_0 + 1/M;
    end
end