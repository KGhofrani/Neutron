

%%Flags
FT=1;
FR=1;
FTT=1;
FTR=1;
FRT=1;
FRR=1;

FTTT=1;
FTTR=1;
FTRT=1;
FTRR=1;
FRRT=1;
FRRR=1;
FTTRT=1;
FTTRR=1;


FTRRT=1;
FTRRR=1;
FTTRRT=1;
FTTRRR=1;
p =0.5;
N=100;
STD=linspace(0, 1, 10);
beta=10;
for alpha=1:beta
    for q=1:length(STD)
        
        std=STD(q);
        
        for j=1:length(N);
            for s=1:100
                
                n=N(j);
                psi0=[1 0]'; %initial state
                theta=2*pi*s/100;%
                
                FT=exp(1i*theta);
                FR=exp(-1i*theta);
                phi = 0;
                
                Had=[sqrt(p) exp(1i*phi)*sqrt(1-p) ;exp(-1i*phi)*sqrt(1-p)  -sqrt(p)]; %plane operator
                
                
                
                U=Had; %unitary operator
                
                psi=[1;0];
                %%%%%%%%%%%%%
                %first blade%
                %%%%%%%%%%%%%
                
                [psiT,psiR]=Blade2(Had,n,psi, std);
                
                psiT=FT.*psiT; %selecting the reflected beam
                psiR=FR.*psiR; %selecting the transmited beam
                
                %%%%%%%%%%%%%%%
                %Second blades%
                %%%%%%%%%%%%%%%
                
                
                
                [psiTT,psiTR]=Blade2(Had,n,psiT, std);
                
                psiTT=FTT*psiTT; %selecting the reflected beam
                psiTR=FTR*psiTR; %selecting the transmited beam
                
                
                [psiRT,psiRR]=Blade2(Had,n,psiR, std);
                
                psiRT=FRT*psiRT; %selecting the reflected beam
                psiRR=FRR*psiRR; %selecting the transmited beam
                
                
                %%%%%%% Third Blade
                
                [psiTTT,psiTTR]=Blade2(Had,n,psiTT, std);
                
                psiTTT=FTTT*psiTTT; %selecting the reflected beam
                psiTTR=FTTR*psiTTR; %selecting the transmited beam
                
                
                psiTRX=psiRT+psiTR;
                
                [psiTRT,psiTRR]=Blade2(Had,n,psiTRX, std);
                
                psiTRT=FTRT*psiTRT; %selecting the reflected beam
                psiTRR=FTRR*psiTRR; %selecting the transmited beam
                
                
                [psiRRT,psiRRR]=Blade2(Had,n,psiRR, std);
                
                psiRRT=FRRT*psiRRT; %selecting the reflected beam
                psiRRR=FRRR*psiRRR; %selecting the transmited beam
                
                
                %%%%%%% Fourth Blade
                
                psiTTRX=psiTTR+psiTRT;
                
                [psiTTRT,psiTTRR]=Blade2(Had,n,psiTTRX, std);
                
                psiTTRT=FTTRT*psiTTRT; %selecting the reflected beam
                psiTTRR=FTTRR*psiTTRR; %selecting the transmited beam
                
                
                
                psiTRRX=psiTRR+psiRRT;
                [psiTRRT,psiTRRR]=Blade2(Had,n,psiTRRX, std);
                
                
                
                psiTRRT=FTRRT*psiTRRT; %selecting the reflected beam
                psiTRRR=FTRRR*psiTRRR; %selecting the transmited beam
                
                %Fifth Blade
                
                psiTTRRX=psiTTRR+psiTRRT;
                [psiTTRRT,psiTTRRR]=Blade2(Had,n+1,psiTTRRX, std);
                
                
                D(1,s)=sum(psiTTRRT(1,:).*conj(psiTTRRT(1,:)));
                D(2,s)=sum(psiTTRRR(2,:).*conj(psiTTRRR(2,:)));
                
                
            end
            
            Q1(j)=sum(psiTTRRT(1,:).*conj(psiTTRRT(1,:)));
            Q2(j)=sum(psiTTRRR(2,:).*conj(psiTTRRR(2,:)));
            
        end
        
        CT(q)=cont(D(1,:)/sum(D(1,:)));
        CR(q)=cont(D(2,:)/sum(D(2,:)));
        
        
    end
    
    if alpha == 1
        C1=CT;
        C2=CR;
        csvwrite(strcat('psiT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiT)
        csvwrite(strcat('psiR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiR)
        csvwrite(strcat('psiTT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTT)
        csvwrite(strcat('psiTR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTR)
        csvwrite(strcat('psiXT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiXT)
        csvwrite(strcat('psiXR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiXR)
        csvwrite(strcat('psiRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiRT)
        csvwrite(strcat('psiRR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiRR)
        csvwrite(strcat('psiTTT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTT)
        csvwrite(strcat('psiTTR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTR)
        csvwrite(strcat('psiTRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTRT)
        csvwrite(strcat('psiTRR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTRR)
        csvwrite(strcat('psiRRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiRRT)
        csvwrite(strcat('psiTTRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTRT)
        csvwrite(strcat('psiTTRR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTRR)
        csvwrite(strcat('psiTRRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTRRT)
        csvwrite(strcat('psiTRRR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTRRR)
        csvwrite(strcat('psiTTRRT_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTRRT)
        csvwrite(strcat('psiTTRRR_numplanes_5blade_', int2str(n),'_std_', num2str(std)), psiTTRRR)
        
    else
        C1=C1+CT/beta;
        C2=C2+CR/beta;
        
    end
end
csvwrite('five30bladecontrT', C1)
csvwrite('five30bladecontrR', C2)