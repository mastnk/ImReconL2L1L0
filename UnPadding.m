function dst = UnPadding(src, padsize)
 dst = src( padsize(1)+1:size(src,1)-padsize(1), padsize(2)+1:size(src,2)-padsize(2), : );
end
