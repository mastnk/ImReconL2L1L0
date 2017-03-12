% L2L1enhance enhance image 
%
% dst = L2L1enhance( src, alpha, L2lambda, L1lambda, padsize, range, itr, th, rho, verbose 
%
%Output arguments:
% dst: output enhanced image
%
%Input arguments:
% src: input blurred image
% alpha: enhance parameter
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
%  out = L1L0enhance( img, alpha, L1lambda, L0lambda );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = L2L1enhance( src, alpha, L2lambda, L1lambda, padsize, range, itr, th, rho, verbose )
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

ker=cell(2,1);
der = cell(2,1);
[ker{1}, ker{2}] = getDhv();

for i=1:2
 d{i} = imfilter( src, ker{i}, 'replicate' );
 d{i} = d{i} * alpha;
end


if( L2lambda > 0 )
 L2 = cell(3,1);
 
 for i=1:2
  L2{i+1}.y = d{i};
  L2{i+1}.k = ker{i};
  L2{i+1}.lambda = L2lambda;
 end

else
 L2 = cell(1,1);
end

L1 = cell(2,1);

L2{1}.y = src;
L2{1}.k = 1;
L2{1}.lambda = 1;

for i=1:2
 L1{i}.y = d{i};
 L1{i}.k = ker{i};
 L1{i}.lambda = L1lambda;
end

dst = ImReconL2L1L0( L2, L1, [], range, padsize, src, rho, itr, th, verbose );

end

