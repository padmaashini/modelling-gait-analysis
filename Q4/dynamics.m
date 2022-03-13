function [x_dot] = dynamics(x, soleus, tibialis)

% Inputs
%  x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
% soleus: soleus muscle (HillTypeModel)
% tibialis: tibialis anterior muscle (HillTypeModel)

% Output
% x_dot: derivative of state vector
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
ankle_torque_ta = max_iso_ta * force_length_tendon(tibialis.norm_tendon_length(ta_len, x(4)))*moment_arm_ta; 
x_dot_numerator = ankle_torque_soleus - ankle_torque_ta - m*9.81*length_com*cos(x(1)); 


x_dot(1, 1) = x(2); 
x_dot(2, 1) = x_dot_numerator/inert_ankle; 
x_dot(3, 1) = get_velocity(soleus_activation, x(3), soleus.norm_tendon_length(soleus_len, x(3)));
x_dot(4, 1) = get_velocity(tibialis_activation, x(4), tibialis.norm_tendon_length(ta_len, x(4))); 
x_dot

% x_dot(3) = get_velocity(soleus_activation, force_length_muscle(lm_soleus), lt)
% x_dot(4)

%WRITE CODE HERE TO IMPLEMENT THE MODEL
end