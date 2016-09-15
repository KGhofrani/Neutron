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
            
        else
            C1=C1+CT/beta;
            C2=C2+CR/beta;
            
        end
    end
end
