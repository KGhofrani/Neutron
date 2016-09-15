
clear all

TT=zeros(1,100);
RR=zeros(1,100);

n=100;
STD=linspace(0, 10, 100);
m=500;

Had=[1 1 ; 1 -1] / sqrt(2);

for q=1:length(STD)
    
    std=STD(q);
TT=zeros(1,102);
RR=zeros(1,102);
for k=1:m

[psiT,psiR]=Blade2(Had,2,[1; 0],std);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade(Had,(n-1),x);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade2(Had,1,x,std);


T=sum(psiT.*conj(psiT));
R=sum(psiR.*conj(psiR));

TT=TT+(T/m);
RR=RR+(R/m);

end

IT(q)=sum(TT);
IR(q)=sum(RR);

TTT(q,:)=TT;
RRR(q,:)=RR;

end