function [ psiT,psiR ] = BladeD2(Oper, n1, n2, n3, n4, n5, psi0, std1,std2,std3, std4, std5)
%decoherence in the middle of the blade


psi=[psi0,zeros(2,n1+n2+n3+n4+n5-1)];


    for w=1:length(psi)

    phase=std1*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end

    
for j=1:n1-1
    for w=1:length(psi)
        
    phase=std1*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

    
for j=1:n2
    for w=1:length(psi)
        
    phase=std2*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

for j=1:n3
    for w=1:length(psi)
        
    phase=std3*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

for j=1:n4
    for w=1:length(psi)
        
    phase=std4*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

for j=1:n5
    for w=1:length(psi)
        
    phase=std5*randn(1);
    phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
    Ope=phaseshift*Oper;
    psi(:,w)=Ope*psi(:,w);
    
    end
    psi(2,:)=circshift(psi(2,:)',1)';
end

psiR=[zeros(1,length(psi(2,:)));psi(2,:)];
psiT=[psi(1,:);zeros(1,length(psi(2,:)))];


end


