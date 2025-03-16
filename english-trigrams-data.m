is[filename, location] = uigetfile('*.txt', 'select text files', 'MultiSelect', 'on')

count_trigrams = container.Map('KeyType', 'char', 'ValueType', 'double'); 
if ischar(filename)
    filename = {filename};
end

total_trigrams = 0;
for i = 1:length(filename)
file_path = fullfile(location, filename{i}); %gives full link of file and location%
text = fileread(file_path); %reads the text%
text = lower(text); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%
for j = 1:1:length(text)-2 %from j being the first letter to being the third last letter because trigram is three letters%
trigram = text(j:j+2);
if isKey(count_trigrams, trigram)
count_trigrams(trigram) = count_trigrams(trigram) + 1; 
else 
count_trigrams(trigram) = 1 
end
total_trigrams = total_trigrams + 1;
end
end

trigram_freq = container.Map('KeyType', 'char', 'ValueType', 'double')
keys_List = key(count_trigrams); 
for i = 1:length(key_list);
trigram_freq = count_trigrams(trigram)/total_trigrams;
end
disp(trigram_freq)

%still need to save this data as a file but i want to run it first%

save('english_trigram_freq.mat', 'trigram_freq') %saves english dataset as its own%









    
