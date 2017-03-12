% fft2ker calcuate the FFT transform for the kernel of the convolution
%
% K = fft2ker( ker, imgsize )
%
%Output parameter:
% K: Fourier transform of the kernel
%
%Input parameters:
% ker : the kernel matrix whose size must be the odd number
% imgsize: the size of the image to be processed
%
%Example:
% ker = zeros(3,3);
% ker(1,:) = 1/3;
% imgsize = [256, 256];
% K = fft2ker( ker, imgsize );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function K = fft2ker( ker, imgsize )

s = size(ker);
if( mod( s(1), 2 ) == 0 || mod( s(2), 2 ) == 0 )
 warning( 'The size of ker must be odd number' );
end

kersize = size( ker );

ker = padarray(ker, [imgsize(1)-kersize(1), imgsize(2)-kersize(2)], 0, 'post');

ker = circshift(ker, -(kersize(1)-1)/2, 1 );
ker = circshift(ker, -(kersize(2)-1)/2, 2 );

K = fft2( ker );

end
