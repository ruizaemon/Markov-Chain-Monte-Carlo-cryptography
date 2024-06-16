
%% Function to convert a character array to a precision matrix

function pr_trans = compute_transition_probability(input_txt)

% Convert input text to a double array
double_txt = char2double(input_txt); 

% Go down the rows of the matrix
for i = 1: 27
    % Go across the columns of the matrix
    for j = 1 : 27
        % helper function to calculate probability
        pr_trans(i, j) = element_transition(double_txt, i, j);
    end 
end

