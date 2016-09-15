function [ psiT,psiR ] = BladeDen( Ope, n, psi0, p )


U=Ope;

for k=1:2:length(psi0) 
    psi(k:k+1,:)=[0,exp(-p); exp(-p), 0] .* (U * (psi0(k:k+1,:)* U')); %this loop goes throught the wave function and applies the opertator
end


for j= 1:n-1
    
 
for k=1:2:length(psi) 
    psi(k:k+1,:)=[0,exp(-p); exp(-p), 0] .* (U*(psi(k:k+1,:)*U')); %this loop goes throught the wave function and applies the opertator
end

psi=[psi ;0 0 ; 0 0];

psi(:,2)=circshift(psi(:,2),2);
    
end

psiT=psi(:,1);
psiR=psi(:,2);

end

