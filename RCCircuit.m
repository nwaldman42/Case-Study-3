%set constants
R = 1000;
C = 10^-6;
V_C = 0;
V_in = 1;
V_R = 0;

%choose a value for h
h_good = 10^-6;
h_bad = 10^-5;

%create empty matrices to store values in
V_time_data_good = [5000, 3];
V_time_data_bad = [5000, 3];

for k=1:5000
    V_C_f = (1-h_good/(R*C))*V_C+h_good/(R*C)*V_in;
    V_C = V_C_f;
    V_time_data_good(k, 1) = V_in;
    V_time_data_good(k, 2) = V_C;
    V_time_data_good(k, 3) = k*h_good;
end

for k=1:5000
     V_C_f = (1-h_bad/(R*C))*V_C+h/(R*C)*V_in;
     V_C = V_C_f;
     V_time_data_bad(k, 1) = V_in;
     V_time_data_bad(k, 2) = V_C;
     V_time_data_bad(k, 3) = k*h_bad;
end

figure;
hold on;
plot(V_time_data_good(:, 3),V_time_data_good(:, 1), "LineWidth", 2);
plot(V_time_data_good(:, 3), V_time_data_good(:, 2), "LineWidth", 2);
legend("V_i_n", "V_C", "FontSize", 14);
title("RC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;

figure;
hold on;
plot(V_time_data_good(:, 3), V_time_data_good(:, 2), "LineWidth", 2);
plot(V_time_data_bad(:, 3), V_time_data_bad(:, 2), "LineWidth", 2);
xlim([0, 5*10^-3]);
legend("V_C with h_g_o_o_d", "V_C with h_b_a_d", "FontSize", 14);
title("RC Voltage v.s. Time with Differing Time Steps", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;

figure;
hold on;
plot(V_time_data_good(:, 3), V_time_data_good(:, 2), "LineWidth", 2);
fplot(@(t) 1-exp(1)^(-t/(R*C)), "LineWidth", 2);
xlim([0, 5*10^-3]);
legend("V_C from LDS", "V_C from Continuous Function", "FontSize", 14);
title("RC Voltage from LDS and Continuous Function V.S. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;