clc;
clear all;
close all;
pkg load signal;

N=input('Enter the order of the filter N : ');

alpha=(N-1)/2;
Hrk=[ones(1,2),zeros(1,4),ones(1,1)];
k1=0:(N-1)/2;
k2=(N+1)/2:N-1;
theetak=[(-alpha*(2*pi)/N)*k1,(alpha*(2*pi)/N)*(N-k2)];
Hk=Hrk.*(exp(i*theetak));
w=0:0.01:pi;
hn=real(ifft(Hk,N))
H=freqz(hn,1,w);
plot(w/pi,20*log10(abs(H)));
ylabel('magnitude in db');
xlabel('normalised frequency');
