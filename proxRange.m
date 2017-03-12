% proximal operator of range constrant
%
% y = proxRange( x, range )
%
%Output parameter:
% y: output
%
%Input parameters:
% x: input
% range: [min_value, max_value] or [min_image, max_image]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = proxRange( x, range )

y = x;

if( numel(range) == 2 )
 y( y < range(1) ) = range(1);
 y( y > range(2) ) = range(2);
else

 r = range(:,:,1);
 ind = y < r;
 y( ind ) = r( ind );

 r = range(:,:,2);
 ind = y > r;
 y( ind ) = r( ind );

end


end
