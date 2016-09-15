function [ psiT,psiR ] = BladeD1(Oper, n1, n2, n3, psi0, std)
%Decoherence on the outside of the blade

[psiT,psiR]=Blade2(Oper,n1,psi0,std);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade(Oper,n2,x);
x=[psiT+psiR,[0 ; 0]];
x(2,:)=circshift(x(2,:)',1)';
[psiT,psiR]=Blade2(Oper,n3,x,std);

end