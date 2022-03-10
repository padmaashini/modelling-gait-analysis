function [normalize_PE_force] = force_length_parallel(lm)
%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element
if(lm < 1)
    normalize_PE_force = 0;
else
    
    normalize_PE_force = (3* (lm-1).^2)/(0.6+(lm-1));
end 

% WRITE YOUR CODE HERE

end