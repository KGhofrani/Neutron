clear all
clc


STD=0;
phase=linspace(0,2*pi/3,50);
Had=[1 1 ; 1 -1] / sqrt(2);
m=1; %number of trials


FT=1;
FR=1;
FTT=1;
FTR=1;
FRT=1;
FRR=1;
FRTt=1;
FRTr=1;

FXT=1;
FXR=1;


IT = zeros(1, length(phase));
IR = zeros(1, length(phase));



Phase=linspace(0,pi,100);

for i=1:length(Phase);
    phase=Phase(i);
   ope=[cos(phase/2),1i*sin(phase/2) ; 1i*sin(phase/2), cos(phase/2)];

for q=1:length(STD)
    
std=STD(q);


% % p=linspace(-pi,pi,100);
% % dephase=normpdf(p,0,std);



for v=90
    
    n=10+v;
    
for j=1:length(phase);

    T=zeros(2,(3*n-2));
    R=zeros(2,(3*n-2));
    FT=exp(1i*phase(j));
    FR=exp(-1i*phase(j));
    
    for k=1:m


        psi0=[1; 0];

       [psiT,psiR]=Blade2(Had,n,psi0, std);  
        psiT=FT*psiT; %selecting the reflected beam
        psiR=FR*psiR; %selecting the transmited beam


        [psiTT,psiTR]=Blade2(Had,n,psiT, std);
        psiTT=FTT*psiTT; %selecting the reflected beam
        psiTR=FTR*psiTR; %selecting the transmited beam

        [psiTRt, psiTRr]=Blade2(Had,n,psiTR, std);
        psiTRt=FRTt*psiTRt; %selecting the reflected beam
        psiTRr=FRTr*psiTRr; %selecting the transmited beam

        
        
        [psiRT,psiRR]=Blade2(Had,n,psiR, std);
        psiRT=FRT*psiRT; %selecting the reflected beam
        psiRR=FRR*psiRR; %selecting the transmited beam


        
        [psiXT1,psiXR1]=Blade2(Had,n,psiTRt, std); %sending the beam though an extra blade

        PSIRT2=[zeros(2,length(psiTRt)-length(psiRT)),psiRT]; %padding the beam with zeros
       [psiXT2,psiXR2]=Blade2(Had,n,PSIRT2, std) ;
        
        
        psiXT=psiXT1+psiXT2;
        psiXR=psiXR1+psiXR2;

        IT(j) = IT(j) + sum(sum(psiXT.*conj(psiXT)));
        IR(j) = IR(j) + sum(sum(psiXR.*conj(psiXR)));
        
        
    end

end

IT = IT / m;
IR = IR / m;

CT(i)=cont(IT);
CR(i)=cont(IR);

end
end


end