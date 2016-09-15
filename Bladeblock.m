function [ psiT,psiR ] = Bladeblock(Ope, n, psi0)

psi=[psi0,zeros(2,n-1)];
psi=Ope*psi;

N1=floor(n/2);
N2=ceil(n/2);                 


for j=1:(N1-1)
    psi(2,:)=circshift(psi(2,:)',1)';
    psi=Ope*psi;

end


l=length(psi);
L1=floor(l/2);
L11=floor(L1/2);
L12=ceil(L1/2);
L2=ceil(l/2);

block=[ones(2,L11),zeros(2,L2),ones(2,L12)];
psi=psi.*block;


for j=1:N2
    psi(2,:)=circshift(psi(2,:)',1)';
    psi=Ope*psi;

end

psiR=[zeros(1,length(psi(2,:)));psi(2,:)];
psiT=[psi(1,:);zeros(1,length(psi(2,:)))];

end


