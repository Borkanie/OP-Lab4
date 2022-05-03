function [hess] = hessianf(x1,x2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
hess=[72*x1.^2 + 6*x1,0;
     0, 60*x2.^4 - 6];
end