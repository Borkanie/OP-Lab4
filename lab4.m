
f=@(x1,x2) x1.^3+6*x1.^4-3*x2.^2+2*x2.^6;

[X1,X2]=meshgrid([-2:0.1:2],[-2:0.1:2]);
contour(X1,X2,f(X1,X2))
figure
plot3(X1,X2,f(X1,X2))
%%
[xk,y]=Newton(f,[-1;-1],0.1); 
x1=vpa(xk(1),4)
 x2=vpa(xk(2),4)
 vpa(subs(f),4)
 %%
 
[xk,y]=NewtonMod(f,[-.5;-.9],0.01); 
x1=vpa(xk(1),4)
 x2=vpa(xk(2),4)
 vpa(subs(f),4)
 %%
 
contour(X1,X2,f(X1,X2))
hold on
for i=1:length(y)
    q=y(:,i)
    x1=vpa(q(1),4)
    x2=vpa(q(2),4)
    plot3(q(1),q(2),subs(f),'*')
    hold on
end