function [x_dot] = dynamics(x, soleus, tibialis)

% Inputs
%  x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
% soleus: soleus muscle (HillTypeModel)
% tibialis: tibialis anterior muscle (HillTypeModel)

% Output
% x_dot: derivative of state vector

soleus_activation = 0.05;
tibialis_activation = 0.4;
ankle_inertia = 90;

lm_soleus = soleus_length(theta);



x_dot = [0 0 0 0]; 
x_dot(1) = x(2);
x_dot(2) = 1;
x_dot(3) = get_velocity(soleus_activation, force_length_muscle(lm_soleus), lt)
x_dot(4)

%WRITE CODE HERE TO IMPLEMENT THE MODEL
end