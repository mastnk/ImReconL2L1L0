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
