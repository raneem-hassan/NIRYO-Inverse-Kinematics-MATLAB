function [Th4,Th5,Th6] = IKM_NIRYO_SphericalWrist(Th1,Th2,Th3,T0w0,valuedT0w3)
syms theta [1 6]
Th4 = zeros(8,1);
Th5 = zeros(8,1);
Th6 = zeros(8,1);
for i=1:2:8
    valuedT0w0 = double(simplify(subs (T0w0,{theta1 ,theta2 ,theta3},{Th1(i),Th2(i),Th3(i)})));
    valuedTw0w3 = double(inv(valuedT0w0)*valuedT0w3);
    Th5(i) = acos(valuedTw0w3(3,3));
    Th5(i+1) = -acos(valuedTw0w3(3,3));
    Th4(i) = atan2(valuedTw0w3(2,3),valuedTw0w3(1,3));
    Th4(i+1) = atan2(-valuedTw0w3(2,3),-valuedTw0w3(1,3));
    Th6(i) = atan2(valuedTw0w3(3,2),-valuedTw0w3(3,1));
    Th6(i+1) = atan2(-valuedTw0w3(3,2),valuedTw0w3(3,1));
end
end