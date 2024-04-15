clc;
close all;
clear all;
pkg load signal;


%Getting the signal
x = input('Enter Amplitude of Input sequence x(n) : ');
l = length(x);
t = 1:l;

subplot(3, 2, 1);
stem(t-1, x);
xlabel('n');
ylabel('x(n)');
title('Input Signal');
dt = zeros(1, l);
idft = zeros(1, l);


%Discrete Fourier Transform
for k = 0:l-1
  for n = 0:l-1
    dt(k+1) = dt(k+1) + exp(i*2*k*n*pi/l)*x(n+1)
  endfor
endfor

subplot(3, 2, 2);
stem(t-1, dt);
ylabel('x(n)');
xlabel('n');
title('DTFT Signal');


%Magnitude of DTFT
m = abs(dt);
subplot(3, 2, 3);
stem(t-1, m);
ylabel('x(n)');
xlabel('n');
title('Magnitude of DTFT Signal');


%Phase of DTFT
ph = angle(dt);
subplot(3, 2, 4);
stem(t-1, ph);
ylabel('Angle(x)');
xlabel('n');
title('Phase Angle of DTFT Signal');


%Inverse Discrete Transform
for k = 0:l-1
  for n = 0: l-1
    idft(k+1) = (idft(k+1) + exp(-1*i*2*k*n*pi/l)*dt(n+1));
  endfor
endfor

idft = idft./l;
subplot(3, 2, 5);
stem(t-1, idft);
ylabel('x(n)');
xlabel('n');
title('Inverse DTFT Signal');

