syms s a b m M g L G1 G2 
%A = [0 0 1 0; 0 0 0 1; 0 -m*g/M -a 0; 0 (M+m)*g/(M*L) a/L 0];
%B = [0;0;b;-b/L];
%a = 4; b = 1; M = 1; m = 0.4; g = 9.81; L = 0.25*M;

%% Previously calculated ss values
A = [0 0 1 0; 0 0 0 1; 0 -3.92 -4 0; 0 54.88 16 0];
B = [0 0 1 -4]';
C = [1 0 0 0];

T=[0 0 0 1;0 0 1 0; 0 1 0 0; 1 0 0 0];
A=T*A*inv(T);
B=T*B;
C=C*T;

%% Fullstate Feedback
%R=100
%Q=diag([10000,0,0,0]) 
%G=lqr(A,B,Q,R)%note LQR failed to stabilize due to ctrl ^ weights
%plant=ss(A,B,C,0);
%Bnum=inv(C*inv(Ac)*B)*C*inv(Ac);
%E = [0;0;1;0];
%G0=Bnum*E;


%% Place Poles and Gain
poles = [-10+5j, -10-5j, -20+10j, -20-10j];
k = place(A, B, poles)

G = [G1 G2 0 0];
%G = 1.0e+03*[-1.5944 -0.7686 -0.3867 -0.1107];

Ac = A-B.*G;
Det = inv(s*eye(4)-Ac);
deltaC = det(Det); 
DeltaC = collect(deltaC,s); 
pretty(DeltaC)

%% Test Gain
k2 = place(Ac, B, poles)
%k2 = [0.0122 0.0331 0.0469 0.0367]