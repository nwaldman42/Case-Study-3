R = 100; %resistance of 100 ohms
L = .1; % inductance of .1 farads
I_i = 0; %initial current of 0 amps
V_in = 1; %iniital voltage of 1 volt
h = 10^-6; %choice of h value

%blank matrix to store data in
V_time_data = [5000, 3];

%iterate the linear dynamical system for 5000 time steps
for k=1:5000
    %equation for current across inductor after 1 additional time step
    I_f = (1-h*R/L)*I_i + h*V_in/L;
    
    %apply kirchoff's loop rule to get voltage across inductor
    V_L = V_in - I_f*R;
    
    %store data in the matrix
    V_time_data(k, 1)= V_in;
    V_time_data(k, 2)= V_L;
    V_time_data(k, 3) = k*h;
    
    %change the prior current to the new current after 1 additional
    %timestep
    I_i = I_f;
end


%plot voltage versus time
figure;
hold on;
plot(V_time_data(:, 3),V_time_data(:, 1), "LineWidth", 2);
plot(V_time_data(:, 3), V_time_data(:, 2), "LineWidth", 2);
legend("V_i_n", "V_L", "FontSize", 14);
title("RL Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
