% proximal operator of L1 norm
%
% y = proxL1( x, rho )
%
%Output parameter:
% y: output
%
%Input parameters:
% x: input
% rho: parameter
%
%Implementation:
% y = wthresh(x, 's', 1.0/rho)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = proxL1( x, rho )
 y = wthresh(x, 's', 1.0/rho);
end
