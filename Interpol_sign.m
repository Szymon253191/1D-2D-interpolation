clear;
close all;
clc;

%oś czasu
t = 0.1:2*pi/64:2*pi;

%f interpolowana
x = sign(sin(8*t))';

ts = linspace(0,(2*pi), 2048);

%ndgrid replikuje wektory siatki x1,x2,...,xn aby utworzyć pełnowymiarową
%siatkę
[Ts,T] = ndgrid(ts,t);

st = 2*pi/64;
y = sinc((Ts - T)/st)*x;

b = 0:2*pi/3096:2*pi;
a = sign(sin(8*b));

plot(t,x,'go',ts,y,'r');
hold on;

plot(b,a,'b');
hold on;
axis ([-0.2 6.5 -1.5 1.5]);
xlabel('x');
ylabel('f(x)');
