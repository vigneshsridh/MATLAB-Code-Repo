function image_feats = spatial_pyramid(image_paths, vocab)

N = size(image_paths,1);
V = size(vocab,1);
image_feats = zeros(N , (V + 512)*5);
V1 = V+512;
for i = 1:N
    I = single(imread(image_paths{i}));
    [m n] = size(I);
    m2 = floor(m/2);
    n2 = floor(n/2);
    image_feats(i, 1: V1 ) = one_image_bag_of_feats(I, vocab);
    image_feats(i, V1 + 1: 2*V1) = one_image_bag_of_feats(I(1: m2, 1: n2), vocab);
    image_feats(i, 2*V1 + 1: 3*V1) = one_image_bag_of_feats(I(1: m2, n2 + 1: n), vocab);
    image_feats(i, 3*V1 + 1: 4*V1) = one_image_bag_of_feats(I(m2 + 1: m, 1: n2), vocab);
    image_feats(i, 4*V1 + 1: 5*V1) = one_image_bag_of_feats(I(m2 + 1: m, n2 + 1: n), vocab);
end




end