%%
%Function testing

steps = 192000;
h = 1/steps;
f = 440;            % frequency tuned to

% multiply = 5;
% 
% Vin = zeros(steps*f*multiply*h, 1);
% for k = 1:steps*f*multiply*h
%     Vin(k, 1) = sin(2*pi*k*h*f);
% end

Vin = ones(1, 1);
Vin = Vin*10^-100
Vout = myResonatorCircuit(Vin, h);



%%
playSound(Vin(:, 1), steps);
pause(1);
%playSound(Vout(:, 1), steps);
%pause(1);
soundsc(Vout(:, 1), steps);


V_time_data = zeros(size(Vout, 1), 1);
for k=1:size(Vout, 1)
    V_time_data(k, 1) = k*h;
end

figure();
hold on;
plot(V_time_data(:, 1),Vout(:, 1), "LineWidth", 2);
plot(V_time_data([1:steps*multiply*f*h], 1),Vin(:, 1), "LineWidth", 2);
hold off;
legend("out", "in");

%x = size(Vin, 1)
