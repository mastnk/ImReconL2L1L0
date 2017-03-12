% L1L10deblur deblurs input image with gradient L1 and L0 norm constraint
%
% dst = L1L10deblur( src, blrker, L1lambda, L0lambda, padsize, range, itr, th, rho, verbose )
%
%Output arguments:
% dst: output deblurred image
%
%Input arguments:
% src: input blurred image
% blrker: blur kernel
% L1lambda: constraint parameter for L1 norm
% L0lambda: constraint parameter for L0 norm
% padsize: padding size (default: [18, 18])
% range: intensity range (default: [-inf, inf])
% itr: max iteration number (default: 128)
% th: stoping critera (default: 1E-3)
% rho: parameter for the ADMM (default: 1)
% verbose: 0:silent, 1:print information (default: 0)
%
%Example:
%  img = double(imread('lena.png'));
%  mot = fspecial('motion', 9, deg2rad(-30));
%  out = L1L0deblur( img, mot, L1lambda, L0lambda );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = L1L10deblur( src, blrker, L1lambda, L0lambda, padsize, range, itr, th, rho, verbose )

if( ~exist('range', 'var') || isempty(range) )
 padsize = [8, 8];
end

if( ~exist('range', 'var') || isempty(range) )
 range = [-inf,inf];
end

if( ~exist('itr', 'var') || isempty(itr) )
 itr = 128;
end

if( ~exist('th', 'var') || isempty(th) )
 th = 1E-3;
end

if( ~exist('rho', 'var') || isempty(rho) )
 rho = 1;
end

if( ~exist('verbose', 'var') || isempty(verbose) )
 verbose = 0;
end



L2 = cell(1,1);
L1 = cell(2,1);
L0 = cell(2,1);

L2{1}.y = src;
L2{1}.k = blrker;
L2{1}.lambda = 1;

ker=cell(2,1);
[ker{1}, ker{2}] = getDhv();

for i=1:2
 L1{i}.k = ker{i};
 L1{i}.lambda = L1lambda;
 
 L0{i}.k = ker{i};
 L0{i}.lambda = L0lambda;
end

dst = ImReconL2L1L0( L2, L1, L0, range, padsize, src, rho, itr, th, verbose );

end
