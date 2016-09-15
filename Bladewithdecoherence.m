TT=zeros(1,100);
RR=zeros(1,100);

n=100;
STD=linspace(0, 10, 100);
m=500;

for q=1:length(STD)
    
    std=STD(q);
TT=zeros(1,100);
RR=zeros(1,100);
for k=1:m

[psiT,psiR]=Blade(Had,floor((n-1)/2),[1; 0]);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade2(Had,1,x,std);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade(Had,ceil((n-1)/2),x);

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