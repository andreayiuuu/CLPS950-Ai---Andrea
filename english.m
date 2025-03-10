clc
text = fileread('/Users/aiokura/Desktop/spanish.txt');
%for i = 1:length(text)
   % text(1:20)
   % unicode_value = double(text(i));
   % if (unicode_value >= hex2dec('0061') && unicode_value <= hex2dec('007A'))||(unicode_value >= hex2dec('0041') && unicode_value <= hex2dec('005A'))
      %  disp("English");
      %  break;
 %   elseif unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F')
       % disp("Japanese"); 
       % break;
  %  elseif unicode_value >= hex2dec('0600') && unicode_value <= hex2dec('06FF')
      %  disp("Arabic");
       % break;
 %   elseif unicode_value >= hex2dec('4E00') && unicode_value <= hex2dec('9FFF')
      %  disp("Chinese")
      %  break; 
 %   else
      %  continue;
   % end
end
% differences between English, Spanish, French
fileList = {'/Users/aiokura/Desktop/spanish.txt','/Users/aiokura/Desktop/pride_and_prejudice.txt'}
for f = 1:length(fileList)
    filename = fileList{f};
    text2 = fileread(filename);
    sentences = regexp(text,'[.!?]','split');
    sentences = sentences(~cellfun('isempty',sentences));
    numSentences = length(sentences);
    wordCount = zeros(1,numSentences);
    for i = 1:numSentences 
        words = strsplit(strtrim(sentences{i}));
        wordCount(i)= length(words);
    end
    
    if numSentences > 0
        avgSentenceLength = mean(wordCount);
  fprintf('Average Sentence Length: %.2f words\n',avgSentenceLength);
    end
end

