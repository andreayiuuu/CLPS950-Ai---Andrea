% Initialize dictionary to count trigrams
count_trigrams = dictionary('KeyType', 'char', 'ValueType', 'double');
total_trigrams = 0;

% Read and preprocess text
text = fileread('english.txt');
text = lower(text); % Convert to lowercase
text = regexprep(text, '[^a-z]', ''); % Remove non-alphabetic characters

% Count trigrams efficiently
text_length = length(text);
for j = 1:text_length-2
    trigram = text(j:j+2); % Extract trigram
    if isKey(count_trigrams, trigram)
        count_trigrams(trigram) = count_trigrams(trigram) + 1;
    else
        count_trigrams(trigram) = 1;
    end
    total_trigrams = total_trigrams + 1;
end

% Calculate trigram frequencies
trigram_freq = dictionary('KeyType', 'char', 'ValueType', 'double');
keys_List = keys(count_trigrams);
for i = 1:length(keys_List)
    key = keys_List{i}; % Access each key
    count_val = count_trigrams(key); % Get trigram count
    trigram_freq(key) = count_val / total_trigrams; % Calculate frequency
end

% Display trigram frequencies
disp(trigram_freq);

% Save the frequency data
trigram_freq_struct = struct(trigram_freq); % Convert dictionary to struct
save('english_trigram_freq.mat', 'trigram_freq_struct'); % Save as .mat file
