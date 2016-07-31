function image_feats = gist_added(image_paths, vocab)

N = size(image_paths,1);
V = size(vocab,1);
V1 = V + 512;
image_feats = zeros(N , V);

for i = 1:N
    I = single(imread(image_paths{i}));
    image_feats(i, :) = one_image_bag_of_feats(I, vocab);
end