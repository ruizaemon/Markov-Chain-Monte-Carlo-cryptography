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
## Probability of consecutive characters in the English language
The trick to create a decryption key is to exploit a statistical regularity in the arrangement of alphabets of the English language. For instance, the probability of the letter 'u' appearing after the letter 'q' is very high. We first want to quantify the likelihood of any sequence of characters using statistics.

The function `element_transition` is a helper function that takes in a `double` array converted from the original text and two doubles that represent the alphabets, and outputs the transition probability (consecutive appearance) of these alphabets in the array using the formula:
$
\frac{1 + \\#times j-th alphabet appears after i-th alphabet in input text}{27 + \\#times i-th alphabet appears in input text except at the last position}
$