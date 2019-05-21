syms s a b m M g L G1 G2 
%A = [0 0 1 0; 0 0 0 1; 0 -m*g/M -a 0; 0 (M+m)*g/(M*L) a/L 0];
%B = [0;0;b;-b/L];
%a = 4; b = 1; M = 1; m = 0.4; g = 9.81; L = 0.25*M;

%% Previously calculated ss values
A = [0 0 1 0; 0 0 0 1; 0 -3.92 -4 0; 0 54.88 16 0];
B = [0 0 1 -4]';
C = [1 0 0 0; 0 1 0 0];
D = [0; 0];

Q = diag([10000000 10000000 0 0]); 
R = 1; 
[K,S,e] = lqr(A,B,Q,R);

%% Step Response
sys = ss(A-B*K,B,C,D);
t=0:0.05:5;
step(0.5*sys,t) % Active suspension step response with gain K
grid on