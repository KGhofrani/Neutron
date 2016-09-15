R=RR.*conj(RR);
R00=R(990,:);
R200=R(200,:);
R500=R(500,:);
R700=R(700,:);
R900=R(900,:);
figure(1)
plot(-200:199,R200,-200:199,R500,-200:199,R700,-200:199,R900,-200:199,R00,'LineWidth',1.5)
legend('2/10 Pi','5/10 Pi','7/10 Pi','9/10 Pi','99/100 Pi')
xlabel('Position')
ylabel('Intensity')