syms s a b m M g L G1 G2
%A = [0 0 1 0; 0 0 0 1; 0 -m*g/M -a 0; 0 (M+m)*g/(M*L) a/L 0];
%B = [0;0;b;-b/L];
%a = 4; b = 1; M = 1; m = 0.4; g = 9.81; L = 0.25*M;

%% Control Law
% u = -G1*x1-G2*x2

%% Previously calculated ss values
A = [0 0 1 0; 0 0 0 1; 0 -3.92 -4 0; 0 54.88 16 0];
B = [0 0 1 -4]';

G = [G1 G2 0 0];
Ac = A-B*G;

Delta_c = det(s*eye(4)-Ac);
detDelta_C = collect(Delta_c,s);
pretty(detDelta_C)