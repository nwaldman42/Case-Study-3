V_C = 0;
I = 0;
V_in = 1;
C = .1*10^-6;
L = .1;
R = 100;


h = 1/192000;

V_time_data = [192000, 2];

for k=1:2500
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_data(k, 1) = I*R;
    V_time_data(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

figure;
hold on;
plot(V_time_data(:, 2),V_time_data(:, 1), "LineWidth", 2);
legend("V_R", "FontSize", 14);
title("RLC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
