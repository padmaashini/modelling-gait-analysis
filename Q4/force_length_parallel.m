function [normalize_PE_force] = force_length_parallel(lm)

%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element
arr_size = size(lm); 
% axis = 1 --> row vector
% axis = 0 --> column vector
if arr_size(1) > arr_size(2)
    for i = 1:arr_size(1)
        if lm(i) < 1 
            normalize_PE_force(i, 1) = 0;
        else

            normalize_PE_force(i, 1) = (3*(lm(i, 1)-1)^2)/(0.6+(lm(i, 1)-1));
        end 
    end
else 
    for i = 1:arr_size(2)
        if lm(i) < 1 
            normalize_PE_force(1, i) = 0;
        else

            normalize_PE_force(1, i) = (3*(lm(1, i)-1)^2)/(0.6+(lm(1, i)-1));
        end 
    end 
    
end
end