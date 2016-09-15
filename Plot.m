clear all
clc
Ope=sqrt(1/2)*[1 1; 1 -1];
psi0=[1; 0];


[ psiT,psiR] = Blade(Ope, 10, psi0);
k=floor((1000-length(psiT))/2);
l=ceil((1000-length(psiT))/2);
psiT10=[ sum(psiT).*conj(sum(psiT))];
psiR10=[ sum(psiR).*conj(sum(psiR))];

[ psiT,psiR] = Blade(Ope, 20, psi0);
k=floor((1000-length(psiT))/2);
l=ceil((1000-length(psiT))/2);
psiT20=[zeros(1,k) , sum(psiT).*conj(sum(psiT)), zeros(1,l)];
psiR20=[zeros(1,k) , sum(psiR).*conj(sum(psiR)), zeros(1,l)];

[ psiT,psiR] = Blade(Ope, 50, psi0);
k=floor((1000-length(psiT))/2);
l=ceil((1000-length(psiT))/2);
psiT50=[zeros(1,k) , sum(psiT).*conj(sum(psiT)), zeros(1,l)];
psiR50=[zeros(1,k) , sum(psiR).*conj(sum(psiR)), zeros(1,l)];

[ psiT,psiR] = Blade(Ope, 100, psi0);
k=floor((1000-length(psiT))/2);
l=ceil((1000-length(psiT))/2);
psiT100=[zeros(1,k) , sum(psiT).*conj(sum(psiT)), zeros(1,l)];
psiR100=[zeros(1,k) , sum(psiR).*conj(sum(psiR)), zeros(1,l)];

[ psiT,psiR] = Blade(Ope, 1000, psi0);
psiT1000=sum(psiT).*conj(sum(psiT));
psiR1000=sum(psiR).*conj(sum(psiR));

x=-499:500;

figure(1)
plot(x,psiT10)
legend('10 Planes','20 Planes','50 Planes','100 Planes','1000 Planes')
xlabel('Displacement')
ylabel('Intensity')

figure(2)
plot(x,psiR10)
legend('10 Planes','20 Planes','50 Planes','100 Planes','1000 Planes')
xlabel('Displacement')
ylabel('Intensity')

