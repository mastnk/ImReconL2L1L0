function [kerH, kerV] = getDhv()

kerV = zeros(3,3);
kerV(2,2)=-1;
kerV(3,2)=1;
kerH = kerV';

end
