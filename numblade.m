clear all
clc
  psi0=1/sqrt(2)*[1;1i];
N=50;
Had=[1 1 ; 1 1] / 2;%sqrt(2);
En=N(end);
[psiTEn,psiREn]=Blade(Had,En,(1/sqrt(2)*[1;-1]));
Len=length(psiTEn);
PSIR=zeros(length(N),Len);
PSIT=PSIR;
for i=1:length(N-1)
    n=N(i)
    psi0=1/sqrt(2)*[1;1i];
    [psiT,psiR]=Blade(Had, n, psi0);
    E=size(psiT);
    U=Len-E(2);
    psiR=[zeros(1,floor(U/2)),psiR(2,:),zeros(1,ceil(U/2))];
    psiT=[zeros(1,floor(U/2)),psiT(1,:),zeros(1,ceil(U/2))];
    
%     psiR=(psiR.*conj(psiR));
%     psiT=psiT.*conj(psiT);
    plot(psiT);
    PSIR(i,:)=psiR;%./max(psiR);
    PSIT(i,:)=psiT;%./max(psiT);
end

% psiREn=psiREn(2,:).*conj(psiREn(2,:));
% psiTEn=psiTEn(1,:).*conj(psiTEn(1,:));
% 
% PSIR(end,:)=psiREn;%/max(psiREn);
% PSIT(end,:)=psiTEn;%/max(psiTEn);

%surf(PSIR+PSIT)
