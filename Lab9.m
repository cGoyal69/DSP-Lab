%Experiment 9
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
wp = 2*fp/f;
ws = 2*fs/f;


[n, wc] = buttord(wp, ws, rp, rs);
[b, a] = butter(n, wc);
disp("Numerator Coeff : ");b
disp("Denomenator Coeff : ");a
[y, t] = impz(b, a, 60);

figure(1);
subplot(1, 1, 1);
stem(t, y);
xlabel('Time -->');
ylabel('Ampltude -->');
title('Impulse Response Butter Worth(L.P.F.)');
grid on;

figure(2);
%L.P.F.
[b, a] = butter(n, wc, 'low');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse L.P.F.");

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse L.P.F.");


figure(3);
%H.P.F.
[b, a] = butter(n, wc, 'high');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse H.P.F.");

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse H.P.F.");


figure(4);
%B.P.F.
wc = [wp, ws];
[b, a] = butter(n, wc, 'pass');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse B.P.F.");

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse B.P.F.");


figure(5);
%B.S.F.
[b, a] = butter(n, wc, 'stop');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse B.S.F.");

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse B.S.F.");

