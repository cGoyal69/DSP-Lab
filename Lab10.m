%Experiment 10                                               Date: 26 March 2024
%Cheby-shev
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


[n, wp] = cheb1ord(wp, ws, rp, rs);

[b, a] = cheby1(n, rp, wp);
disp("Numerator Coeff : ");b
disp("Denomenator Coeff : ");a
[y, t] = impz(b, a, 60);

figure(1);
subplot(1, 1, 1);
stem(t, y);
xlabel('Time -->');
ylabel('Ampltude -->');
title('Impulse Response Cheby-shev)');
grid on;

figure(2);
%L.P.F.
[b, a] = cheby1(n, rp, wp, 'low');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse Low Pass Filter");
grid on;

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse Low Pass Filter");
grid on;


figure(3);
%H.P.F.
[b, a] = cheby1(n, rp, wp, 'high');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse High Pass Filter");
grid on;

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse High Pass Filter");
grid on;


figure(4);
%B.P.F.
wp = [wp, ws];
[b, a] = cheby1(n, rp, wp, 'pass');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse Band Pass Filter");
grid on;

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse Band Pass Filter.");
grid on;


figure(5);
%B.S.F.
[b, a] = cheby1(n, rp, wp, 'stop');
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log(abs(h));
an = angle(h);
subplot(2, 1, 1);
plot(om/pi, m);
xlabel("Normalised Frequency--->");
ylabel('gain in dB--->');
title("Magnitude Reposnse Band Stop Filter");
grid on;

subplot(2, 1, 2);
plot(om/pi, an);
xlabel("Normalised Angle--->");
ylabel('gain in dB--->');
title("Angular Reposnse Band Stop Filter");
grid on;

