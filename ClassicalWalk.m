clc
clear all
Had=[1 1 ; 1 1] / 2;
m=200;
[psiT,psiR]=Blade(Had,m,(1/sqrt(2)*[1;1]));
PSI=sum(psiT+psiR);
n=(200-length(PSI))/2
PSI=[zeros(1,n),PSI, zeros(1,n)];
plot(PSI)