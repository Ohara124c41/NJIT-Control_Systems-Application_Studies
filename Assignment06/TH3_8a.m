syms s
%% Previously calculated ss values
A = [-3 1 0; 1 -2 1; 0 1 -3];
B = [1; 0; 0];
C = [0 0 1];
D = 0; 

%% Full-State Feedback
poles = [-10+5j, -10-5j, -15];
G = place(A,B,poles)

E = [0 0; 1 0; -3 1];
Ac = A-B*G;
M = inv(Ac);
N = inv(C*M*B);


G0 = N*C*M*E;
GG = [G G0]
AA = [A E; 0 0 0 0 0; 0 0 0 0 0];
BB = [B; 0; 0];
CC = [C 0 0];

%% Observer and Compensator

poles2 = [-20+10j, -20-10j, -30, -15, 0]
kt=place(AA',CC',poles2)
K=kt'

Ach = AA-BB*GG-K*CC
Rc = inv(s*eye(5)-Ach);
Ds = GG*Rc*K;
Ds = collect(Ds,s);
pretty(Ds)

plant=ss(A,B,C,0)
comp=ss(Ach,K,GG,0)
zc=zero(comp);
pc=pole(comp);

Fwd=comp*plant
H=feedback(Fwd,1)
zero(H);
pole(H);

%% Root Loci
figure(1)
rlocus(Fwd), grid

%% Step Response
figure(2)
step(H),grid
