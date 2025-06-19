function [Th1,Th2,Th3,Th4,Th5,Th6 ] = IKM_NIRYO(DH,L1 ,L2 ,L3, L4 ,L5 ,L6, Le, Ex,Ey,Ez,R)

syms theta [1 6]

[T0w0,Tw0w3,Tw3E,T0w3,T0E,notatedT0w0,notatedTw0w3,notatedTw3E,notatedT0w3,notatedT0E] = PaulMethod(DH);

valuedT0E = [R(1,:) Ex;
             R(2,:) Ey;
             R(3,:) Ez;
             0, 0, 0, 1;];
valuedTw3E = Tw3E;
valuedT0w3 = double(valuedT0E * inv(valuedTw3E));

[Th1,Th2,Th3] = IKM_NIRYO_Arm(L1 ,L2 ,L3, L4 ,valuedT0w3);
[Th4,Th5,Th6] = IKM_NIRYO_SphericalWrist(Th1,Th2,Th3,T0w0,valuedT0w3);

end

