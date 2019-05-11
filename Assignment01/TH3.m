function [xdot, y] = TH3(x, x0, u)
xdot1 = -3*x(1) +   x(2) + u;
xdot2 =    x(1) - 2*x(2) - x(3);
xdot3 =    x(2) - 3*x(3) + x0;
xdot  =   [xdot1 ; xdot2 ; xdot3];
y     =    x(3);
