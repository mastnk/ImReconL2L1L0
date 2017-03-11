function y = proxL1( x, rho )
 y = wthresh(x, 's', 1.0/rho);
end
