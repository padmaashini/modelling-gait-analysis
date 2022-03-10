function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon

if(lt < 1)
    normalize_tendon_tension = 0;
else
    normalize_tendon_tension = 10* (lt-1) + 240*(lt-1).^2;
end 

% WRITE YOUR CODE HERE

end