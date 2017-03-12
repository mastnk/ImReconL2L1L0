img = double(imread('imgs/girl.png'));

mot = fspecial('motion', 9, deg2rad(-30));
blr = imfilter( img, mot, 'replicate');
blr = blr + randn(size(blr)) * 3;

L1lambdas = [1, 2, 4, 8];
L0lambdas = L1lambdas .^ 2;
out = cell(numel(L1lambdas), numel(L0lambdas));
for i=1:numel(L1lambdas)
 for j=1:numel(L0lambdas)
  fprintf('.');
  out{i,j} = L1L0deblur( img, mot, L1lambdas(i), L0lambdas(j) );
  imwrite(uint8(out{i,j}), sprintf('imgs/demo_L1L0deblur_%d_%d.png', i, j ) );
 end
end
fprintf('\n');

k = 1;
for i=1:numel(L2lambdas)
 for j=1:numel(L1lambdas)
  subplot(numel(L2lambdas), numel(L1lambdas), k);
  imshow( uint8(out{i,j}) );
  k = k + 1;
 end
end
