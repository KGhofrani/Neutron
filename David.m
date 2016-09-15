

[ psit1,psir1 ] = Blade2([1 1;1 -1]/sqrt(2), 500, [1;0], 0);
R=sum(psir1.*conj(psir1));


subplot(1,3,1)
plot(R)
title('sigma=0')
axis([0 500 0 0.015])

subplot(1,3,2)
plot(R2)
title('sigma=0.2')
axis([0 500 0 0.015])

subplot(1,3,3)
plot(R3)
title('sigma=0.5')
axis([0 500 0 0.015])
