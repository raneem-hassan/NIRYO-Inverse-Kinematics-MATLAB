function [T0E] = simplifyMatrix(T0E)

syms theta1 theta2 theta3 theta4 theta5 theta6

T0E = subs(T0E, {cos(theta1),cos(theta2),cos(theta3),cos(theta4),cos(theta5),cos(theta6),...
    sin(theta1),sin(theta2),sin(theta3),sin(theta4),sin(theta5),sin(theta6),...
    cos(theta1 + theta2), sin(theta1 + theta2),cos(theta1 + theta3), sin(theta1 + theta3),...
    cos(theta1 + theta4), sin(theta1 + theta4),cos(theta2 + theta3), sin(theta2 + theta3),...
    cos(theta1 + theta2 + theta3), sin(theta1 + theta2 + theta3),...
    cos(theta1 + theta2 + theta4), sin(theta1 + theta2 + theta4)},...
    {'c1','c2','c3','c4','c5','c6','s1','s2','s3','s4','s5','s6','c12','s12','c13','s13',...
    'c14','s14','c23','s23','c123','s123','c124','s124'});
end

