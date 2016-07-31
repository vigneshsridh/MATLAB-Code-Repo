function cross_validation(train_image_feats, train_labels, test_image_feats, test_labels, categories)

sample_size = 200;
num_iter = 50;
N = size(test_image_feats,1);
accuracy = zeros(1, num_iter);
num_categories = length(categories);
for i = 1: num_iter
    rand = randsample(N, sample_size);
    temp_train_image_feats = train_image_feats(rand,:);
    temp_test_image_feats = test_image_feats(rand,:);
    temp_train_labels = train_labels(rand);
    temp_test_labels = test_labels(rand);
    temp_predicted_categories = svm_classify(temp_train_image_feats, temp_train_labels, temp_test_image_feats);
    
    confusion_matrix = zeros(num_categories, num_categories);
    for j=1:length(temp_predicted_categories)
        row = find(strcmp(temp_test_labels{j}, categories));
        column = find(strcmp(temp_predicted_categories{j}, categories));
        confusion_matrix(row, column) = confusion_matrix(row, column) + 1;
    end
    accuracy(i) = sum(diag(confusion_matrix))/ sample_size;
end

mean_accuracy = mean(accuracy);
fprintf('Mean accuracy = %.3f', mean_accuracy)
stdev_accuracy = std(accuracy);
fprintf('Standard deviation of accuracy = %.7f', stdev_accuracy)

figure();
x = 1:num_iter;
plot(x, accuracy);
title('Variations in accuracy');
end