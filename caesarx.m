% UNIVERSIDAD DEL TURABO, SUAGM
% CPEN-503: Computer & Network Security
% Problem Set 2
% Caesar Cipher Encoder/Decocder
% Version 1.2
% Author: Carro, M.A. et al.
% Date: October 13, 2016

%The MIT License (MIT)
%Copyright (c) 2016 Carro et al.

%Permission is hereby granted, free of charge, to any person obtaining a copy of 
%this software and associated documentation files (the "Software"), to deal in 
%the Software without restriction, including without limitation the rights to 
%use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
%of the Software, and to permit persons to whom the Software is furnished to do 
%so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included in all 
%copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
%SOFTWARE.

% ------------------------------------------------------------------------------

% SUMMARY OF ALGORITHM 
% The following algorithm prompts a user for a plaintext or ciphertext input, 
% text, and a key k (k from 0 to 25), producing encipherment/decipherment by 
% virtue the the general Caesar cipher. The text is encrypted/decrypted through 
% circular left (k<0) or right (k>0) shifts. The sign of k determines the 
% direction of the shift (encryption/decryption scheme) in this implementation.

% ------------------------------------------------------------------------------ 

%clean

disp('Disclamer: This implementation of the Caesar cipher is intended for educational purposes only. It should not be used to encipher sensitive information in any way, shape, or form.')
disp('Licence: This application (the Software) is provided "as is" without guarantees and with all rights, privileges, and obligations thereunto granted by the MIT License. See source for more information.')  
prompt = 'Press any key to continue.';
str = input(prompt,'s');
if isempty(str)
    str = '';
end

% Only English language characters allowed. No numbers or special characters allowed for now. 

% Generate the (English) alphabet:
alphabet = ['a':'z'];

% Define space digram:
%sdig = 'zx';

prompt2 = 'Please enter plaintext or ciphertext (e.g. predator niner lost in action seventeen zulu):';
text = input(prompt2,'s');
% text = text(find(~isspace(text)));  % Comment and uncomment next line if wanting spaces in plaintext represented by impossible digram 
text = strrep(text,' ','zx');         % Uncomment and Coment previous line if wanting plaintext as concatenated string without spaces

flag = true;
while flag
    prompt3 = 'Input the key (a digit from 0-25, inclusive; positive for decryption, negative otherwise):';
    key = input(prompt3);

   if abs(key) <= length(alphabet)-1 
     flag = false;
   end
end

key = key+1;

plainocipher = text;

for i = 1:length(text)
    p(i) = find(text(i) == alphabet);
    C(i) = mod(p(i)-key, length(alphabet))+1;
    plainocipher(i)=alphabet(C(i));
end 

disp(strrep(plainocipher,'zx',' '))