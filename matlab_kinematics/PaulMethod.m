function [T0w0,Tw0w3,Tw3E,T0w3,T0E,notatedT0w0,notatedTw0w3,notatedTw3E,notatedT0w3,notatedT0E] = PaulMethod(DH)
DH1 = DH(1:4,:);
DH2 = DH(5:7,:);
DH3 = DH(8:10,:);


% Transformation Matrix 
T0w0 = T0eMatrix(DH1);
Tw0w3 = T0eMatrix(DH2);
Tw3E = T0eMatrix(DH3);
T0w3 = T0w0*Tw0w3;
T0E = T0w3*Tw3E;


% Simpler Notation
notatedT0w0 = simplifyMatrix(T0w0);
notatedTw0w3 = simplifyMatrix(Tw0w3);
notatedTw3E = simplifyMatrix(Tw3E);
notatedT0w3 = simplifyMatrix(T0w3);
notatedT0E = simplifyMatrix(T0E);
end

