function [T0E] = T0eMatrix(DH)

T0E = [1, 0 , 0, 0;
       0, 1 , 0, 0;
       0, 0 , 1, 0;
       0, 0 , 0, 1;];

for i =1:size(DH,1)  
    T0E = T0E * TransMatrix (DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end

T0E = simplify (T0E);

end

