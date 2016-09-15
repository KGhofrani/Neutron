    clear all
    clc

CCR=zeros(1,100);
CCT=zeros(1,100);
    STD=linspace(0,3,100);
    n=100;
    m=50;
for c=1:m
    for q=1:length(STD)

    std=STD(q);


    % % p=linspace(-pi,pi,100);
    % % dephase=normpdf(p,0,std);
    phase=linspace(0,2*pi/3,50);



    Had=[1 1 ; 1 -1] / sqrt(2);
    m=2; %number of trials



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


    for j=1:length(phase);

        T=zeros(2,(3*n-2));
        R=zeros(2,(3*n-2));
        FT=exp(1i*phase(j));
        FR=exp(-1i*phase(j));




            psi0=[1; 0];

           [psiT,psiR]=Blade(Had,n,psi0);  
            psiT=FT*psiT; %selecting the reflected beam
            psiR=FR*psiR; %selecting the transmited beam

    [psiTT,psiTR]=Blade(Had,floor((n-1)/2),psiT);
                x=[psiTT+psiTR,[0 ; 0]];
                x(2,:)=circshift(x(2,:)',1)';
        [psiTT,psiTR]=Blade2(Had,1,x,std);
                x=[psiTT+psiTR,[0 ; 0]];
                x(2,:)=circshift(x(2,:)',1)';
    [psiTT,psiTR]=Blade(Had,ceil((n-1)/2),x);
%     [psiTT,psiTR]=Blade2(Had,1,[[0 ; 0],psiTR]+[psiTT,[0 ; 0]], std);
%     [psiTT,psiTR]=Blade2(Had,ceil((n-1)/2),[[0 ; 0],psiTR]+[psiTT,[0 ; 0]], std);

            psiTT=FTT*psiTT; %selecting the reflected beam
            psiTR=FTR*psiTR; %selecting the transmited beam


            [psiRT,psiRR]=Blade(Had,floor((n-1)/2),psiR);
                x=[psiRR+psiRT,[0 ; 0]];
                x(2,:)=circshift(x(2,:)',1)';
                [psiRT,psiRR]=Blade2(Had,1,x,std);
                x=[psiRR+psiRT,[0 ; 0]];
                x(2,:)=circshift(x(2,:)',1)';
    [psiRT,psiRR]=Blade(Had,ceil((n-1)/2),x);
%     [psiRT,psiRR]=Blade2(Had,1,[[0 ; 0],psiRR]+[psiRT,[0 ; 0]], std);
%     [psiRT,psiRR]=Blade2(Had,ceil((n-1)/2),[[0 ; 0],psiRR]+[psiRT,[0 ; 0]], std);
    
            psiRT=FRT*psiRT; %selecting the reflected beam
            psiRR=FRR*psiRR; %selecting the transmited beam


            psiX=psiRT+psiTR;
            [psiXT,psiXR]=Blade(Had,n,psiX);
            psiXT=FXT*psiXT; %selecting the reflected beam
            psiXR=FXR*psiXR; %selecting the transmited beam

            IT(j) = IT(j) + sum(sum(psiXT.*conj(psiXT)));
            IR(j) = IR(j) + sum(sum(psiXR.*conj(psiXR)));


                CT(q)=cont(IT);
    CR(q)=cont(IR);
        end

    end
    CCR=CR+CCR/m;
     CCT=CT+CCT/m;
end





