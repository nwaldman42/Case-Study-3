%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Name: FILL IN HERE*
%
% function mySensorCircuit(Vin,h) receives a time-series voltage sequence
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

function Vout = mySensorCircuit(Vin,h)
%choose values for R, L, and C
R = 6250*pi/9; 
L = 625/(18*pi^2);
C = 10^-6;

%initialize circuit with no current and no voltage difference across
%capacitor
V_C = 0;
I = 0;

%create a blank vector to store data
V_data = [1, length(Vin)];

%run RLC linear dynamical system with chosen values
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