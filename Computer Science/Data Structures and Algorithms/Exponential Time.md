## Polynomial vs Exponential Time
> Algorithms can be classified into two categories:
1. Polynomial Time
2. Exponential Time

- An algorithms is a Polynomial Time if its **runtime** does not grow faster than **n^k** where k is any constant (eg, 1,2,3) and n is the size of the inputs.

- Polynomial time algorithms ca be useful, but exponential time algorithms are almost always too slow to be practical (unless you're trying to force someone to be slow, like in the case of crpytography and security). Even when n is as low as 20, ^n is already over a million.)

| n  | n²   | 2ⁿ      |
|----|------|---------|
| 2  | 4    | 4       |
| 3  | 9    | 8       |
| 4  | 16   | 16      |
| 5  | 25   | 32      |
| 6  | 36   | 64      |
| 7  | 49   | 128     |
| 8  | 64   | 256     |
| 9  | 81   | 512     |
| 10 | 100  | 1024    |
| 11 | 121  | 2048    |
| 12 | 144  | 4096    |
| 13 | 169  | 8192    |
| 14 | 196  | 16384   |
| 15 | 225  | 32768   |
| 16 | 256  | 65536   |
| 17 | 289  | 131072  |
| 18 | 324  | 262144  |
| 19 | 361  | 524288  |
| 20 | 400  | 1048576 |
