%% Theta = 180; s = -8,-10
syms s G1 G2;
A = [0 1; -12 -4];
B = [0; 1];
C = [1 0];
D = 0;

%% Place Poles and Gain
poles = [-8, -10];
G = place(A, B, poles)

Ac = A-B*G
[a,b] = ss2tf(Ac, B, C, D)
H = tf(a,b)

%% Root Locus
figure(1)
plot(1,2)
rlocus(H), grid

%% Nyquist
%figure(2)
%plot(1,2)
%nyquist(H), grid

%% Bode
figure(3)
plot(1,2)
margin(H), grid

%% Step
figure(4)
plot(1,2)
step(H), grid