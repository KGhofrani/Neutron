
clc

m=500;
%oper=exp(1*pi/4*(1/sqrt(2)*[0 1 ; 1 0]));
oper=[1 1 ; 1 -1]/sqrt(2);
PSI=zeros(1,50);
for i=1:m
    display(i)
    psi0=1/sqrt(2)*[1 , 1i]';
    [psiT,psiR]=Blade2(oper,50,psi0,0.2);
    
   
    PSI=((sum(psiT).*conj(sum(psiT))+sum(psiR).*conj(sum(psiR)))/i)+PSI*((i-1)/i);
    plot(PSI);
    pause(0.001)
end



