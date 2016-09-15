%This function calculates contrast

function [ C] = cont( D )
Max1=max(D);
Min1=min(D);

C=(Max1-Min1)./(Max1+Min1);

end

