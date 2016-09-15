clear all

%%Flags
FT=1;
FR=1;
FTT=1;
FTR=1;
FRR=1;
FRT=1;
psi=[1 0]'; %initial state 

p =0.5;%0.0422;

I=100;


tic
n=3;

Q=zeros(I,3*n-2);

Q2=zeros(I,3*n-2);

for s=1:I
theta=2*pi*s/100;
FR=exp(1i*theta);
FT=exp(-1i*theta);
phi=0;    
psi=[1;0];
% phi = s*2*pi/300;

Had=(1/sqrt(2))*[1 -1i ; -1i 1];%[sqrt(p) exp(1i*phi)*sqrt(1-p) ;exp(-1i*phi)*sqrt(1-p)  -sqrt(p)]; %plane operator

%%%%%%%%%%%%%
%first blade%
%%%%%%%%%%%%%

[psiT,psiR]=Blade(Had,n,psi);

psiT=FT.*psiT; %selecting the reflected beam
psiR=FR.*psiR; %selecting the transmited beam

%%%%%%%%%%%%%%%
%Second blades%
%%%%%%%%%%%%%%%

[psiTT,psiTR]=Blade(Had,n,psiT);

psiTT=FTT*psiTT; %selecting the reflected beam
psiTR=FTR*psiTR; %selecting the transmited beam

[psiRT,psiRR]=Blade(Had,n,psiR);


psiRT=FRT*psiRT; %selecting the reflected beam
psiRR=FRR*psiRR; %selecting the transmited beam

psiX=psiRT+psiTR;

%%%%%%%%%%%%%
%Third blade%
%%%%%%%%%%%%%
[psiXT,psiXR]=Blade(Had,n,psiX);

% figure(1)
% subplot(2,1,1)
% plot(real(sum(psiXT)))
% hold
% plot(imag(sum(psiXT)),'r')
% hold
% axis([0, length(psiXR), -0.15, 0.15])
% 
% subplot(2,1,2)
% 
% plot(real(sum(psiXR)))
% hold
% plot(imag(sum(psiXR)),'r')
% hold
% axis([0, length(psiXR), -0.1, 0.1])
% 
% 
% 
% figure(2)
% 
% subplot(2,1,1)
% plot(real(sum(psiT)))
% hold
% plot(imag(sum(psiT)),'r')
% hold
% axis([0, length(psiR), -0.3, 0.3])
% 
% subplot(2,1,2)
% 
% plot(real(sum(psiR)))
% hold
% plot(imag(sum(psiR)),'r')
% hold
% axis([0, length(psiR), -0.3, 0.3])
% 
% 
% figure(3)
% 
% subplot(2,1,1)
% plot(real(sum(psiTR)))
% hold
% plot(imag(sum(psiTR)),'r')
% hold
% axis([0, length(psiTR), -0.3, 0.3])
% 
% subplot(2,1,2)
% 
% plot(real(sum(psiRT)))
% hold
% plot(imag(sum(psiRT)),'r')
% hold
% axis([0, length(psiRT), -0.3, 0.3])
% 
% 
% 
% [T1,R1]=Blade(Had, 100, psiRT);
% [T2,R2]=Blade(Had, 100, psiTR);
% 
% figure(4)
% 
% subplot(2,2,1)
% plot(real(sum(T1)))
% hold
% plot(imag(sum(T1)),'r')
% hold
% axis([0, length(T1), -0.3, 0.3])
% 
% subplot(2,2,2)
% 
% plot(real(sum(R1)))
% hold
% plot(imag(sum(R1)),'r')
% hold
% axis([0, length(R1), -0.3, 0.3])
% 
% subplot(2,2,3)
% 
% plot(real(sum(T2)))
% hold
% plot(imag(sum(T2)),'r')
% hold
% axis([0, length(T2), -0.3, 0.3])
% 
% subplot(2,2,4)
% 
% plot(real(sum(R2)))
% hold
% plot(imag(sum(R2)),'r')
% hold
% axis([0, length(R2), -0.3, 0.3])
% 
 D(1,s)=sum((psiXT(1,:).*conj(psiXT(1,:))));
D(2,s)=sum((psiXR(2,:).*conj(psiXR(2,:))));
% pause

Q1(s,:)=sum(psiXT);
Q2(s,:)=sum(psiXR);
end

CR=contrast(psiXR);
CT=contrast(psiXT);



C1=cont(D(1,:));
C2=cont(D(2,:));

toc

