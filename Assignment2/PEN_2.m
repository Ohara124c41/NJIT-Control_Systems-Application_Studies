%syms theta
theta_1 = 0;
%theta_1 = pi;
A = [1 0; -4 12*sin(theta_1)];
B = [0 0; 1 0];
C = [1 0; 0 0];
D = [0 0; 0 0];
S = sI-A;
norm = 1/(12*sin(theta_1));
AA = [12*sin(theta_1) 0; 4 1];
inv_s = norm*AA;
%Gs2 = C.*inv(S).*B %for checking
sys = ss(A,B,C,D)
Gs = C.*inv_s.*B
TF=tf(ss(A,B,C,D))
