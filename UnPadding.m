% unpadding
%
% dst = UnPadding(src, padsize)
%
%Output parameter:
% dst: unpadded image
%
%Input parameters:
% src: padded image
% padsize : padding size
%
%Example:
% img = double(imread('img.jpg'));
% padsize = [8, 8];
% img_padding = PaddingSmCircular( img, padsize );
% out = UnPadding( img_padding, padsize );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = UnPadding(src, padsize)
 dst = src( padsize(1)+1:size(src,1)-padsize(1), padsize(2)+1:size(src,2)-padsize(2), : );
end
