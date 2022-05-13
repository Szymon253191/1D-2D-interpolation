close all;
clear;
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

b = 0:2*pi/4096:2*pi;
a = sign(sin(8*b));
subplot(3,1,1)
plot(t,x,'ro',ts,y,'b');
hold on;

plot(b,a,'g');
hold on;
axis ([-0.2 6.5 -1.5 1.5]);
xlabel('sinc');



%oś czasu
x = 0.1:2*pi/64:2*pi;

%f interpolowana
y = sign(sin(8*x))';

x_wezly = 0:2*pi/2048:2*pi;

y_interpolacja = interp1(x,y,x_wezly,'spline');
subplot (3,1,2);
plot(x,y,'ro',x_wezly,y_interpolacja,'b',x_wezly,sign(sin(8*x_wezly)),'g')
axis ([-0.2 6.5 -1.5 1.5]);
xlabel('spline');


y_interpolacja = interp1(x,y,x_wezly,'cubic');
subplot (3,1,3);
plot(x,y,'ro',x_wezly,sign(sin(8*x_wezly)),'g',x_wezly,y_interpolacja,'b')
axis ([-0.2 6.5 -1.5 1.5]);
xlabel('cubic');


