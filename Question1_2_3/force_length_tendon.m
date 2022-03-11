function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon
arr_size = size(lt);

arr_size
% % axis = 1 --> row vector
% % axis = 0 --> column vector
if arr_size(1) > arr_size(2)
    for i = 1:arr_size(1)
        if lt(i) < 1 
            normalize_tendon_tension(i, 1) = 0;
        else

            normalize_tendon_tension(i, 1) = 10* (lt(i, 1)-1) + 240*(lt(i, 1)-1)^2;
        end 
    end
else 
    for i = 1:arr_size(2)
        if lt(i) < 1 
            normalize_tendon_tension(1, i) = 0;
        else

            normalize_tendon_tension(1, i) = 10* (lt(1, i)-1) + 240*(lt(1, i)-1)^2;
        end 
    end 
    
end

% for i = 1:arr_size(2)
%     i
%     if lt(i) < 1 
%         normalize_tendon_tension(1, i) = 0;
%     else
% 
%         normalize_tendon_tension(1, i) = 10* (lt(1, i)-1) + 240*(lt(1, i)-1)^2;
%     end 
% end
% normalize_tendon_tension


end