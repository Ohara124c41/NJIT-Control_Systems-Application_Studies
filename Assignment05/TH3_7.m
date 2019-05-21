syms s G1 G2 G3 
A = [-3 1 0; 1 -2 1; 0 1 -3];
B = [1; 0; 0];

%% Place Poles and Gain
poles = [-10+5j, -10-5j, -15];
k = place(A, B, poles)

%G = [G1 G2 G3];
G = [27 271 915];

A = A-B.*G;
Det = inv(s*eye(3)-A);
deltaC = det(Det); 
DeltaC = collect(deltaC,s); 
pretty(DeltaC)


