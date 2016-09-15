clear all
clc


STD=linspace(0, 1, 10);
N=100;
beta=1;
for alpha=1:beta
    for q=1:length(STD)
        
        std=STD(q);
        
        
        % % p=linspace(-pi,pi,100);
        % % dephase=normpdf(p,0,std);
        phase=linspace(0,2*pi/3,50);
        
        
        
        Had=[1 1 ; 1 -1] / sqrt(2);
        m=1; %number of trials
        
        
        
        FT=1;
        FR=1;
        FTT=1;
        FTR=1;
        FRT=1;
        FRR=1;
        FXT=1;
        FXR=1;
        
        IT = zeros(1, length(phase));
        IR = zeros(1, length(phase));
        
        for v=1:length(N);
            
            n=N(v);
            
            for j=1:length(phase);
                
                T=zeros(2,(3*n-2));
                R=zeros(2,(3*n-2));
                FT=exp(1i*phase(j));
                FR=exp(-1i*phase(j));
                
                for k=1:m
                    
                    
                    psi0=[1; 0];
                    
                    [psiT,psiR]=BladeD3(Had,n,psi0, std);
                    psiT=FT*psiT; %selecting the reflected beam
                    psiR=FR*psiR; %selecting the transmited beam
                    
                    
                    [psiTT,psiTR]=BladeD3(Had,n,psiT, std);
                    psiTT=FTT*psiTT; %selecting the reflected beam
                    psiTR=FTR*psiTR; %selecting the transmited beam
                    
                    
                    [psiRT,psiRR]=BladeD3(Had,n,psiR, std);
                    psiRT=FRT*psiRT; %selecting the reflected beam
                    psiRR=FRR*psiRR; %selecting the transmited beam
                    
                    psiX=psiRT+psiTR;
                    [psiXT,psiXR]=BladeD3(Had,n,psiX, std);
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
            
            
        end
        
        CT(q)=cont(IT/sum(IT));
        CR(q)=cont(IR/sum(IR));
        
        if alpha == 1
            C1=CT;
            C2=CR;
            csvwrite(strcat('psiT_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiT)
            csvwrite(strcat('psiR_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiR)
            csvwrite(strcat('psiTT_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiTT)
            csvwrite(strcat('psiTR_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiTR)
            csvwrite(strcat('psiXT_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiXT)
            csvwrite(strcat('psiXR_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiXR)
            csvwrite(strcat('psiRT_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiRT)
            csvwrite(strcat('psiRR_numplanes_3blade_', int2str(n),'_std_', num2str(std)), psiRR)
            
        else
            C1=C1+CT/beta;
            C2=C2+CR/beta;
            
        end
    end
end
csvwrite('threebladecontrT', C1)
csvwrite('threebladecontrR', C2)