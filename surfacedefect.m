clear all
clc

STD=linspace(0,5,50);
psi0=[1; 0];

n1=2;
n2=47;
n3=2;
n4=47;
n5=2;

Had=[1 1 ; 1 -1] / sqrt(2);
m=500; %number of trials


for q=1:length(STD)
    q
    R=zeros(1,n1+n2+n3+n4+n5);
    T=zeros(1,n1+n2+n3+n4+n5);
    
    std1=STD(q);
    std2=0; 
    std3=STD(q);
    std4=0; 
    std5=STD(q);
    
    
    for a=1:m
       [ psiT,psiR ] = BladeD2(Had, n1, n2, n3,n4,n5, psi0, std1,std2,std3,std4,std5);
        
        T=T+sum(psiT.*conj(psiT))/m;
        R=R+sum(psiR.*conj(psiR))/m;
        
    end
    R2(q,:)=R;
    T2(q,:)=T;
    RR(q)=sum(R);
    TT(q)=sum(T);
end