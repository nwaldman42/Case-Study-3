%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Names: Noah Waldman, Zach Hoffman, and Will Liegey*
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

Vin_length = size(Vin, 1);  % stores length of Vin to be used to set length
                            % of Vout.

R = 14.4;           % tuned R for 440 hz
L = .361716*10^0;   % tuned L for 440 hz 
C = .361716*10^-6;  % tuned C for 440 hz
V_C = 0;            % initial capacitance voltage 
I=0;                % initial current


% Storage matrix. 1st column = Vout values, 2nd column = time values, 3rd
% column = Vin values.
V_time_data = [Vin_length, 3];   

% Iterates through the desired number of seconds set above. Stores Vout, 
% time, and Vin in 1st, 2nd, and 3rd columns of |V_time_data|, respectively.
% Uses same matrix multiplication as RLCCircuit.
for k=1:Vin_length
    A = [1, h/C; -h/L, 1-h*R/L];
    x_k = [V_C, I]';
    B = [0, h/L]';
    
    % Sets u_k equal to kth element of Vin if k is in the range of Vin.
    u_k = Vin(k, 1);
    
    x_k_f= A*x_k + B*u_k;
    V_time_data(k, 1) = I*R;
    V_time_data(k, 2) = k*h;
    V_time_data(k, 3) = u_k;
    V_C = x_k_f(1, 1);
    I = x_k_f(2, 1);
end

% Sets Vout equal to Vout column of |V_time_data|.
Vout = V_time_data(:, 1);

end




