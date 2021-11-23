V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt

%set values for capacitors, inductors, and resistors
C_1 = 10^-6;
L_1 = .01;
R_1 = 20;

C_2 = 10^-6;
L_2 = .01;
R_2 = 5;

C_3 = 10^-6;
L_3 = .01;
R_3 = .5;

h = 1/192000; %assign value for h to be 1/192000

%make blank matrices to store voltage data with different values of R, C, and L,
%then simulate the Linear Dynamical Systems and store the data in the
%matrices.
V_time_data_1 = [192000, 2];

for k=1:192000
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

V_time_data_2 = [192000, 2];
V_C = 0;
I=0;
for k=1:192000
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

V_time_data_const = [192000, 1];

for k=1:192000
    V_time_data_const(k, 1) = V_in;
    V_time_data_const(k, 2) = k*h;
end


V_time_data_3 = [192000, 2];
V_C = 0;
I=0;
for k=1:192000
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
%%
%plot the differing voltage repsonses
figure;
hold on;
plot(V_time_data_const(:, 2),V_time_data_const(:, 1), "LineWidth", 2);
plot(V_time_data_1(:, 2),V_time_data_1(:, 1), "LineWidth", 2);
plot(V_time_data_2(:, 2),V_time_data_2(:, 1), "LineWidth", 2);
plot(V_time_data_3(:, 2),V_time_data_3(:, 1), "LineWidth", 2);
xlim([0, 3/192])
legend("V_in", "R=20", "R=5", "R=.5", "FontSize", 14);
title("RLC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
%%
%orange wave sound
soundsc(V_time_data_1(:, 1), 192000);
pause(1);
%%
%yellow wave sound
soundsc(V_time_data_2(:, 1), 192000);
pause(1);
%%
%purple wave sound
soundsc(V_time_data_3(:, 1), 192000);
%%
%sinusoidal response

%assign values to each component and initial values.
R = 100;
L = .1;
C = .1*10^-6;
f = 10000; %choose various f from 10 to 10000
V_C = 0;
I=0;
h=1/192000;
%create blank matrices to store data and run the linear dynamical system
%with differing values of f
V_time_dataf1 = [192000, 3];

for k=1:192000
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    u_k = sin(2*pi*k*h*f);
    x_k_f= A*x_k + B*u_k;
    V_time_dataf1(k, 1) = I*R;
    V_time_dataf1(k, 2) = k*h;
    V_time_dataf1(k, 3) = sin(2*pi*k*h*f);
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

V_C = 0;
V_time_dataf2 = [192000, 3];
f= 10;
for k=1:192000
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    u_k = sin(2*pi*k*h*f);
    x_k_f= A*x_k + B*u_k;
    V_time_dataf2(k, 1) = I*R;
    V_time_dataf2(k, 2) = k*h;
    V_time_dataf2(k, 3) = sin(2*pi*k*h*f);
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

V_C = 0;
V_time_dataf3 = [192000, 3];
f= 5000;
for k=1:192000
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    u_k = sin(2*pi*k*h*f);
    x_k_f= A*x_k + B*u_k;
    V_time_dataf3(k, 1) = I*R;
    V_time_dataf3(k, 2) = k*h;
    V_time_dataf3(k, 3) = sin(2*pi*k*h*f);
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

%%
%plot the voltage versus time when f = 10000
figure;
hold on;
title("Voltage versus time - f=10000");
plot(V_time_dataf1(:, 2),V_time_dataf1(:, 3), "LineWidth", 2);
plot(V_time_dataf1(:, 2),V_time_dataf1(:, 1), "LineWidth", 2);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
legend("V_i_n", "V_o_u_t");
hold off;
%%
%plot the voltage versus time when f = 10
figure;
hold on;
title("Voltage versus time - f=10");
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
plot(V_time_dataf2(:, 2),V_time_dataf2(:, 3), "LineWidth", 2);
plot(V_time_dataf2(:, 2),V_time_dataf2(:, 1), "LineWidth", 2);
legend("V_i_n", "V_o_u_t");
hold off;
%%
%plot the voltage versus time when f = 5000
figure;
hold on;
title("Voltage versus time - f=5000");
plot(V_time_dataf1(:, 2),V_time_dataf3(:, 3), "LineWidth", 2);
plot(V_time_dataf1(:, 2),V_time_dataf3(:, 1), "LineWidth", 2);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
legend("V_i_n", "V_o_u_t");
hold off;

%%
%play sounds
playSound(V_time_dataf1(:, 1), 192000);
playSound(V_time_dataf2(:, 1), 192000);
%%
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt
C = 10^-6;
L_1 = .01;
R_1 = 10;

h = 1/192000; %assign value for h to be 1/192000

%make blank matrices to store voltage data with different values of R, C, and L,
%then simulate the Linear Dynamical Systems and store the data in the
%matrices.
V_time_dataC1 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataC1(k, 1) = I*R_1;
    V_time_dataC1(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

C = 10^-4;
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt

V_time_dataC2 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataC2(k, 1) = I*R_1;
    V_time_dataC2(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

C = 10^-2;
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt

V_time_dataC3 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataC3(k, 1) = I*R_1;
    V_time_dataC3(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

figure;
hold on;
plot(V_time_dataC1(:, 2),V_time_dataC1(:, 1), "LineWidth", 2);
plot(V_time_dataC2(:, 2),V_time_dataC2(:, 1), "LineWidth", 2);
plot(V_time_dataC3(:, 2),V_time_dataC3(:, 1), "LineWidth", 2);
xlim([0, 3/192])
legend( "C=10^-^6", "C=10^-^4", "C=10^-^2", "FontSize", 14);
title("RLC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;
%%
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt
C = 10^-6;
L_1 = .001;
R_1 = 10;

h = 1/192000; %assign value for h to be 1/192000

%make blank matrices to store voltage data with different values of R, C, and L,
%then simulate the Linear Dynamical Systems and store the data in the
%matrices.
V_time_dataL1 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataL1(k, 1) = I*R_1;
    V_time_dataL1(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

L_1 = .01;
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt

V_time_dataL2 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataL2(k, 1) = I*R_1;
    V_time_dataL2(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

L_1 = .1;
V_C = 0; %initial voltage across capacitor is 0
I = 0; %initial current is 0
V_in = 1; %voltage in is 1 volt

V_time_dataL3 = [192000, 2];

for k=1:192000
    A = [1, h/C; -h/L_1, 1-h*R_1/L_1];
    x_k = [V_C, I]';
    B = [0, h/L_1]';
    u_k = V_in;
    x_k_f= A*x_k + B*u_k;
    V_time_dataL3(k, 1) = I*R_1;
    V_time_dataL3(k, 2) = k*h;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

figure;
hold on;
plot(V_time_dataL1(:, 2),V_time_dataL1(:, 1), "LineWidth", 2);
plot(V_time_dataL2(:, 2),V_time_dataL2(:, 1), "LineWidth", 2);
plot(V_time_dataL3(:, 2),V_time_dataL3(:, 1), "LineWidth", 2);
xlim([0, 3/192])
legend("L=.001", "L=.01", "L=.1", "FontSize", 14);
title("RLC Voltage v.s. Time", "FontSize", 14);
xlabel("time (s)", "FontSize", 14);
ylabel("voltage (V)", "FontSize", 14);
hold off;