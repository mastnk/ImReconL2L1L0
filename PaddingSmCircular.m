% fft2ker calcuate the FFT transform for the kernel of the convolution
%
% dst = PaddingSmCircular( src, padsize, itrMax, th, al )
%
%
%Output parameter:
% dst: padded output image
%
%
%Input parameters:
% src : input image
% padsize : padding size
% itrMax : max iteration number (default: 30)
% th : threshold ofr the stopping criteria (default: 1E-3)
% al : alpha (default: 1.9)
%
%
%Example:
% img = double(imread('img.jpg'));
% padsize = [8, 8];
% img_padding = PaddingSmCircular( img, padsize );
%
%
%Version: 20160831

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities for FFT                                        %
%                                                          %
% Copyright (C) 2016 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = PaddingSmCircular( src, padsize, itrMax, th, al )

if( ~exist('itrMax' ) )
 itrMax = 30;
end

if( ~exist('th') )
 th = 1E-3;
end

if( ~exist('al') )
 al = 1.9;
end

dst = padarray( src, padsize, 'replicate' );
dst = UpdatingSmCircular( dst, padsize, itrMax, th, al );
