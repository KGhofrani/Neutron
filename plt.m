%phi=pi/64;
%oper=[exp(i*phi) exp(i*phi) ; exp(-i*phi) -exp(-i*phi)];
e=exp(1);
psi0=[1;0];
b=pi/16;
oper=[e^i*b ,e^i*b;e^-i*b ,-e^-i*b]/sqrt(2);
[psiT,psiR]=Blade(oper,100,psi0);
psiT=sum(psiT);
psiR=sum(psiR);
Pt=angle(psiT);
Pr=angle(psiR);
figure(1);

subplot(1,2,1)
plot(1:length(Pt),Pt,'o')
xlabel('Node Number')
ylabel('Angle')
legend('Transmitted, pi/16')

subplot(1,2,2)
plot(1:length(Pr),Pr,'ro');

legend( 'Reflected, pi/16')
xlabel('Node Number')
ylabel('Angle')

title(a,'Rotation')