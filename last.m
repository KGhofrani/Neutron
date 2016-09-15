figure(1)
[X,Y]=meshgrid(-N/2+1:N/2,Phase);
mesh(X,Y,TT.*conj(TT))
colorbar
view(2);
xlabel('Node')
ylabel('Rotaion [rads]')
zlabel('Intensity')
grid off
axis tight

figure(2)

mesh(X,Y,RR.*conj(RR))
colorbar
view(2);
xlabel('Node')
ylabel('Rotaion [rads]')
zlabel('Intensity')
grid off
axis tight

figure(3) 
plot(Phase, sum((RR.*conj(RR))'))
hold
plot(Phase, sum((TT.*conj(TT))'),'r')
hold
legend('Reflected', 'Transmitted')
xlabel('Rotation [rads]')
ylabel('Intensity')
axis tight