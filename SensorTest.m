
mySensorCircuit(Vsound,1/Fs);
sensed = ans';

figure;
hold on;
plot(Vsound);
plot(sensed);
legend("original", "sensed");
hold off;