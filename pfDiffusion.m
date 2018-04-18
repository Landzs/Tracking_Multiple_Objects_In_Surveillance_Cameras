% function Particles = pfPredict(Particles)
% This function performs particle diffusion
% Inputs:   
%           Particles:         structure
%           mask:              array
% Outputs:
%           Particles:         structure          
function  Particles = pfDiffusion(Particles,mask)
    Particles= Particles +  randn(size(Particles,1) ,2)*4; 
    for i = 1: size(Particles,1)
        if(Particles(i,1)>size(mask,2)-1)
             Particles(i,1) = size(mask,2);
        end
        
        if(Particles(i,2)>size(mask,1)-1)
             Particles(i,2) = size(mask,1);
        end

        if(Particles(i,1)<1)
             Particles(i,1) = 1;
        end
         
        if(Particles(i,2)<1)
             Particles(i,2) = 1;
        end
    end
             
end