img = double(imread('imgs/girl.png'));

alpha = 2;

L2lambdas = [1, 10, 100, 1000];
L1lambdas = [1, 10, 100, 1000];
out = cell(numel(L2lambdas), numel(L1lambdas));
for i=1:numel(L2lambdas)
 for j=1:numel(L1lambdas)
  fprintf('.');
  out{i,j} = L2L1enhance( img, alpha, L2lambdas(i), L1lambdas(j) );
  imwrite(uint8(out{i,j}), sprintf('imgs/demo_L2L1enhance_%d_%d.png', i, j ) );
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

