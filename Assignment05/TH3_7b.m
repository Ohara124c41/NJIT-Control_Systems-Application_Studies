%% Previously calculated ss values
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
poles = [-10+5j, -10-5j, -15];
G = place(A, B, poles)
Ac = A-B*G;
Bnum = inv(C*inv(Ac)*B)*C*inv(Ac);
E = [-3; 1; 0];
G0 = Bnum*E;
Fwd = ss(A,B,G,0);
circ = tf(-2,[1 1]);
figure(1)
nyquist(Fwd,circ),title('Fullstate Feedback')
