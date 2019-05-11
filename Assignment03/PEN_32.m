A = [0 1;12 -4];
B = [0;1];
C = [1 0];
D = 0;
eig(A)

H = ss(A,B,C,D)
tf(H)
Gm = margin(H)


%% Root Locus
figure(1)
plot(1,2)
rlocus(H), grid

%% Nyquist
figure(2)
plot(1,2)
nyquist(H), grid

%% Bode
figure(3)
plot(1,2)
margin(H), grid

%% Step
figure(4)
plot(1,2)
step(H), grid

%% Stable Gain Range
s=tf('s')
Gp= 1/(s^2+4*s-12)
sisotool(Gp)
% Stability Analysis from Root Locus:
% Scanning the real axis, the gain is stable between values of 12 and 16
% Scanning the imag axis when the real axis is at -2, all values are stable