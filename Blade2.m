function [ psiT,psiR ] = Blade2(Oper, n, psi0,std)


psi=[psi0,zeros(2,n-1)];


    for w=1:length(psi)

    phase=std*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end

    
for j=1:n-1
    for w=1:length(psi)
        
    phase=std*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

psiR=[zeros(1,length(psi(2,:)));psi(2,:)];
psiT=[psi(1,:);zeros(1,length(psi(2,:)))];

end


