clear all
clc
syms x1 x2;
fun=x1.^3+6*x1.^4-3*x2.^2+2*x2.^6
%x1.x2+3*x2+2(x1.^2)+x2.^2
GRADF=gradient(fun)
Hessf=hessian(fun)
[X1,X2]=meshgrid([-3:0.1:3],[-3:0.1:3]);
y=f(X1,X2);
contour(X1,X2,y)
figure
plot3(X1,X2,y)
%%
tol=0.01;
% Initial Guess (Choose Initial Guesses):
x1(1) = double(1);
x2(1) = double(1);
i=1;
J = gradientf(x1(i),x2(i));
H = hessianf(x1(i),x2(i)); 
S = inv(H);
while norm(J)>tol
    I = [x1(i);x2(i)];
    x1(i+1) = double(vpa(I(1)-S(1,:)*J,5));
    x2(i+1) = double(vpa(I(2)-S(2,:)*J,5));
    i = i+1;
    J = gradientf(x1(i),x2(i)); % Updated Jacobian
    H = hessianf(x1(i),x2(i)); % Updated Hessian
    S = inv(H); % New Search Direction
end
raspn=double(vpa([x1;x2],4));
raspn(:,length(raspn))


figure
[X1,X2]=meshgrid([-3:0.1:3],[-3:0.1:3]);
contour(X1,X2,f(X1,X2))
hold on
for i=1:length(raspn)
    q=raspn(:,i);
    x1=vpa(q(1),4);
    x2=vpa(q(2),4);
    plot(q(1),q(2),'*')
    hold on
end
%%
tol=0.1;
% Initial Guess (Choose Initial Guesses):
x1(1) = double(1);
x2(1) = double(1);
i=1;
J = gradientf(x1(i),x2(i));
H = hessianf(x1(i),x2(i)); 
S = inv(H);
while norm(J)>tol
    I = [x1(i);x2(i)];
    x1(i+1) = double(vpa(I(1)-S(1,:)*J,5));
    x2(i+1) = double(vpa(I(2)-S(2,:)*J,5));
    i = i+1;
    J = gradientf(x1(i),x2(i)); % Updated Jacobian
    H = hessianf(x1(1),x2(1)); % Updated Hessian
    S = inv(H); % New Search Direction
end
raspn=double(vpa([x1;x2],4));
raspn(:,length(raspn))

figure
[X1,X2]=meshgrid([-3:0.1:3],[-3:0.1:3]);
contour(X1,X2,f(X1,X2))
hold on
for i=1:length(raspn)
    q=raspn(:,i);
    x1=vpa(q(1),4);
    x2=vpa(q(2),4);
    plot(q(1),q(2),'*')
    hold on
end
%%
tol=0.1;
x1=0;
x2=0;
% Initial Guess (Choose Initial Guesses):
x1(1) = double(4);
x2(1) = double(4);
i=1;
J = gradientf(x1(i),x2(i));
H = hessianf(x1(i),x2(i)); 
S = 0.1;
Norm=norm(J);
while norm(J)>tol
    I = [x1(i);x2(i)];
    x1(i+1) = double(vpa(I(1)-S*J(1)/Norm,5));
    x2(i+1) = double(vpa(I(2)-S*J(2)/Norm,5));
    i = i+1;
    J = gradientf(x1(i),x2(i)); % Updated Jacobian
    Norm = norm(J); % Updated Hessian
    X1=x1(i);
    X2=x2(i);
    S = golden(0,2,0.01,X1,X2,J,Norm); % New Search Direction
end
raspn=double(vpa([x1;x2],4));
raspn(:,length(raspn))

figure
[X1,X2]=meshgrid([-3:0.1:3],[-3:0.1:3]);
contour(X1,X2,f(X1,X2))
hold on
for i=1:length(raspn)
    q=raspn(:,i);
    x1=vpa(q(1),4);
    x2=vpa(q(2),4);
    plot(q(1),q(2),'*')
    hold on
end
