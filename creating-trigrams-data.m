[filename, location] = uigetfile('*.txt', 'select text files', 'MultiSelect', 'on')

count_trigrams = container.Map('KeyType', 'char', 'ValueType', 'double'); 
if ischar(filename)
    filename = {filename};
end

for i = 1:length(filename)
file_path = fullfile(location, filename{i}); %gives full link of file and location%
text = fileread(file_path); %reads the text%
text = lower(text); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%
for j = 1:1:length(text)-2 %from j being the first letter to being the third last letter because trigram is three letters%
trigram = text(j:j+2);
disp(trigram)
end
end







    
