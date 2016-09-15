
clc
%%Flags
FT=1;
FR=1;
FTT=1;
FTR=1;
FRR=1;
FRT=1;
FTRT=1;
FTRR=1;
FRTR=1;
FRTT=1;

psi=[1 0]'; %initial state 

F=[0 1; 1 0]; %flipping operator

%p =0.7307;

 %number of planes
n=100;
p=0.5;
I=100;

% Y=zeros(I, 
STD=linspace(0, 1, 10);
beta=10;
for alpha=1:beta
for q=1:length(STD)
    
std=STD(q);

for s=1:100
theta=2*pi*s/200;
FR=exp(1i*theta);
FT=exp(-1i*theta);
phi=0;    
psi=[1;0];
% phi = s*2*pi/300;

Had=[sqrt(p) exp(1i*phi)*sqrt(1-p) ;exp(-1i*phi)*sqrt(1-p)  -sqrt(p)]; %plane operator


%%%%%%%%%%%%%
%first blade%
%%%%%%%%%%%%%

[psiT,psiR]=Blade2(Had,n,psi, std);


psiT=FT.*psiT; %selecting the reflected beam
psiR=FR.*psiR; %selecting the transmited beam
csvwrite(strcat('psiT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiT)
csvwrite(strcat('psiR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiR)


%%%%%%%%%%%%%%%
%Second blades%
%%%%%%%%%%%%%%%


[psiTT,psiTR]=Blade2(Had,n,psiT, std);

psiTT=FTT*psiTT; %selecting the reflected beam
psiTR=FTR*psiTR; %selecting the transmited beam
csvwrite(strcat('psiTT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiTT)
csvwrite(strcat('psiTR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiTR)

[psiRT,psiRR]=Blade2(Had,n,psiR, std);

psiRT=FRT*psiRT; %selecting the reflected beam
psiRR=FRR*psiRR; %selecting the transmited beam

csvwrite(strcat('psiRT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiRT)
csvwrite(strcat('psiRR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiRR)
%%%%%%%%%%%%%
%Third blade%
%%%%%%%%%%%%%


[psiRTT,psiRTR]=Blade2(Had,n,psiRT, std);

psiRTT=FRTT.*psiRTT;
psiRTR=FRTR.*psiRTR;
csvwrite(strcat('psiRTT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiRTT)
csvwrite(strcat('psiRTR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiRTR)

[psiTRT,psiTRR]=Blade2(Had,n,psiTR, std);

psiTRT=FTRT.*psiTRT;
psiTRR=FTRR.*psiTRR;
csvwrite(strcat('psiTRT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiTRT)
csvwrite(strcat('psiTRR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiTRR)
%%%%%%%%%%%%%
%Forth blade%
%%%%%%%%%%%%%

psiX=psiTRT+psiRTR;


[psiXT,psiXR]=Blade2(Had,n+1,psiX, std);
csvwrite(strcat('psiXT_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiXT)
csvwrite(strcat('psiXR_numplanes_4blade_', int2str(n),'_std_', num2str(std)), psiXR)

D(1,s)=sum((psiXT(1,:).*conj(psiXT(1,:))));
D(2,s)=sum((psiXR(2,:).*conj(psiXR(2,:))));


end
CT(q)=cont(D(1,:)/sum(D(1,:)));
CR(q)=cont(D(2,:)/sum(D(2,:)));


end

if alpha == 1
    C1=CT;
    C2=CR;
else
    C1=C1+CT/beta;
    C2=C2+CR/beta;
end
end

plot(D(1,:))

