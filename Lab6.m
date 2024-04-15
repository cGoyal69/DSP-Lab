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

num = -20*(log10(sqrt(rp*rs)) - 13);
den = 14.6*(fs - fp)/f;
n = ceil(num/den);
n1 = n + 1;
if (rem(n, 2) != 0)
  n1 = n; n = n-1;
endif

y = boxcar(n1);

%Low Pass Filter
b = fir1(n, wp, 'low', y);
[h, o] = freqz(b, 1, 256);
m = 20*log10(abs(h));
subplot(2, 2, 1);
plot(o/pi, m);
xlabel('normalized frequency ->');
ylabel('gain in db');
title("Low Pass Filter")
grid on;


%High Pass Filter
b = fir1(n, wp, 'high', y);
[h, o] = freqz(b, 1, 256);
m = 20*log10(abs(h));
subplot(2, 2, 2);
plot(o/pi, m);
xlabel('normalized frequency ->');
ylabel('gain in db');
title("High Pass Filter")
grid on;

%Band Pass Filter
wn = [wp, ws];
b = fir1(n, wn, y);
[h, o] = freqz(b, 1, 256);
m = 20*log10(abs(h));
subplot(2, 2, 3);
plot(o/pi, m);
xlabel('normalized frequency ->');
ylabel('gain in db');
title("Band Pass Filter")
grid on;

%Band Stop Filter
b = fir1(n, wn, 'stop',  y);
[h, o] = freqz(b, 1, 256);
m = 20*log10(abs(h));
subplot(2, 2, 4);
plot(o/pi, m);
xlabel('normalized frequency ->');
ylabel('gain in db');
title("Band Stop Filter")
grid on;

figure(2);

%Low Pass Filter
b = fir1(n, wp, 'low', y);
[h, o] = freqz(b, 1, 256);
m = angle(h);
subplot(2, 2, 1);
plot(o/pi, m);
xlabel('Phase ->');
ylabel('gain in db');
title("Low Pass Filter")
grid on;


%High Pass Filter
b = fir1(n, wp, 'high', y);
[h, o] = freqz(b, 1, 256);
m = angle(h);
subplot(2, 2, 2);
plot(o/pi, m);
xlabel('Phase ->');
ylabel('gain in db');
title("High Pass Filter")
grid on;

%Band Pass Filter
wn = [wp, ws];
b = fir1(n, wn, y);
[h, o] = freqz(b, 1, 256);
m = angle(h);
subplot(2, 2, 3);
plot(o/pi, m);
xlabel('Phase ->');
ylabel('gain in db');
title("Band Pass Filter")
grid on;

%Band Stop Filter
b = fir1(n, wn, 'stop',  y);
[h, o] = freqz(b, 1, 256);
m = angle(h);
subplot(2, 2, 4);
plot(o/pi, m);
xlabel('Phase ->');
ylabel('gain in db');
title("Band Stop Filter")
grid on;

