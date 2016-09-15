clear all
clc

STD=linspace(0,0.5,10);
n=100;
m=100;

PSIT=zeros(length(STD),n);
PSIR=zeros(length(STD),n);
 
Oper=[1 1 ; 1 -1]*1/sqrt(2);
psi0=[1;0];

for i=1:length(STD)
    
    psiT=zeros(2,n);
    psiR=zeros(2,n);
    
    std=STD(i);
    for k=1:m
    k

    [ psit,psir ] = Blade2(Oper, n, psi0, std);
    psiT=psiT+psit.*conj(psit);
    psiR=psiR+psir.*conj(psir);
    end
    
    psiT=psiT;
    psiR=psiR;
    
    PSIT(i,:)=psiT(1,:)/m;
    PSIR(i,:)=psiR(2,:)/m;
    
end

