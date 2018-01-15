% function Particles = pfPredict(Particles)
% This function performs particle weighting
% Inputs:   
%           Particles:         structure
% Outputs:
%           Particles:       structure
function  Particles = pfPredict(Particles,mask)
    Particles= Particles +  randn(size(Particles,1) ,2)*3; 
    for i = 1: size(Particles,1)
         if(Particles(i,1)>size(mask,2))
             Particles(i,1) = size(mask,2);
         end
        if(Particles(i,2)>size(mask,1))
             Particles(i,2) = size(mask,1);
        end

        if(Particles(i,1)<0)
             Particles(i,1) = 0;
        end
         
        if(Particles(i,2)<0)
             Particles(i,2) = 0;
         end
    end
             
end