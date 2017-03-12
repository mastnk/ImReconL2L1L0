% flipker flips kernel
%
% dst = flipker( src )
%
%Output parameter:
% dst: fliped kernel
%
%Input parameters:
% src: kernel
%
%Implementation:
% dst = flipud( fliplr( src ) )


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = flipker( src )
 dst = flipud( fliplr( src ) );
end
