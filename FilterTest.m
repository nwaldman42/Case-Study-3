filterHandel = myFilterCircuit(Vsound, 1/Fs);
filterHandel = filterHandel';
%%
figure;
hold on;
plot(Vsound);
plot(filterHandel);
legend("original", "filtered");
hold off;
%%
%with filter
playSound(filterHandel, Fs);
%%
%without filter
playSound(Vsound, Fs);
%%
%plot of things taken out by filter
err = Vsound - filterHandel;
plot(err);
%%
%sounds taken out by filter
playSound(err, Fs);