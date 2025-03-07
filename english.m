clc
text = fileread('/Users/aiokura/Desktop/pride_and_prejudice.txt');
text(1:20)
for i = 1:length(text)
    unicode_value = double(text(i));
    if (unicode_value >= hex2dec('0061') && unicode_value <= hex2dec('007A'))||(unicode_value >= hex2dec('0041') && unicode_value <= hex2dec('005A'))
        disp("English");
        break;
    elseif unicode_value >= hex2dec('3040') && unicode_value <= hex2dec('309F')
        disp("Japanese"); 
        break;
    elseif unicode_value >= hex2dec('0600') && unicode_value <= hex2dec('06FF')
        disp("Arabic");
        break;
    elseif unicode_value >= hex2dec('1100') && unicode_value <= hex2dec('11FF')
        disp("Korean")
        break; 
    else
        continue;
    end
end

disp('test');

