function [x_dot] = dynamics(x, soleus, tibialis)

% Inputs
%  x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
% soleus: soleus muscle (HillTypeModel)
% tibialis: tibialis anterior muscle (HillTypeModel)

% Output
% x_dot: derivative of state vector
x
% double check f0m stuff is good
max_iso_soleus = 16000;
max_iso_ta = 2000; 
m = 75; 
inert_ankle = 90; 
length_com = 1; 
moment_arm_soleus = 0.05; 
moment_arm_ta = 0.03; 
soleus_activation = 0.05;
tibialis_activation = 0.4;
ankle_inertia = 90;

soleus_len = soleus_length(x(1));
ta_len = tibialis_length(x(1)); 


ankle_torque_soleus = max_iso_soleus * force_length_tendon(soleus.norm_tendon_length(soleus_len, x(3))) *moment_arm_soleus; 
ankle_torque_ta = max_iso_ta * force_length_tendon(tibialis.norm_tendon_length(ta_len, x(4)))



% x_dot = [0 0 0 0]; 
% x_dot(1) = x(2);
% x_dot(2) = 1;
% x_dot(3) = get_velocity(soleus_activation, force_length_muscle(lm_soleus), lt)
% x_dot(4)

%WRITE CODE HERE TO IMPLEMENT THE MODEL
end