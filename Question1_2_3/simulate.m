function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

%%% TASK 1

%-create instance of HillTypeMuscle model 
m1 = HillTypeMuscle(f0M, resting_length_muscle, resting_length_tendon);
m1
% velocityOverTime(T, rending)

%%% TASK 2
    function [velocity] = velocityOverTime (time, nMuscleLength)
        if time < 0.5
            a = 0;
        else 
            a = 1;
        end
        lm = nMuscleLength;
        lt = m1.norm_tendon_length(resting_length_muscle +  resting_length_tendon,lm);
        velocity = get_velocity(a, lm, lt);
    end 
        
%- Nested fct info in another video on teams - nested fct can access all
%params in bigger fct. ODE45 also in that vid. Make a nestd fct here 
%output = get_velocity(...)


%%% TASK 3
% the outputs of ode45 must be named "time" and "norm_lm"
 options = odeset('RelTol',RelTol, 'AbsTol',AbsTol); 
[time,norm_lm] = ode45(@velocityOverTime, [0 2], [1], options); 
norm_lm

%%% TASK 4
% save the estimated forces in a vector called "forces"
forces = m1.get_force(resting_length_muscle + resting_length_tendon ,norm_lm); 
forces

% Do not alter the rest (it should not be needed)
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end