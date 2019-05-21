syms s G1 G2 G3 
A = [-3 1 0; 1 -2 1; 0 1 -3];
B = [1; 0; 0];
C = [0 0 1];

%% Renumbered Matrices
T = [0 0 1; 0 1 0; 1 0 0];
A = T*A*inv(T);
B = T*B;
C = C*T;
plant = ss(A,B,C,0);

%% Fullstate Feedback
poles = [-20+10j, -20-10j, -30];
G = place(A, B, poles)
Ac = A-B*G;
Bnum = inv(C*inv(Ac)*B)*C*inv(Ac);
E = [-3; 1; 0];
G0 = Bnum*E;
Fwd = ss(A,B,G,0);
circ = tf(-2,[1 1]);
figure(1)
nyquist(Fwd,circ), title('Fullstate Feedback')

%% Full-Order Observer
v=1000;
K = lqe(A,B,C,v,1);
Ach = A-B*G-K*C;
comp = ss(Ach,K,G,0);
Fwd = plant*comp;
figure(2)
nyquist(Fwd,circ), title('Full-Order Observer, v=1000')
