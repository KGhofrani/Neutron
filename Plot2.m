clear all
clc
Ope=sqrt(1/2)*[1 1; 1 -1];
psi0=[1; 0];
set(0,'DefaultAxesFontSize',16)
n=10;

[ psiT,psiR] = Blade(Ope, n, psi0);

psiT=[ sum(psiT).*conj(sum(psiT))];
psiR=[ sum(psiR).*conj(sum(psiR))];

x=-floor(n/2):(n-floor(n/2)-1);

figure(1)

subplot(2,2,1)
plot(x,psiT)
title('10 Planes')
axis tight

n=100;

[ psiT,psiR] = Blade(Ope, n, psi0);

psiT=[ sum(psiT).*conj(sum(psiT))];
psiR=[ sum(psiR).*conj(sum(psiR))];

x=-floor(n/2):(n-floor(n/2)-1);
subplot(2,2,2)
plot(x,psiT)
title('100 Planes')
axis tight

n=1000;

[ psiT,psiR] = Blade(Ope, n, psi0);

psiT=[ sum(psiT).*conj(sum(psiT))];
psiR=[ sum(psiR).*conj(sum(psiR))];

x=-floor(n/2):(n-floor(n/2)-1);
subplot(2,2,3)
plot(x,psiT)
title('1000 Planes')
axis tight

n=10000;

[ psiT,psiR] = Blade(Ope, n, psi0);

psiT=[ sum(psiT).*conj(sum(psiT))];
psiR=[ sum(psiR).*conj(sum(psiR))];

x=-floor(n/2):(n-floor(n/2)-1);
subplot(2,2,4)
plot(x,psiT)
title('10000 Planes')
axis tight

