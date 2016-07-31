function multiple_bag_of_feats(train_image_paths, test_image_paths)

sizes = [10, 20, 50, 100, 200, 400, 1000];
for i = 1: length(sizes)
    file_name = strcat('vocab', int2str(sizes(i)), '.mat');
    load(file_name);
    train_image_feats = get_bags_of_sifts_multi(train_image_paths, vocab);
    train_file_name = strcat('train_get_bags_' , int2str(sizes(i)), '.mat');
    save(train_file_name, 'train_image_feats');
    test_image_feats = get_bags_of_sifts_multi(test_image_paths, vocab);
    test_file_name = strcat('test_get_bags_' , int2str(sizes(i)), '.mat');
    save(test_file_name, 'test_image_feats');
end


end