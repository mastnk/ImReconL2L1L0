% seamless padding
%
% dst = UpdatingSmCircular( paddedsrc, padsize, itrMax, th, al )
%
%Output parameter:
% dst: padded output image
%
%Input parameters:
% paddedsrc : padded input image
% padsize : padding size
% itrMax : max iteration number (default: 30)
% th : threshold ofr the stopping criteria (default: 1E-3)
% al : alpha (default: 1.9)
%
%Example:
% img = double(imread('img.jpg'));
% padsize = [8, 8];
% img_padding = PaddingSmCircular( img, padsize );
% img_padding = UpdatingSmCircular( img_padding, padsize );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                          %
% Copyright (C) 2017                                       %
%                    Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = UpdatingSmCircular( paddedsrc, padsize, itrMax, th, al )

if( ~exist('itrMax' ) )
 itrMax = 30;
end

if( ~exist('th') )
 th = 1E-3;
end

if( ~exist('al') )
 al = 1.9;
end

if( padsize(1) > 0 & padsize(2) > 0 )

if( ndims(paddedsrc) == 2 )
  dst = gryPaddingCircular( paddedsrc, padsize, itrMax, th, al );
else
 for cha=1:size(paddedsrc,3)
  dst(:,:,cha) = gryPaddingCircular( paddedsrc(:,:,cha), padsize, itrMax, th, al );
 end
end

else
    dst = paddedsrc;
end





function dst = gryPaddingCircular( src, padsize, itrMax, th, al )

dst = src;
nrow = size(dst,1);
ncol = size(dst,2);

df0 = 1E32;
dst0 = dst;

for i=1:itrMax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for row=padsize(1):-1:2
  col = 1;
  d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,ncol) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
  
  for col=2:ncol-1
   d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
   dst( row, col ) = dst( row, col ) + al * d;
  end
  
  col = ncol;
  d = ( dst(row+1,col) + dst(row,1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 row = 1;
 col = 1;
 
 d = ( dst(row+1,col) + dst(row,col+1) + dst(nrow,col) + dst(row,ncol) ) / 4 - dst(row,col);
 dst( row, col ) = dst( row, col ) + al * d;
 
 for col=2:ncol-1
  d = ( dst(row+1,col) + dst(row,col+1) + dst(nrow,col) + dst(row,col-1) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
 end
 
 col = ncol;
 d = ( dst(row+1,col) + dst(row,1) + dst(nrow,col) + dst(row,col-1) ) / 4 - dst(row,col);
 dst( row, col ) = dst( row, col ) + al * d;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 for row=padsize(1)+1:nrow-padsize(1)

  for col=padsize(2):-1:2
   d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
   dst( row, col ) = dst( row, col ) + al * d;
  end
  
  col = 1;
  d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,ncol) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
  
  for col = ncol-padsize(1)+1:ncol-1
   d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
   dst( row, col ) = dst( row, col ) + al * d;
  end
  
  col = ncol;
  d = ( dst(row+1,col) + dst(row,1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
  
 end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 for row=nrow-padsize(1)+1:nrow-1
  col = 1;
  d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,ncol) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
  
  for col=2:ncol-1
   d = ( dst(row+1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
   dst( row, col ) = dst( row, col ) + al * d;
  end
  
  col = ncol;
  d = ( dst(row+1,col) + dst(row,1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
  
 end
 
 row = nrow;
 col = 1;
 d = ( dst(1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,ncol) ) / 4 - dst(row,col);
 dst( row, col ) = dst( row, col ) + al * d;
  
 for col=2:ncol-1
  d = ( dst(1,col) + dst(row,col+1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
  dst( row, col ) = dst( row, col ) + al * d;
 end
  
 col = ncol;
 d = ( dst(1,col) + dst(row,1) + dst(row-1,col) + dst(row,col-1) ) / 4 - dst(row,col);
 dst( row, col ) = dst( row, col ) + al * d;

 dif = abs(dst-dst0);
 df = max(dif(:));
 
 dif = abs(dst-dst0);
 df = max(dif(:));
 if( abs(df0 - df)/df0 < th )
  break;
 end
 dst0 = dst;
 df0 = df;

end


