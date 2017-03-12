img = double(imread('imgs/girl.png'));

L1lambdas = [0, 10, 50, 100];
L0lambdas = [0, 10^2, 50^2, 100^2];
out = cell(numel(L1lambdas), numel(L0lambdas));
for i=1:numel(L1lambdas)
 for j=1:numel(L0lambdas)
  fprintf('.');
  out{i,j} = L1L0filter( img, L1lambdas(i), L0lambdas(j) );
  imwrite(uint8(out{i,j}), sprintf('imgs/demo_L1L0filter_%d_%d.png', i, j ) );
 end
end
fprintf('\n');

k = 1;
for i=1:numel(L1lambdas)
 for j=1:numel(L0lambdas)
  subplot(numel(L1lambdas), numel(L0lambdas), k);
  imshow( uint8(imresize(out{i,j}, 2, 'nearest')) );
  k = k + 1;
 end
end

