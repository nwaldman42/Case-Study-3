%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Name: FILL IN HERE*
%
% function myFilterCircuit(Vin,h) receives a time-series voltage sequence
% sampled with interval h, and returns the output voltage sequence produced
% by a circuit
%
% inputs:
% Vin - time-series vector representing the voltage input to a circuit
% h - scalar representing the sampling interval of the time series in
% seconds
%
% outputs:
% Vout - time-series vector representing the output voltage of a circuit

%C_3 is the lowest note in this part of the hallelujah chorus - that's
%about 130 Hz. D_5 is the highest note, that's about 590 Hz. I'm going to
%filter everything out that's in between

function Vout = myFilterCircuit(Vin,h)
R = 4450000/(1711*pi);
L = 5000/(1711*pi^2);
C = 10^-6;
V_C = 0;
V_data = [1, length(Vin)];
I = 0;

for k=1:length(Vin)
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    x_k_f= A*x_k + B*Vin(k, 1);
    V_data(1, k) = I*R;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

Vout = V_data';
end