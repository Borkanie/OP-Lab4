function [val] = fun(s,X1,X2,J,Norm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
val=(X1+s*J(1)/Norm)^3+6*(X1+s*J(1)/Norm)^4-3*(X2+s*J(1)/Norm)^2+2*(X2+s*J(1)/Norm)^6;
end