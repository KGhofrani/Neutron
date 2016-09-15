Ope=[1 1 ; 1 -1]/sqrt(2);
[ psiT,psiR ] = BladeDen( Ope, 10, [ 1 0; 0 0], 0.0 );
psiT=extract(psiT);
psiR=extract(psiR);
plot(psiT.*conj(psiT))
hold
plot(psiR.*conj(psiR))
hold
