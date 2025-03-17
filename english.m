clc
for i = 1:length(text(1:100))
    text = fileread('/Users/aiokura/Desktop/arabic.txt');
    unicode_value = double(text(i));
    % if (unicode_value >= hex2dec('0061') && unicode_value <= hex2dec('007A'))||(unicode_value >= hex2dec('0041') && unicode_value <= hex2dec('005A'))
    %    disp("English");
    %    break;
   if (unicode_value >= (hex2dec('4E00')) && unicode_value <= hex2dec('9FFF')) && ~(unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F'))
        detected_language = "Chinese";
   elseif unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F')
        detected_language = ("Japanese"); 
   elseif unicode_value >= hex2dec('0600') && unicode_value <= hex2dec('06FF')
        detected_language = "Arabic";
    else
        continue;
   end
end
disp(detected_language)

 %    if unicode_value == hex2dec('00D1')
 %         disp("Spanish");
 %         break;
 %    elseif unicode_value == (hex2dec('00C7')||hex2dec('00E7'))
 %        disp("French")
 %       break;
 % end


% differences between English, Spanish, French
   % fileList = {'/Users/aiokura/Desktop/spanish2.txt','/Users/aiokura/Desktop/english.txt','/Users/aiokura/Desktop/french2.txt'};
   %  for f = 1:length(fileList)
   %      filename = fileList{f};
   %      text2 = fileread(filename);
   %      sentences = regexp(text2,'[.!?]','split');
   %      sentences = sentences(~cellfun('isempty',sentences));
   %      numSentences = length(sentences);
   %      wordCount = zeros(1,numSentences);
   %      for i = 1:numSentences 
   %          words = strsplit(strtrim(sentences{i}));
   %          wordCount(i)= length(words);
   %      end 
   %     if numSentences > 0
   %         avgSentenceLength = mean(wordCount);
   %        fprintf('Average Sentence Length: %.2f words\n',avgSentenceLength);
   %     end
   %  end

  % looking at word length now cuz detecting language through sentence
  % length was a tad ineffective 

  % fileList = {'/Users/aiokura/Desktop/spanish.txt','/Users/aiokura/Desktop/english.txt','/Users/aiokura/Desktop/french.txt'};
  % for f = 1:length(fileList)
  %     filename = fileList{f};
  %     text2 = fileread(filename);
  %     words = regexp(text2, '\w+', 'match');
  %     totalCharacters = sum(cellfun(@length, words));
  %     averageWordLengths(f) = totalCharacters / length(words);
  % end
  % 
  % for f = 1:length(fileList)
  %     fprintf('Text %d Average Word Length: %.2f characters\n', f, averageWordLengths(f));
  % end
% 
%  [filename, location] = uigetfile('*.txt', 'select text files', 'MultiSelect', 'on')
% 
% count_trigrams = containers.Map('KeyType', 'char', 'ValueType', 'double'); 
% if ischar(filename)
%     filename = {filename};
% end

% trigrams 
% for i = 1:length(filename)
%     file_path = fullfile(location, filename); %gives full link of file and location%
%     text3 = fileread(file_path); %reads the text%
%     text3 = lower(text3); %lowercase, important because the trigrams should not be case sensitive.
%     text3 = regexprep(text3, '[^a-z]', ''); %makes the text only letters not sure if this connects words separated by spaces%
%     for j = 1:1:length(text3)-2 %from j being the first letter to being the third last letter because trigram is three letters%
%         trigram = text3(j:j+2);
%         disp(trigram)
%     end
% end


