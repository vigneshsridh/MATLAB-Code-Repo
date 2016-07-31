function image_feats = get_bags_of_sifts_multi(image_paths, vocab)

N = size(image_paths,1);
V = size(vocab,1);
image_feats = zeros(N , V);
for i = 1:N
    I = single(imread(image_paths{i}));
    [loc, desc] = vl_dsift(I, 'step', 4);
    D = vl_alldist2(vocab', double(desc));
    [M Ind] = min(D);
    image_feats(i,:) = histcounts(Ind(1,:), V);
%     for j = 1: size(desc,2)
%         image_feats(i, Ind(1,j)) = image_feats(i, Ind(1,j)) + 1;
%     end
    image_feats(i,:) = image_feats(i,:) / sum(image_feats(i,:));
end

end