function multiple_vocab(image_paths)

vocab_size = [20 50 100 200 400 1000];
for i = 1: length(vocab_size)
    vocab = build_vocabulary(image_paths, vocab_size(i));
    file_name = strcat('vocab', int2str(vocab_size(i)), '.mat');
    save(file_name, 'vocab');
end

end