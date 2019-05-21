syms s G1 G2 G3 
A = [-3 1 0; 1 -2 1; 0 1 -3];
B = [1; 0; 0];

%% Place Poles and Gain
poles = [-10+ 5j, -10-5j, -15];
k = place(A, B, poles)

%Exogeneous
%G = [G1 G2 G3];
%G = [62 1369 10441];

Ac = A-B.*G;
Det = inv(s*eye(3)-Ac);
deltaC = det(Det); 
DeltaC = collect(deltaC,s); 
pretty(DeltaC)

%% Test Gain
k2 = place(Ac, B, poles)

