function y = proxL0( x, rho )
 y = wthresh(x, 'h', sqrt(2.0/rho) );
end
