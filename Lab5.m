clc;
clear all;
close all;
pkg load signal;
% Difference equation of a second order system
% y(n) = x(n) + 0.7x(n-1) + 0.5x(n-2)-0.8y(n-2)-0.6y(n-3)

%Input x(n) = [1 0.7 0.5]   y(n) = [1 0 0.8 0.6]
b = input('Enter the co-efficients in sequence x(n), x(n-1).... : ');
a = input('Enter the co-efficients in sequence y(n), y(n-1).... : ');
N = input('Enter the no. of samples of impulse response : ');


%to find the impulse response
X = [1, zeros(1,N-1)];
n = 0: 1: N-1;
h = filter(b, a, X);

disp('Impulse response of filter = [');
disp(h);
disp("]");

subplot(4, 2, 1);
stem(n, X);
title('Impulse input');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(4, 2, 2);
stem(n, h);
title('Impulse response');
xlabel('n');
ylabel('h(n)');
grid on;


%to find the step response
X = [ones(1,N)];
n = 0: 1: N-1;
h = filter(b, a, X);

disp('Step response of filter = [');
disp(h);
disp("]");

subplot(4, 2, 3);
stem(n, X);
title('Step input');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(4, 2, 4);
stem(n, h);
title('Step response');
xlabel('n');
ylabel('h(n)');
grid on;


%to find the exponential response
n = 0: 1: N-1;
X = 2.^n;
h = filter(b, a, X);

disp('Exponential response of filter = [');
disp(h);
disp("]");

subplot(4, 2, 5);
stem(n, X);
title('Exponnetial input');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(4, 2, 6);
stem(n, h);
title('Expontial response');
xlabel('n');
ylabel('h(n)');
grid on;

%to find the steady response
n = 0: 1: N-1;
X = cos(0.5*pi*n);
h = filter(b, a, X);

disp('Steady state response of filter = [');
disp(h);
disp(']');

subplot(4, 2, 7);
stem(n, X);
title('Steady input');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(4, 2, 8);
stem(n, h);
title('Steady response');
xlabel('n');
ylabel('h(n)');
grid on;
