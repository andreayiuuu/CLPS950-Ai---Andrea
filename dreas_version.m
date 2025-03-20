% english_trigrams = load('english_trigram_freq.mat');
% spanish_trigrams = load('spanish_trigram_freq.mat');
% french_trigrams = load('french_trigram_freq.mat');

%[filename, location] = uigetfile('*.txt', 'select text files', 'MultiSelect', 'on')

filename = fileread('french.txt');
text = lower(filename); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%


english_score = 0; 
for j = 1:1:(length(text) - 2)
    trigram = text(j:j+2);
    if isKey(english_trigrams, trigram)
       english_score = english_score + english_trigrams(trigram); %if this doesn't work then try 1/totaltrigram count in this text
    end
    disp(['the english score is ', num2str(english_score)]);
end

spanish_score = 0; 
for j = 1:1:length(text) - 2
    trigram = text(j:j+2);
    if isKey(spanish_trigrams, trigram)
        spanish_score = spanish_score + spanish_trigrams(trigram);
    end
    disp(['the spanish score is ', num2str(spanish_score)]);
end

french_score = 0; 
for j = 1:1:(length(text) - 2)
    trigram = text(j:j+2);
    if isKey(french_trigrams, trigram)
        french_score = french_score + french_trigrams(trigram);
    end
    disp(['the french score is ',num2str(french_score)]);
end


if english_score > spanish_score && english_score > french_score
    detected_language = 'English';
elseif spanish_score > english_score && spanish_score > french_score
    detected_language = 'Spanish';
elseif french_score > english_score && french_score > spanish_score
    detected_language = 'French'; 
else 
    detected_language = 'No conclusion';
end
disp(detected_language)