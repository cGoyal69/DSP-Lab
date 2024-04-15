clc;
close all;
clear all;
pkg load control;

x = input('Enter Numerator Coefficient : ');
y = input('Enter Denomenator Coefficient : ');
s = tf(x, y);%creates transfer Function

figure;
pzmap(s);
p = findobj('Type', 'line', 'Marker', 'x');
z= findobj('Type', 'line', 'Marker', 'o');
set(p, 'MarkerSize', 30);
set(z, 'MarkerSize', 30);
title('Poles and Zeros Plots');
