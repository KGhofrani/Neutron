x=linspace(0,2*pi,200);

D1p=D1p/mean(sum(D1p));
D4p=D4p/mean(sum(D4p));
D5p=D5p/mean(sum(D5p));

plot(x, D1p(2,:),'o',x, D1p(1,:),  '-.', x, D4p(2,:), 'r', x,D4p(1,:),'g', x,D5p(2,:),':', x, D5p(1,:),'+')
legend('3Blade R','3Blade T', '4Blade R', '4Blade T', '5BladeR', '5BladeT')