function X = SolveQFormFreq( Ks, LCKs, Ys )

s = size(Ys);
X = zeros(s(1), s(2), s(3));

for j=1:s(3)

 K2 = LCKs .* Ks;
 K2 = sum( K2, 4 );

 YK = LCKs .* Ys(:,:,j,:);
 YK = sum( YK, 4 );

 X(:,:,j) = YK ./ K2;

end

end
