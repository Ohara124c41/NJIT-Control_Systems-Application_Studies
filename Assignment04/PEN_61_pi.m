%% Theta = 0; s = -6+/-4j, ref_theta = 0.5
syms s G1 G2;
ref_theta = 0.5;
A = [0 1; -12 -4];
B = [0; 1];
C = [1 0];
D = 0;

%% Place Poles and Gain
poles = [-6+4*j, -6-4*j];
P = place(A, B, poles);

Ac0 = A-B*P;
Det0 = inv(s*eye(2)-Ac0);
deltaC0 = det(Det0);
DeltaC0 = collect(deltaC0, s);
pretty(DeltaC0)

%% Exo
G = [G1 G2];

Ac = A-B*G;
Det = inv(s*eye(2)-Ac);
deltaC = det(Det);
DeltaC = collect(deltaC, s);
pretty(DeltaC)

%% Equating Values
G2 = [8 40]; %Analytical Compared

Ac2 = A-B*G2;
Det2 = inv(s*eye(2)-Ac2);
deltaC2 = det(Det2);
DeltaC2 = collect(deltaC2, s);
pretty(DeltaC2)

%% Control Theory Version
%G0 = inv((C*inv(A)*B))*C;
%G0 = 12
%Ac2 = A-B*G0;

%Det2 = inv(s*eye(2)-Ac2);
%deltaC2 = det(Det2);
%DeltaC2 = collect(deltaC2, s);
%pretty(DeltaC2)
%Ac2 = A-B*P

%% Transfer Function
[a,b] = ss2tf(Ac2, B, C, D);
H = tf(a,b); % Get Denominator for sisotool

%% Simulation
stateSpace = ss(Ac2, B, C, D);
t = 0:0.05:100;
u = ref_theta*ones(size(t));
figure(1)

lsim(stateSpace,u,t)
axis([0 10 0 .1])

%% Root Locus
figure(2)
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

%% Stable Gain Range
%s=tf('s');
%Gp= 1/(s^2 + 44*s + 20);
%sisotool(Gp)
%Stable
