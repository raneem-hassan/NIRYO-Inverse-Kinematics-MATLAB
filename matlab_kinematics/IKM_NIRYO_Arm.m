function [Th1,Th2,Th3] = IKM_NIRYO_Arm(L1 ,L2 ,L3, L4 ,valuedT0w3)

wx = valuedT0w3(1,4);
wy = valuedT0w3(2,4);
wz = valuedT0w3(3,4);

% eqns = [-cos(theta1)*(L3*sin(theta2 + theta3) - L4*cos(theta2 + theta3) + L2*sin(theta2)) == wx,
%         -sin(theta1)*(L3*sin(theta2 + theta3) - L4*cos(theta2 + theta3) + L2*sin(theta2)) == wy,
%         L1 + L3*cos(theta2 + theta3) + L4*sin(theta2 + theta3) + L2*cos(theta2) == wz];

Th1_1 = atan2(wy,wx);
Th1_2 = atan2(-wy,-wx);

a = wx*cos(Th1_1) + wy*sin(Th1_1);
b = wz - L1;
sum = (a^2 + b^2 - L4^2 - L3^2 - L2^2)/2;
L23 = L2*L3;
L24 = L2*L4;
Th3_1 = atan2 (sum, sqrt(L23^2 + L24^2 - sum^2)) - atan2(L23,L24);
Th3_2 = atan2 (sum, - sqrt(L23^2 + L24^2 - sum^2)) - atan2(L23,L24);
A = L4*cos(Th3_1) - L3*sin(Th3_1);
B = -L4*sin(Th3_1) - L3*cos(Th3_1) - L2;
C =  L4*sin(Th3_1) + L3*cos(Th3_1) + L2;
D =  L4*cos(Th3_1) + L3*sin(Th3_1);
sol = [A B; C D];
Th2 = inv (sol)*[a;b];
Th2_1 = atan2 (Th2(2), Th2(1));
A = L4*cos(Th3_2) - L3*sin(Th3_2);
B = -L4*sin(Th3_2) - L3*cos(Th3_2) - L2;
C =  L4*sin(Th3_2) + L3*cos(Th3_2) + L2;
D =  L4*cos(Th3_2) + L3*sin(Th3_2);
sol = [A B; C D];
Th2 = inv (sol)*[a;b];
Th2_2 = atan2 (Th2(2), Th2(1));


a = wx*cos(Th1_2) + wy*sin(Th1_2);
b = wz - L1;
sum = (a^2 + b^2 - L4^2 - L3^2 - L2^2)/2;
L23 = L2*L3;
L24 = L2*L4;
Th3_3 = atan2 (sum, sqrt(L23^2 + L24^2 - sum^2)) - atan2(L23,L24);
Th3_4 = atan2 (sum, - sqrt(L23^2 + L24^2 - sum^2)) - atan2(L23,L24);
A = L4*cos(Th3_3) - L3*sin(Th3_3);
B = -L4*sin(Th3_3) - L3*cos(Th3_3) - L2;
C =  L4*sin(Th3_3) + L3*cos(Th3_3) + L2;
D =  L4*cos(Th3_3) + L3*sin(Th3_3);
sol = [A B; C D];
Th2 = inv (sol)*[a;b];
Th2_3 = atan2 (Th2(2), Th2(1));
A = L4*cos(Th3_4) - L3*sin(Th3_4);
B = -L4*sin(Th3_4) - L3*cos(Th3_4) - L2;
C =  L4*sin(Th3_4) + L3*cos(Th3_4) + L2;
D =  L4*cos(Th3_4) + L3*sin(Th3_4);
sol = [A B; C D];
Th2 = inv (sol)*[a;b];
Th2_4 = atan2 (Th2(2), Th2(1));

Th1 = [Th1_1; Th1_1;Th1_1; Th1_1; Th1_2; Th1_2;Th1_2; Th1_2;];
Th2 = [Th2_1;Th2_1; Th2_2;Th2_2;Th2_3;Th2_3; Th2_4; Th2_4];
Th3 = [Th3_1;Th3_1; Th3_2;Th3_2;Th3_3;Th3_3; Th3_4; Th3_4];
end

