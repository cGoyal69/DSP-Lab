clc;
close all;
clear all;
pkg load signal;

%To Find Frequency Response of a Given system of a transfer function/Difference Equation
%given eqn y(n) - 1/6y(n-1) - 1/6y(n-2) = x(n)

x = input('Enter Numerator Coefficient : ');
y = input('Enter Denomenator Coefficient : ');
[h, w] = freqz(x, y);
subplot(2, 1, 1);
th = abs(h);
tw = angle(h);
plot(w/pi, th);grid;
xlabel('Normalised Frequency');
ylabel('Decibals');
title('Magnitude Response');
subplot(2, 1, 2);
plot(w/pi, tw);
xlabel('Normalised Frequency');
ylabel('Phase');
title('Phase Pesponse');