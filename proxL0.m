% proximal operator of L0 norm
%
% y = proxL0( x, rho )
%
%Output parameter:
% y: output
%
%Input parameters:
% x: input
% rho: parameter
%
%Implementation:
% y = wthresh(x, 'h', sqrt(2.0/rho) )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = proxL0( x, rho )
 y = wthresh(x, 'h', sqrt(2.0/rho) );
end
