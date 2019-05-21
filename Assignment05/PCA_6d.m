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
plant = ss(A,B,C,0);


poles = [-10.1, -10.1, -15, -15.1]; 
%G = place(A, B, poles)
G = 1.0e+03 *[-6.4032   -2.2650   -1.0265   -0.2756];

Ac = A-B*G;
Bnum = inv(C*inv(Ac)*B)*C*inv(Ac);
E = [0; 0; 0; 1];
G0 = Bnum*E;
Fwd = ss(A,B,G,0);
circ = tf(-2,[1 1]);
figure(1)
nyquist(Fwd,circ), title('Fullstate Feedback')

%% Full-Order Observer
v=100000;
K = lqe(A,B,C,v,1);
Ach = A-B*G-K*C;
comp = ss(Ach,K,G,0);
Fwd = plant*comp;
figure(2)
nyquist(Fwd,circ), title('Full-Order Observer, v=100000')