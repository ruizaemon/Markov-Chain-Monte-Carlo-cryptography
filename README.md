# Markov-Chain-Monte-Carlo-cryptography

## Mapping between character and double arrays

The `char2double` function maps characters 'a-z' / 'A-Z' to 1-26 and all other characters to 27, while the `double2char` function does the reverse.

## Understanding encryption and decryption

Encrypting a message requires an encryption key which is just another mapping of characters to characters, doubles to doubles, or any combination of both. The `frank_txt_encrypt_decrypt.mat` file contains a encryption key for the frankenstein text, which can be used to encrypt the original text:
```
>> frank_original_double = char2double(frank_original_txt);
>> frank_encrypted_double = frank_encrypt_key(frank_original_double);
>> frank_encrypted_txt = double2char(frank_encrypted_double);
```
To decrypt the text:
```
>> frank_encrypted_double = char2double(frank_encrypted_txt);
>> frank_decrypted_double = frank_decrypt_key(frank_encrypted_double);
>> frank_decrypted_txt = double2char(frank_decrypted_double);
```

## Computing probabilities

### Transition probability matrix

The trick to creating a decryption key for text is to exploit a statistical regularity in the arrangement of alphabets of the English language. For instance, the probability of the letter 'u' appearing after the letter 'q' is very high. We first want to quantify the likelihood of any sequence of characters using statistics.

The function `element_transition` is a helper function that takes in a `double` array converted from the original text and two doubles that represent the alphabets, and outputs the transition probability (consecutive appearance) of these alphabets in the array using the formula:

```math
\cfrac{\text{1 + \#times $j$-th alphabet appears after $i$-th alphabet in input text}}{\text{27 + \#times $i$-th alphabet appears in input text except at the last position}}
```

`compute_transition_probability` uses this function to fill up the elements of a 27x27 matrix.

Running the following lines will generate a transition probability matrix for the given training text. The highest probability in the matrix is 0.7920, which can be found at (17,21), corresponding to the transition from 'q' to 'u'.

``` 
>> pr_trans = compute_transition_probability(training_txt);
>> max(pr_trans(:))
```

### Probability of any sequence of characters

Given a character array '$c_1c_2\cdots c_N$', we can compute the probability of this array occuring using the following:

```math
\text{pr('$c_1c_2\cdots c_N$')} = \prod_{n=1}^{N-1}\text{probability of observing $c_{n+1}$ immediately after $c_n$}
```

This equation is based on the Markov assumption which states that the observation of $c_{n+1}$ is dependent only on $c_n$. 
To make the computation numerically stable, we will take the logarithm of this probability:

```math
\text{ln pr('$c_1c_2\cdots c_N$')} = \sum_{n=1}^{N-1}\text{ln (probability of bserving $c_{n+1}$ immediately after $c_n$)}
```

The function `logn_pr_txt` computes this natural log probability of any input text using the transition matrix computed in the previous step.

### Probability of decrypt key on encrypted message 

Given an encrypted message and any decrypt key, we can calculate the likelihood of the decrypt key being correct by unscrambling the encrypted message then applying the `logn_pr_txt` function.

```
>> frank_encrypted_double = char2double(frank_encrypted_txt)
>> mystery_decrypted_double = mystery_decrypt_key(frank_encrypted_double)
>> mystery_decrypted_txt = double2char(mystery_decrypted_double)
>> logn_pr_txt(mystery_decrypted_txt, pr_trans)
```

## Metropolis algorithm

