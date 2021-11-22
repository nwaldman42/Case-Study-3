load("MarsHelicopter_noisy.mat");

%run mySensorCircuit function
sensed = mySensorCircuit(Vsound,1/Fs);

%plot original sound versus editted sound
figure;
hold on;
plot(Vsound);
plot(sensed);
xlabel("Time");
ylabel("Amplitude");
legend("original", "sensed");
hold off;

%%
%original sound
playSound(Vsound, Fs);
%edited sound
playSound(sensed, Fs);