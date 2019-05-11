A = [-3 1 0;1 -2 1;0 1 -3];
B = [1 0 0;0 0 0;0 1 0;];
C = [0 0 1; 0 0 0; 0 0 0];
D = [0 0 0; 0 0 0; 0 0 0];
S = sI-A;
norm = 1/((s + 2)*(s + 3)^2);
AA = [s+3 1 0; -1 s+2 1; 0 1 s+3];
inv_s = norm*AA;
Gs = C.*inv_s.*B
sys = ss(A,B,C,D)
TF=tf(ss(A,B,C,D))

