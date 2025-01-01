before the ASCII, different countries or places has different way of representing coding scheme for 0s and 1s.

### ASCII
- One evolution that the computers has gone through is the standardization of coding scheme.
- Western Centric
- 1 Byte - 8bits
- Bit - is a Binary Digit
- Bi - two, 0 and 1
- ASCII use 1 byte for 8bit
- 8 on and off state
- ASCII didn't have the all the characters in all languages of the world. Then Unicode is created.


### Unicode
- Unicode includes ASCII
- more than enough to account for every character in every language
- 2 ^ 34 (4 bytes) = 4,294,967,296 values

### UTF 8
- up to 4 bytes
- Stores Unicode as binary
- If a character needs 1 byte that's all it will use.
- If a character needs 4 bytes it will use 4 bytes.
- Variable length encoding -  efficient memory use 
- common character like 'C' takes 8 bits
- rare character like '❤️' takes 32bits
- other characters takes 16 or 24 bits.

// read more here: https://blog.hubspot.com/website/what-is-utf-8
