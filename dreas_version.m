filename = fileread('english2.txt');
text = lower(filename); %lowercase, important because the trigrams should not be case sensitive%
text = regexprep(text, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%
english_trigrams = containers.Map({'the','she','are'},[1,1,1]);
spanish_trigrams = containers.Map({'del','est','nte'},[1,1,1]);
french_trigrams = containers.Map({'ait','ion','eur'},[1,1,1]);

english_score = 0; 
for j = 1:1:(length(text) - 2) % loops through trigrams, starting from the first character, ending at the third to last character and incrementing by 1. 
    trigram = text(j:j+2); % definition of a trigram
    if isKey(english_trigrams, trigram) % checks to see if trigram is included in the container, english trigrams 
       english_score = english_score + english_trigrams(trigram); %  
    end
end
disp(['the english score is ', num2str(english_score)]);

spanish_score = 0; 
for j = 1:1:length(text) - 2
    trigram = text(j:j+2);
    if isKey(spanish_trigrams, trigram)
       spanish_score = spanish_score + spanish_trigrams(trigram);
    end
end
disp(['the spanish score is ', num2str(spanish_score)]);

french_score = 0; 
for j = 1:1:(length(text) - 2)
    trigram = text(j:j+2);
    if isKey(french_trigrams, trigram)
       french_score = french_score + french_trigrams(trigram);
    end
end
disp(['the french score is ',num2str(french_score)]);


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