clc;
clear all;
close all;
pkg load signal;
% Difference equation of a second order system
% y(n) = x(n)+0.5x(n-1)+0.85x(n-2)+y(n-1)+y(n-2)
% y(n) = x(n) + 0.7x(n-1) + 0.5x(n-2)-0.8y(n-2)-0.6y(n-3)

b=input('Enter the co-efficients in sequence x(n), x(n-1).... : ');
a=input('Enter the co-efficients in sequence y(n), y(n-1).... : ');
N=input('Enter the no. of samples of impulse response : ');

[h, t]=impz(b, a, N);
disp("Values of H(z) = [");
disp(h);
disp("]");


subplot(2,1,1);
plot(t, h);
title('Impulse Response Continuous');
ylabel('Amplitude');
xlabel('time');
grid on;

subplot(2,1,2);
stem(t, h);
title('Impulse Response Digital');
ylabel('Amplitude');
xlabel('time');
grid on;