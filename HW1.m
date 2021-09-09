%% HW 1
Fs = 22050;
L = length(x);
Y = fft(x);
P2 = abs(Y/L);
Xf = P2(1:L/2+1);
Xf(2:end-1) = 2*Xf(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,Xf) 
xlabel('Frequency (Hz)')
ylabel('X(f)')
xlim([0 2000])
%% Return Peak Values
sortPeaks = sort(Xf,'descend');
findPeaks = find(Xf >= sortPeaks(5));
findFreq = f(findPeaks);
disp(['Frequency of signal: ' num2str(findFreq)])
disp(['Amplitude of signal: ' num2str(sortPeaks(1:5))])
%% Compute Phase
PHI = phase(Y);
PHI(PHI<180) = 0;
P3 = abs(PHI/L);
phi = P3(1:L/2+1);
phi(2:end-1) = 2*phi(2:end-1);
plot(f,phi,'o')
%% Signal Manipulation
t = linspace(0,length(x)/Fs,length(x));
x200 = x(1:400);
