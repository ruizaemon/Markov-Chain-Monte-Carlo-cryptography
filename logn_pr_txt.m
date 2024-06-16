
%% Function to compute sum of natural log of probability of consecutive characters 

function log_pr = logn_pr_txt(input_txt, pr_trans)

double_input_txt = char2double(input_txt); % convert the letters to numbers
sum = 0;

for i = 1 : (length(double_input_txt) - 1) % n=1 to N-1
    
    % find the two adjacent numbers
    c_n = double_input_txt(i);
    c_n_plus1 = double_input_txt(i+1);
    
    % find the transition probability from pr_trans
    cn_to_cnplus1_prob = pr_trans(c_n, c_n_plus1);
    
    % sum the natural log of the probabilities
    sum = sum + log(cn_to_cnplus1_prob);
    
end

log_pr = sum;

end % function end


