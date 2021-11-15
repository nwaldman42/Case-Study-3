
V_C = 0;
I = 0;
V_in = 1;

C_1 = 10^-6;
L_1 = .01;
R_1 = 20;

C_2 = 10^-6;
L_2 = .01;
R_2 = 5;

C_3 = 10^-6;
L_3 = .01;
R_3 = 1;


h = 1/192000;

V_time_data_1 = [3000, 2];

for k=1:3000
    A = [1, h/C_1; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_data_1(k, 1) = I*R_1;
    V_time_data_1(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

V_time_data_2 = [3000, 2];
V_C = 0;
I=0;
for k=1:3000
    A = [1, h/C_2; -h/L_2, 1-h*R_2/L_2];
    x_k = [V_C, I]';
    B = [0, h/L_2]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_data_2(k, 1) = I*R_2;
    V_time_data_2(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

V_time_data_const = [3000, 1];

for k=1:3000
    V_time_data_const(k, 1) = V_in;
    V_time_data_const(k, 2) = k*h;
end


V_time_data_3 = [192000, 2];
V_C = 0;
I=0;
for k=1:3000
    A = [1, h/C_3; -h/L_3, 1-h*R_3/L_3];
    x_k = [V_C, I]';
    B = [0, h/L_3]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_data_3(k, 1) = I*R_3;
    V_time_data_3(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

soundsc(V_time_data_3);


figure;
hold on;
plot(V_time_data_const(:, 2),V_time_data_const(:, 1), "LineWidth", 2);
plot(V_time_data_1(:, 2),V_time_data_1(:, 1), "LineWidth", 2);
plot(V_time_data_2(:, 2),V_time_data_2(:, 1), "LineWidth", 2);
plot(V_time_data_3(:, 2),V_time_data_3(:, 1), "LineWidth", 2);
legend("V_in", "FontSize", 14);
title("RLC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
