syms s;
sI = [s 0; 0 s];
A = [0 1; 0 -4];
B = [0 0;1 0];
C = [1 0;0 0];
D = [0 0;0 0];
S = sI-A;
inv_s = [((s+4)/(s^2+4*s+1)) 1/(s^2+4*s+1); 0 s/(s^2+4*s+1)];
sys = ss(A,B,C,D)
Gs = C*inv_s*B
%pretty(Gs);
%step(sys)

