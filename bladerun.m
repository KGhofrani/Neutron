clear all
clc

%this script runs the blade function

n=10000;
%Ope=[1 1; 1 -1] / sqrt(2);

phase=(pi/4);
Ope=[cos(phase/2),1i*sin(phase/2) ; 1i*sin(phase/2), cos(phase/2)];
psi0=[1;0];

[ psiT,psiR ] = Bladeblock(Ope, n, psi0);
[ psiT2,psiR2 ] = Blade(Ope, n, psi0);

figure(1)
plot(sum(psiT.*conj(psiT)));hold; plot(sum(psiR.*conj(psiR)),'r');hold;

figure(2)
plot(sum(psiT2.*conj(psiT2)));hold;plot(sum(psiR2.*conj(psiR2)),'r');hold;


l=length(psiT2);
L1=floor(l/2);
L11=floor(L1/2);
L12=ceil(L1/2);
L2=ceil(l/2);

block=[ones(2,L11),zeros(2,L2),ones(2,L12)];

psiT3=psiT2.*block;
psiR3=psiR2.*block;



figure(3)
plot(sum(psiT3.*conj(psiT3)));hold;plot(sum(psiR3.*conj(psiR3)),'r');hold;


IT1=sum(sum(psiT3.*conj(psiT3)))
IT2=sum(sum(psiT2.*conj(psiT2)))

IR1=sum(sum(psiR3.*conj(psiR3)))
IR2=sum(sum(psiR2.*conj(psiR2)))