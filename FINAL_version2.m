filename = fileread('french.txt');
text = lower(filename); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); % makes the text only letters 
english_trigrams = containers.Map({'the','she','are'},[1,1,1]); % creates map where keys are common trigrams and values are all 1. 
spanish_trigrams = containers.Map({'del','est','nte'},[1,1,1]);
french_trigrams = containers.Map({'ait','ion','eur'},[1,1,1]);

english_score = 0; % initializes english score, used to track the frequency of common english trigrams in the text 
for j = 1:1:(length(text) - 2) % loops through trigrams, starting from the first character, ending at the third to last character and incrementing by 1. 
    trigram = text(j:j+2); % definition of a trigram
    if isKey(english_trigrams, trigram) % checks to see if trigram is included in the english_trigrams map.  
       english_score = english_score + english_trigrams(trigram); % if it is, the value of that trigram, 1, is added to english_score.  
    end
end
disp(['the english score is ', num2str(english_score)]); % displays the final english score 

spanish_score = 0; % same process is repeated here for tracking the frequency of common spanish trigrams in the text 
for j = 1:1:length(text) - 2
    trigram = text(j:j+2);
    if isKey(spanish_trigrams, trigram)
       spanish_score = spanish_score + spanish_trigrams(trigram);
    end
end
disp(['the spanish score is ', num2str(spanish_score)]); % displays the final spanish score 

french_score = 0; % same process is repeated here for tracking the frequency of common french trigrams in the text 
for j = 1:1:(length(text) - 2)
    trigram = text(j:j+2);
    if isKey(french_trigrams, trigram)
       french_score = french_score + french_trigrams(trigram);
    end
end
disp(['the french score is ',num2str(french_score)]); % displays the final french score 


% detecting language by comparing the scores of the trigrams for all
% three languages 
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
