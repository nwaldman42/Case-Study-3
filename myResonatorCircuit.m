%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Name: FILL IN HERE*
%
% function myResonatorCircuit(Vin,h) receives a time-series voltage sequence
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

function Vout = myResonatorCircuit(Vin,h)

Vin_length = size(Vin, 1);
Vout_seconds = 2;

R = 2.5;
L = .361716*10^-1;  % tuned L for 440 hz 
C = .361716*10^-5;  % tuned C for 440 hz
V_C = 0;
I=0;

V_time_data = [Vout_seconds/h, 3];

for k=1:Vout_seconds/h        % to generate the data, will be 1:(1/h)*5
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    
    if k<=Vin_length
        u_k = Vin(k, 1);
    else
        u_k = 0;
    end
    
    x_k_f= A*x_k + B*u_k;
    V_time_data(k, 1) = I*R;
    V_time_data(k, 2) = k*h;
    V_time_data(k, 3) = u_k;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

Vout = V_time_data(:, 1);

% Vout = Vin;
end




