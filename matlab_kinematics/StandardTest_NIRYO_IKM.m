clc
clear

% Constants
L1 = 183;
L2 = 210;
L3 = 30;
L4 = 221.5;
L5 = 23.7;
L6 = 5.5;
Le = 50;

% Variables 
syms theta1 theta2 theta3 theta4 theta5 theta6
syms d1 d2 d3 d4 d5 d6
syms l1 l2 l3 l4 l5 l6 le 

% Denavit-Hartenberg Matrix
% Arm
DH1 = [0,pi/2, l1, theta1;
      l2, 0, 0 , theta2 + pi/2;
      l3, pi/2, 0 , theta3;
      0 , 0 , l4, 0;] ;
% Wrist
DH2 = [0,-pi/2, 0, theta4;
      0, pi/2, 0 , theta5;
      0 , 0 , 0, theta6;] ;
% End-Effetor
DH3 = [0, pi/2, l5, pi/2;
      0,0,-l6, pi/2;
      le, 0,0,0;];

DH = [DH1; DH2; DH3];


[T0w0,Tw0w3,Tw3E,T0w3,T0E,notatedT0w0,notatedTw0w3,notatedTw3E,notatedT0w3,notatedT0E] = PaulMethod(DH);


% -------------------------------------------------------
% DKM: 
% Given: theta1 ,theta2 ,theta4, theta5, theta6
% Required: Ex,Ey,Ez, alpha, beta, gamma
% -------------------------------------------------------
variables = {theta1 ,theta2 ,theta3, theta4, theta5, theta6, l1, l2, l3, l4, l5, l6, le };
values = {pi/2, pi/6,pi/4,pi/2,pi/3,pi/12, L1 ,L2 ,L3, L4 ,L5 ,L6, Le };
[valuedT, Ex,Ey,Ez, R] = DKM(T0E , variables , values)
% [ alpha, beta, gamma ] = RPYAngles( R );
[ Psi,Theta,Phi ] = EulerAngles( R )



% --------------------------------------------------------
% IKM
% Given: Ex,Ey,Ez  Psi,Theta,Phi OR alpha, beta, gamma
% Required: theta1 ,theta2 ,theta3, theta4, theta5, theta6
% --------------------------------------------------------
valuedDH = subs (DH,{l1, l2, l3, l4, l5, l6, le},{ L1 ,L2 ,L3, L4 ,L5 ,L6, Le });
[Th1,Th2,Th3,Th4,Th5,Th6 ] = IKM_NIRYO(valuedDH,L1 ,L2 ,L3, L4 ,L5 ,L6, Le, Ex,Ey,Ez,R);

% solutions
Px = zeros(8,1);
Py = Px;
Pz = Px;
P = Px;
Th = Px;
Ph = Px;
for i = 1:8
    values = {Th1(i),Th2(i),Th3(i),Th4(i),Th5(i),Th6(i), L1 ,L2 ,L3, L4 ,L5 ,L6, Le };
    [valuedTi, Px(i),Py(i),Pz(i), Ri] = DKM(T0E , variables , values);
    [ P(i),Th(i),Ph(i) ] =  EulerAngles( Ri );
    
end

solutions = table(rad2deg(Th1),rad2deg(Th2), rad2deg(Th3),rad2deg(Th4),rad2deg(Th5), rad2deg(Th6),Px,Py,Pz,P,Th,Ph,...
    'VariableNames', {'Th1','Th2','Th3','Th4','Th5','Th6','Px','Py','Pz','P','Th','Ph'})
