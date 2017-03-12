% getDhv gives horizontal and vertical forward difference kernels
%
% [kerH, kerV] = getDhv()
%
%Output parameter:
% kerH: horizontal forward difference kernel
% kerV: vertical forward difference kernel
%
%        |0  0 0|          |0  0 0|
% kerH = |0 -1 1|,  kerV = |0 -1 0|
%        |0  0 0|          |0  1 0|

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [kerH, kerV] = getDhv()

kerV = zeros(3,3);
kerV(2,2)=-1;
kerV(3,2)=1;
kerH = kerV';

end
