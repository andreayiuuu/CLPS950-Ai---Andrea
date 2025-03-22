count_trigrams = configureDictionary("string", "double"); % makes a dictionary to store trigrams as keys and counts as values. 
total_trigrams = 0; % initializes number of total trigrams
text = fileread('french.txt'); % reads text file into a string 
text = lower(text); % turns all characters in text file to lowercase
text = regexprep(text, '[^a-z]', ''); % makes the text only letters 

 for j = 1:1:(length(text))-2 % loops through text file from 1st character to third to last character by increments of 1 
     trigram = text(j:j+2); % from j being the first letter to j+2 being the third last letter because trigram is three letters
     if isKey(count_trigrams, trigram) % checks to see if trigram is included in the dictionary, count_trigrams
        count_trigrams(trigram) = count_trigrams(trigram) + 1; % if it is, then the count of that trigram increases by 1
     else 
        count_trigrams(trigram) = 1; % if not, it adds the trigram to the dictionary with a count of 1. 
     end
     total_trigrams = total_trigrams + 1; % total trigram count increases by 1
 end

english_keys = ["the","she","are"]; % common english trigrams
english_trigrams = configureDictionary("string", "double");

for i = 1:length(english_keys) % loops from first english key to last english key
    key = english_keys(i); 
    if isKey(count_trigrams,key) % for each trigram in english_keys, checks if it's included within the count_trigrams dictionary
       english_trigrams(key)=count_trigrams(key); % if it is, copy its count into english_trigrams
    else 
        english_trigrams(key) = 0; % if not, set the count to 0. 
    end
end
disp(english_trigrams)% displays english trigram count in text file

% finds trigram with max counts for english trigrams 
max_english_count = max(values(english_trigrams));

% displays spanish trigram count in text file 
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
max_spanish_count = max(values(spanish_trigrams));

% displays french trigram count in text file 
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
max_french_count = max(values(french_trigrams));

% detecting language by comparing the max counts of trigrams for all
% three languages 
if (max_english_count > max_spanish_count) && (max_english_count > max_french_count)
    disp("English")
elseif (max_spanish_count > max_english_count) && (max_spanish_count > max_french_count)
    disp("Spanish")
else
    disp("French")
end







