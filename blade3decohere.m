clear all
clc


STD=linspace(0,1,100);
n1=5;
n2=10;
n3=5;
psi0=[1; 0];
m=50; %number of trials
Had=[1 1 ; 1 -1] / sqrt(2);
FT=1;
FR=1;
FTT=1;
FTR=1;
FRT=1;
FRR=1;
FXT=1;
FXR=1;

for q=1:length(STD)
    
std=STD(q);


% % p=linspace(-pi,pi,100);
% % dephase=normpdf(p,0,std);
phase=linspace(0,2*pi/3,50);









IT = zeros(1, length(phase));
IR = zeros(1, length(phase));

for v=1;
    

    
for j=1:length(phase);

    FT=exp(1i*phase(j));
    FR=exp(-1i*phase(j));
    
    for k=1:m


        

       [psiT,psiR]=BladeD1(Had,n1,n2,n3,psi0, std);  
        psiT=FT*psiT; %selecting the reflected beam
        psiR=FR*psiR; %selecting the transmited beam


        [psiTT,psiTR]=BladeD1(Had,n1,n2,n3,psiT, std);
        psiTT=FTT*psiTT; %selecting the reflected beam
        psiTR=FTR*psiTR; %selecting the transmited beam

        [psiRT,psiRR]=BladeD1(Had,n1,n2,n3,psiR, std);
        psiRT=FRT*psiRT; %selecting the reflected beam
        psiRR=FRR*psiRR; %selecting the transmited beam


        psiX=psiRT+psiTR;
        [psiXT,psiXR]=BladeD1(Had,n1,n2,n3,psiX, std);
        psiXT=FXT*psiXT; %selecting the reflected beam
        psiXR=FXR*psiXR; %selecting the transmited beam

        IT(j) = IT(j) + sum(sum(psiXT.*conj(psiXT)));
        IR(j) = IR(j) + sum(sum(psiXR.*conj(psiXR)));
        
        Ct(v)=cont(IT);
        Cr(v)=cont(IR);
    end

end

IT = IT / m;
IR = IR / m;

CT(q)=cont(IT);
CR(q)=cont(IR);

end



end