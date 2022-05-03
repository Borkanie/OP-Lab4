function [d] = golden(a,b,epsilon,X1,X2,J,Norm)
d=b-a; 
while abs(b-a)>epsilon
     d=0.618*d;
     q1=b-d;
     q2=a+d;
     if q1<0
         q1=0;
     end
     if q2<0
         q2=0;
     end
     if fun(q1,X1,X2,J,Norm)<=fun(q2,X1,X2,J,Norm)
         b=q2;
     else
         a=q1;
     end
end
d=(a+b)/2;
end