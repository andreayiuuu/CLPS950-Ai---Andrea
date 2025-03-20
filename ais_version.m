count_trigrams = configureDictionary("string", "double");
total_trigrams = 0;
text = fileread('french.txt');
text = lower(text); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%

% % for i = 1:length(text) %length(number of files when reading multiple files w fileread
for j = 1:1:(length(text))-2 %from j being the first letter to being the third last letter because trigram is three letters%
    trigram = text(j:j+2);
    if isKey(count_trigrams, trigram)
       count_trigrams(trigram) = count_trigrams(trigram) + 1; 
    else 
       count_trigrams(trigram) = 1; 
    end
    total_trigrams = total_trigrams + 1;
end

trigram_freq = dictionary("string", "double");
keys_List = keys(count_trigrams); 
for i = 1:length(keys_List)
     key = keys_List{i};
     count_val = count_trigrams(key);
     trigram_freq(key) = count_val/total_trigrams;
end
disp(trigram_freq);

% %still need to save this data as a file but i want to run it first%
trigram_freq_struct = struct('Keys',key, 'Frequency',trigram_freq);
save('english_trigram_freq.mat', 'trigram_freq') %saves english dataset as its own%

english_keys = ["the","she","are"];
english_trigrams = configureDictionary("string", "double");

for i = 1:length(english_keys)
    key = english_keys(i);
    if isKey(count_trigrams,key)
        english_trigrams(key)=count_trigrams(key);
    else 
        english_trigrams(key) = 0;
    end
end
disp(english_trigrams)

% finding trigram with max frequency for english trigrams 
max_english_freq = max(values(english_trigrams));

spanish_keys = ["del","est","nte"];
spanish_trigrams = configureDictionary("string", "double");
for i = 1:length(spanish_keys)
    key = spanish_keys(i);
    if isKey(count_trigrams,key)
        spanish_trigrams(key)=count_trigrams(key);
    else 
        spanish_trigrams(key) = 0;
    end
end
disp(spanish_trigrams)
max_spanish_freq = max(values(spanish_trigrams));

french_keys = ["ait","ion","eur"];
french_trigrams = configureDictionary("string", "double");
for i = 1:length(french_keys)
    key = french_keys(i);
    if isKey(count_trigrams,key)
        french_trigrams(key)=count_trigrams(key);
    else 
        french_trigrams(key) = 0;
    end
end
disp(french_trigrams)
max_french_freq = max(values(french_trigrams));

if (max_english_freq > max_spanish_freq) && (max_english_freq > max_french_freq)
    disp("English")
elseif (max_spanish_freq > max_english_freq) && (max_spanish_freq > max_french_freq)
    disp("Spanish")
else
    disp("French")
end







