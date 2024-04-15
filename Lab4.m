clc;
close all;
clear all;
pkg load signal;
pkg load control;
# To obtain Linear Convulation of two finite length sequences

x = input('Enter Sequence 1: ');
y = input('Enter Sequence 2: ');
lx = length(x);
ly = length(y);
t = 1: lx + ly -1;
xt = 1: lx;
yt = 1: ly;
a = conv(x, y);


at = zeros(1, lx+ly-1);
for i = 1:(lx+ly-1)
  at(i) = 0;
  for k = 1:min(lx, ly)
    if ((i - k) >= 1) && ((i - k) < min(lx, ly))
      at(i) = at(i) + x(k).*y(i-k+1); 
    endif;
  endfor;
endfor;


subplot(3, 1, 1);
stem(xt, x);
xlabel("time");
ylabel("N");
title("Sequence 1");

subplot(3, 1, 2);
stem(yt, y);
xlabel("time");
ylabel("N");
title("Sequence 2");

subplot(3, 1, 3);
stem(t, a);
xlabel("time");
ylabel("N");
title("Convulated Output");