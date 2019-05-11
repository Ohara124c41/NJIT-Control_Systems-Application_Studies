%% Control Law
% U(s) = -(Gp+Gi/s)*(Y(s)-Yr(s))

A = [-3 1 0;1 -2 1;0 1 -3];
B = [1; 0; 0];
C = [0 0 1];
D = 0;
eig(A)

H = ss(A,B,C,D)
tf(H)
%Gm = margin(H)

%% Stable Gain Range
s=tf('s')
Gp= 1/(s^3 + 8*s^2 + 19*s + 12)
sisotool(Gp)
% Stability Analysis from Root Locus:
% Scanning the imag axis when the real axis is 0 and -8, values between 0 and 140 are stable
