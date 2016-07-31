function special_script(train_image_paths, test_image_paths)

load('vocab400.mat');

train_image_feats = spatial_pyramid(train_image_paths, vocab);
save('train_bags_spatial_gist_400.mat', 'train_image_feats');
test_image_feats = spatial_pyramid(test_image_paths, vocab);
save('test_bags_spatial_gist_400.mat', 'test_image_feats');

train_image_feats = gaussian_pyramid(train_image_paths, vocab);
save('train_bags_gaussian400.mat', 'train_image_feats');
test_image_feats = gaussian_pyramid(test_image_paths, vocab);
save('test_bags_gaussian400.mat', 'test_image_feats');

train_image_feats = soft_assignment_bags(train_image_paths, vocab);
save('train_bags_soft400.mat', 'train_image_feats');
test_image_feats = soft_assignment_bags(test_image_paths, vocab);
save('test_bags_soft400.mat', 'test_image_feats');


end