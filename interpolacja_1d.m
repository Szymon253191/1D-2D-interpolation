clear;
close all;
clc;

% oś czasu
t = 0.2:0.3:(2*pi);

% funkcja interpolowana
x = sin(1./(t))';

ts = linspace(0.1,(2*pi),100);

% ndgrid replikuje wektory siatki, x1,x2,...,xn aby utworzyć n-pełnowymiarową siatkę
[Ts,T] = ndgrid(ts,t)

dt = 0.3;
y = sinc((Ts - T)/dt)*x;

a = 0:(2*pi)/4096:(2*pi);
b = sin(1./a);

figure(1)
plot(t,x,'go',ts,y,'r');
hold on;

plot(a,b,'b');
hold on;

axis([-0.2 6.5 -1.3 1.3]);
xlabel('x');
ylabel('f(x)');
