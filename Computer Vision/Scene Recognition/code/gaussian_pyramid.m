function image_feats = gaussian_pyramid(image_paths, vocab)

sigma = sqrt(2);
vote_weight = 1/sqrt(2);
N = size(image_paths,1);
V = size(vocab,1);
V1 = V + 512;
image_feats = zeros(N , V1);

for i = 1:N
    Im = imread(image_paths{i});
    temp = zeros(4, V1);
    for j = 0:3
        if j ==0
            I = single(Im);
        else
            f = fspecial('Gaussian', 21, (2^(j-1))*sigma);
            I = single(imfilter(Im, f));
        end
        temp(j+1,:) = one_image_bag_of_feats(I, vocab);
    end
    image_feats(i,:) = temp(1,:) + vote_weight*temp(2,:) + (vote_weight/2)*temp(3,:) + (vote_weight/4)*temp(4,:);
    image_feats(i,:) = image_feats(i,:) / sum(image_feats(i,:));

end

end

