
%% Helper function for "compute_transition_probability"

% Given the input text (double) and two doubles i_th and j_th (representing the alphabets), 
% computes the transition probability of a single element in the 27x27 matrix

function trans_p = element_transition(double_txt, i_th, j_th)

numerator_count = 0;
denom_count = 0;

for index = 1 : (length(double_txt)-1) % -1 so that the last pair will be valid
    
    % if the j_th alphabet comes right after the i_th alphabet, increment numerator by 1
    if (double_txt(index) == i_th) && (double_txt(index+1) == j_th)
        numerator_count = numerator_count + 1;
    end
    
    % whenever the i_th alphabet appears (except last position), increment denominator by 1
    if double_txt(index) == i_th
        denom_count = denom_count + 1;
    end

end

% Compute the transition probability
trans_p = (1+numerator_count)/(27+denom_count);




