function [xdot, y] = DCS(x, u)
a = 4;
b = 1;
xdot1 = x(2);
xdot2 = -a*x(2)+u;
xdot  = [xdot1; xdot2];
y = x(1);