clc; clear all;
Ope= 1/sqrt(2) * [1 1 ; 1 -1];
n=100;
psi0=[0 ; 1];

[ psiT,psiR ] = Blade(Ope, n, psi0);

PSI=psiT+psiR
