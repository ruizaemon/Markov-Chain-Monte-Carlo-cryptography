
% Function to convert a character array to a double array 
% where 'a-z' maps to 1-26, and all other characters map to 27 

function double_array = char2double(char_array)

% if uppercase, double() will convert it to 65-90 in ASCII
% if lowercase, double() will convert it to 97-122 in ASCII
for i = 1 : length(char_array)
    toASCII = double(char_array(i));
    if (65 <= toASCII) && (toASCII <= 90)
        double_array(i) = toASCII - 64; % -64 to reach 1
    elseif (97 <= toASCII) && (toASCII <= 122)
        double_array(i) = toASCII - 96; % -96 to reach 1
    else 
        double_array(i) = 27; % 27 otherwise
    end
end

end


