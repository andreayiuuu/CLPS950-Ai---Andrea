% code to detect languages with different characters 
clc
text = fileread('arabic.txt'); % reads text file into a string
for i = 1:length(text(1:100)) % looping through each character of the first 100 elements of text file 
    unicode_value = double(text(i)); % converts each character into its unicode value 
   if (unicode_value >= (hex2dec('4E00')) && unicode_value <= hex2dec('9FFF')) && ~(unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F'))
        detected_language = "Chinese"; % checking each character if it's within the unicode value range for Chinese 
   elseif unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F')
        detected_language = ("Japanese"); % checking each character if it's within the unicode value range for Japanese 
   elseif unicode_value >= hex2dec('0600') && unicode_value <= hex2dec('06FF')
        detected_language = "Arabic"; % checking each character if it's within the unicode value range for Arabic 
   else
        continue;
   end
end
disp(detected_language)


