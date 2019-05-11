function [xdot, y] = PEN(x, u)
a = 4;
b = 1;
gol = 12;
xdot1 = x(2);
xdot2 = gol*sin(x(1))-a*x(2)+b*u;
xdot  = [xdot1; xdot2];
y = x(1);
