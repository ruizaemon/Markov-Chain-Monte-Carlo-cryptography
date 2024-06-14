
% Function to convert a double array to a character array 
% where 1-26 maps to 'a-z', and 27 maps to white space

function char_array = double2char(double_array)

for i = 1 : length(double_array)
    number = double_array(i);
    if (1 <= number) && (number <= 26)
        char_array(i) = char(number + 96); % add 96 to reach the lower case alphabets
    elseif number == 27
        char_array(i) = char(32); % whitespace
    end
end

end

