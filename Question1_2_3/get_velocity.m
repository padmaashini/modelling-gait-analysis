function [root] = get_velocity(a, lm, lt)

% Input Parameters
% a: activation (between 0 and 1)
% lm: normalized length of muscle (contractile element)
%  lt: normalized length of tendon (series elastic element)

% Output
% root: normalized lengthening velocity of muscle (contractile element)

% damping coefficient (see damped model in Millard et al.)
beta = 0.1;

% WRITE CODE HERE TO CALCULATE VELOCITY

%-write equation that relates all force curves togheter, by solving using
%f0 fct from matlab then can return root. from 7A modetn hill type model slide 19
%without one term (which one can't remember, in recording) 

    function y = f(x)
        y= (a*force_length_muscle(lm)*force_velocity_muscle(x)+force_length_parallel(lm)+beta*x)*cos(0)-force_length_tendon(lt);
    end 
fun = @f;
root = fzero(fun, 0);


end






