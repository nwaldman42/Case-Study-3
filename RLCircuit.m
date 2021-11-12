R = 100;
L = .1;
I_i = 0;
V_in = 1;

h = 10^-6;

V_time_data = [5000, 3];


for k=1:5000
    I_f = (1-h*R/L)*I_i + h*V_in/L;
    V_L = V_in - I_f*R;
    V_time_data(k, 1)= V_in;
    V_time_data(k, 2)= V_L;
    V_time_data(k, 3) = k*h;
    I_i = I_f;
end

figure;
hold on;
plot(V_time_data(:, 3),V_time_data(:, 1), "LineWidth", 2);
plot(V_time_data(:, 3), V_time_data(:, 2), "LineWidth", 2);
legend("V_i_n", "V_L", "FontSize", 14);
title("RL Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
