%Experiment 7
%Aim to design and implement of FIR filter to meet given specifications ( using different Window techniques )

clc;
close all;
clear all;
pkg load signal;
fp = input("Enter Pass band Frequency : ");
fs = input("Enter Stop band Frequency : ");
rp = input("Enter Pass band Ripple : ");
rs = input("Enter Stop band Ripple : ");
f = input("Enter Sampling Frequency : ");
window = input("For Rectangle: press 1\nHanning: press 2\nHamming Press: 3\nEnter  : ");
wp = 2*fp/f;
ws = 2*fs/f;

num = -20*log10(sqrt(rp*rs))-13;
den = 14.6*(fs-fp)/f;

n = ceil(num/den);

if(rem(n,2)~=0)
  n1 = n;n=n-1;
else
  n1 = n+1;
endif

if (window == 1)
  y = boxcar(n1);
elseif (window == 2)
  y = hamming(n1)
else
  y = hanning(n1)
endif


%magnitude response H.P.F.
b =fir1(n,wp,'high',y);
[h,w] = freqz(b,1,256);
m = 20*log10(abs(h));
subplot(2,2,1);
plot(w/pi,m);
xlabel('Normalized frequency');
ylabel('gain in dB');
title('Magnitude response(H.P.F.)');
grid on;


%magnitude response L.P.F.
b = fir1(n, ws, 'low', y);
[h, w] = freqz(b, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 2);
plot(w/pi, m);
xlabel('Normalized frequency');
ylabel('gain in dB');
title('Magnitude response(L.P.F.)');
grid on;


%magnitude response B.P.F.
wn = [wp,ws];
b = fir1(n, wn, 'pass', y);
[h, w] = freqz(b, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 3);
plot(w/pi, m);
xlabel('Normalized frequency');
ylabel('gain in dB');
title('Magnitude response(B.P.F.)');
grid on;


%magnitude response B.S.F.
b = fir1(n, wn, 'stop', y);
[h, w] = freqz(b, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 4);
plot(w/pi, m);
xlabel('Normalized frequency');
ylabel('gain in dB');
title('Magnitude response(B.S.F.)');
grid on;


figure(2)


%phase response L.P.F.

b = fir1(n, ws, 'low', y);
[h, w] = freqz(b, 1, 256);
phi = angle(h);
subplot(2, 2, 1);
plot(w/pi, phi);
xlabel('Normalized frequency');
ylabel('gain');
title('Phase response(L.P.F.)');
grid on;

%phase response H.P.F.
b = fir1(n, ws, 'high', y);
[h, w] = freqz(b, 1, 256);
p =angle(h);
subplot(2,2,2);
plot(w/pi,p);
xlabel('Normalized frequency');
ylabel('gain');
title('Phase response(H.P.F.)');
grid on;

%phase response B.P.F.
wn = [wp,ws];
b = fir1(n, wn, 'pass', y);
phi = angle(h);
subplot(2, 2, 3);
plot(w/pi, phi);
xlabel('Normalized frequency');
ylabel('gain');
title('Phase response(B.P.F.)');
grid on;

%phase response B.S.F.
b = fir1(n, wn, 'stop', y);
[h, w] = freqz(b, 1, 256);
phi = angle(h);
subplot(2, 2, 4);
plot(w/pi, phi);
xlabel('Normalized frequency');
ylabel('gain');
title('Phase response(B.S.F.)');
