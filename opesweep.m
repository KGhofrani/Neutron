clc
clear all
Phase=linspace(0.5,pi-0.5,1000);

N=100;
psi0=[1;0];


for n=1:length(N)

for i=1:length(Phase);
    phase=Phase(i);
   ope=[cos(phase/2),1i*sin(phase/2) ; 1i*sin(phase/2), cos(phase/2)];
   %ope=[1 1; 1 -1]/sqrt(2);
   [ psiT,psiR ] = Blade(ope, N(n), psi0);
   T(i)=max(sum(psiT.*conj(psiT)));
   R(i)=max(sum(psiR.*conj(psiR)));
   
   TT(i,:)=psiT(1,:);
   RR(i,:)=psiR(2,:);
    
end


QT(n,:)=T;
QR(n,:)=R;


end
figure(1)
[X,Y]=meshgrid(-N/2+1:N/2,Phase);
h=surf(X,Y,TT.*conj(TT));
set(h,'edgecolor','none');
colormap(summer)
colorbar
view(2);
xlabel('Node')
ylabel('Rotaion [rads]')
zlabel('Intensity')
grid off
axis tight
print('TT', '-dpng', '-r600'); %<-Save as PNG with 300 DPI

figure(2)

h=surf(X,Y,RR.*conj(RR));
colormap(flipud(gray))
set(h,'edgecolor','none');

colorbar
view(2);
xlabel('Node')
ylabel('Rotaion [rads]')
zlabel('Intensity')
grid off
axis tight

print('RR', '-dpng', '-r600'); %<-Save as PNG with 300 DPI

figure(3) 
plot(Phase, sum((RR.*conj(RR))'))
hold
plot(Phase, sum((TT.*conj(TT))'),'r')
hold
legend('Reflected', 'Transmitted')
xlabel('Rotation [rads]')
ylabel('Intensity')
axis tight