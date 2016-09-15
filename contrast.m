%this function calculates contrast when the phase is pi/4

function [C] = contrast( psi )

imagen=sum(sum((imag(psi).*conj(imag(psi)))));
RE=sum(sum(real(psi).*real(psi)));

C= abs(((RE-imagen)/(RE+imagen)));

end

