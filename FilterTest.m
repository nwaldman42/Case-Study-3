load("noisyhandel.mat");
%run function on data
filterHandel = myFilterCircuit(Vsound, 1/Fs);
%%
%plot the filtered sound against the original sound
figure;
hold on;
plot(Vsound);
plot(filterHandel);
legend("original", "filtered");
ylabel("Amplitude");
xlabel("Time");
hold off;
%%
%with filter
playSound(filterHandel, Fs);
%%
%without filter
playSound(Vsound, Fs);