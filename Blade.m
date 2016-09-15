function [ psiT,psiR ] = Blade(Ope, n, psi0)

psi=[psi0,zeros(2,n-1)];
psi=Ope*psi;

for j=1:n-1
    psi(2,:)=circshift(psi(2,:)',1)';
    psi=Ope*psi;

end

psiR=[zeros(1,length(psi(2,:)));psi(2,:)];
psiT=[psi(1,:);zeros(1,length(psi(2,:)))];

end


