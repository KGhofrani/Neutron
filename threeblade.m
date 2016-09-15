
clc
clear all

N=30:60;
percentage=0.0;
percentage2=0.00;
alphaz=[1 1 ; - 1 1];
% Rz=[exp(i*pi/128) 0 ; 0 exp(-i*pi/12D8)];
% Rx=[cos(pi/4), -i*sin(pi/4) ; -i*sin(pi/4) , cos(pi/4)];
% Had=Rz*Rx;
Phase=17*pi/18;%linspace(0,pi/2,100);


for p=1:length(Phase);

    phase=Phase(p);
 Had=[cos(phase/2),1i*sin(phase/2) ; 1i*sin(phase/2), cos(phase/2)];

for q=1:length(N)
    
n=N(q);


% % p=linspace(-pi,pi,100);
% % dephase=normpdf(p,0,std);
phase=linspace(0,2*pi,200);







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


        [psiTT,psiTR]=Blade(Had,n,psiT);
        psiTT=FTT*psiTT; %selecting the reflected beam
        psiTR=FTR*psiTR; %selecting the transmited beam

        [psiRT,psiRR]=Blade(Had,n,psiR);
        psiRT=FRT*psiRT; %selecting the reflected beam
        psiRR=FRR*psiRR; %selecting the transmited beam
        

        psiX=psiRT+psiTR;
        [psiET,psiER]=Blade(Had,n,psiX);
        psiET=FXT*psiET; %selecting the reflected beam
        psiER=FXR*psiER; %selecting the transmited beam

        D(1,j) = IT(j) + sum(sum(psiET.*conj(psiET)));
        D(2,j) = IR(j) + sum(sum(psiER.*conj(psiER)));


end







CT(q)=cont(D(1,:));
CR(q)=cont(D(2,:));

end

averT(p)=mean(CT);
averR(p)=mean(CR);

end


plot(N,CR,'o')
axis([30 60 0 0.8])
set(gca,'fontsize',14)
ylabel('Contract')
xlabel('Number of Planes')


