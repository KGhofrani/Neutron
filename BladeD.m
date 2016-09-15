function [ psiT,psiR ] = BladeD(Oper, n, psi0,std, p)


psi=[psi0,zeros(2,n-1)];


for w=1:length(psi)
    random=rand();
    if random<p
        phase=std*randn(1);
        phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
        Ope=phaseshift*Oper;
        psi(:,w)=Ope*psi(:,w);
    else
        psi(:,w)=Oper*psi(:,w);
    end
    
end


for j=1:n-1
    for w=1:length(psi)
        random=rand();
        if random<p
            phase=std*randn(1);
            phaseshift=[exp(1i*phase) , 0 ; 0, exp(-1i*phase)];
            Ope=phaseshift*Oper;
            psi(:,w)=Ope*psi(:,w);
        else
            psi(:,w)=Oper*psi(:,w);
        end
        
    end
    
    psiR=[zeros(1,length(psi(2,:)));psi(2,:)];
    psiT=[psi(1,:);zeros(1,length(psi(2,:)))];
    
end


