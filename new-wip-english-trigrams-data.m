% english 
% count_trigrams = dictionary('KeyType', 'char', 'ValueType', 'double'); 
% if ischar(filename)
%     filename = {filename};
% end

%count_trigrams = dictionary(["the", "are", "she"], [0,0,0])%ai and i tried this today to fix isKey.
count_trigrams = configureDictionary("string", "double");
total_trigrams = 0;
text = 'today i Went to the beach!!!';
for i = 1:1 %length(number of files when reading multiple files w fileread
    
    text = lower(text); %lowercase, important because the trigrams should not be case sensitive%
    text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%
    for j = 1:1:length(text)-2 %from j being the first letter to being the third last letter because trigram is three letters%
        trigram = text(j:j+2);
        if isKey(count_trigrams, trigram)
            count_trigrams(trigram) = count_trigrams(trigram) + 1; 
        else 
            count_trigrams(trigram) = 1; 
        end
        total_trigrams = total_trigrams + 1;
    end
end

trigram_freq = configureDictionary("string", "double");
keys_List = keys(count_trigrams); 
for i = keys_List
    count_val = count_trigrams(i);
    trigram_freq(i) = count_val/total_trigrams;
end
disp(trigram_freq)

%still need to save this data as a file but i want to run it first%

save('english_trigram_freq.mat', 'trigram_freq') %saves english dataset as its own%
