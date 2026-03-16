/*
 * Binary Operations - WALL-E Module 1, Lesson 1
 *
 * Demonstrates binary number operations including:
 * - Decimal to binary conversion
 * - Binary to decimal conversion
 * - Two's complement representation
 * - Binary addition and subtraction
 *
 * Compile: g++ binary_operations.cpp -o binary_operations
 * Run: ./binary_operations
 */

#include <iostream>
#include <string>
#include <bitset>
using namespace std;

// =============================================================================
// FUNCTION DECLARATIONS
// =============================================================================

string decimalToBinary(int decimal, int bits = 8);
int binaryToDecimal(string binary);
string twosComplement(string binary);
int signedBinaryToDecimal(string binary);
string binaryAddition(string bin1, string bin2);
void printBinaryInfo(int number);

// =============================================================================
// MAIN FUNCTION
// =============================================================================

int main() {
    cout << "===================================" << endl;
    cout << "  Binary Operations Demonstration  " << endl;
    cout << "===================================" << endl << endl;

    // Example 1: Decimal to Binary Conversion
    cout << "1. DECIMAL TO BINARY CONVERSION" << endl;
    cout << "--------------------------------" << endl;
    int numbers[] = {13, 255, 42, 0, 127};
    for (int num : numbers) {
        cout << num << " (decimal) = " << decimalToBinary(num, 8)
             << " (8-bit binary)" << endl;
    }
    cout << endl;

    // Example 2: Binary to Decimal Conversion
    cout << "2. BINARY TO DECIMAL CONVERSION" << endl;
    cout << "--------------------------------" << endl;
    string binaries[] = {"1101", "11111111", "00101010", "0", "01111111"};
    for (string bin : binaries) {
        cout << bin << " (binary) = " << binaryToDecimal(bin)
             << " (decimal)" << endl;
    }
    cout << endl;

    // Example 3: Two's Complement for Negative Numbers
    cout << "3. TWO'S COMPLEMENT (8-bit)" << endl;
    cout << "--------------------------------" << endl;
    int signed_numbers[] = {5, -5, 127, -128, -1};
    for (int num : signed_numbers) {
        string binary = decimalToBinary(abs(num), 8);
        if (num < 0) {
            binary = twosComplement(binary);
        }
        cout << num << " (decimal) = " << binary << " (binary)" << endl;
        // Verify by converting back
        int verify = signedBinaryToDecimal(binary);
        cout << "  → Verification: " << binary << " = " << verify << endl;
    }
    cout << endl;

    // Example 4: Binary Addition
    cout << "4. BINARY ADDITION" << endl;
    cout << "--------------------------------" << endl;
    string add_pairs[][2] = {
        {"1101", "1011"},     // 13 + 11 = 24
        {"1111", "0001"},     // 15 + 1 = 16
        {"00000101", "00000011"}  // 5 + 3 = 8
    };

    for (auto pair : add_pairs) {
        string sum = binaryAddition(pair[0], pair[1]);
        int dec1 = binaryToDecimal(pair[0]);
        int dec2 = binaryToDecimal(pair[1]);
        int dec_sum = binaryToDecimal(sum);

        cout << "  " << pair[0] << " (" << dec1 << ")" << endl;
        cout << "+ " << pair[1] << " (" << dec2 << ")" << endl;
        cout << "  " << string(max(pair[0].length(), pair[1].length()), '-') << endl;
        cout << "  " << sum << " (" << dec_sum << ")" << endl << endl;
    }

    // Interactive mode
    cout << "5. INTERACTIVE MODE" << endl;
    cout << "--------------------------------" << endl;
    int user_number;
    cout << "Enter a number to see its binary representation: ";
    cin >> user_number;
    printBinaryInfo(user_number);

    return 0;
}

// =============================================================================
// FUNCTION IMPLEMENTATIONS
// =============================================================================

/**
 * Convert decimal number to binary string
 * @param decimal The decimal number to convert
 * @param bits Number of bits in output (default 8)
 * @return Binary string representation
 */
string decimalToBinary(int decimal, int bits) {
    if (decimal == 0) {
        return string(bits, '0');
    }

    string binary = "";
    int num = decimal;

    // Convert using division method
    while (num > 0) {
        binary = to_string(num % 2) + binary;
        num = num / 2;
    }

    // Pad with leading zeros to reach desired bit width
    while (binary.length() < bits) {
        binary = "0" + binary;
    }

    return binary;
}

/**
 * Convert binary string to decimal (unsigned)
 * @param binary Binary string to convert
 * @return Decimal integer value
 */
int binaryToDecimal(string binary) {
    int decimal = 0;
    int power = 0;

    // Process from right to left (LSB to MSB)
    for (int i = binary.length() - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += (1 << power); // Equivalent to 2^power
        }
        power++;
    }

    return decimal;
}

/**
 * Calculate two's complement of binary string
 * @param binary Binary string input
 * @return Two's complement binary string
 */
string twosComplement(string binary) {
    string result = "";

    // Step 1: Invert all bits (one's complement)
    for (char bit : binary) {
        result += (bit == '0') ? '1' : '0';
    }

    // Step 2: Add 1
    int carry = 1;
    for (int i = result.length() - 1; i >= 0 && carry; i--) {
        if (result[i] == '0') {
            result[i] = '1';
            carry = 0;
        } else {
            result[i] = '0';
            // Carry continues
        }
    }

    return result;
}

/**
 * Convert signed binary (two's complement) to decimal
 * @param binary Binary string in two's complement format
 * @return Signed decimal integer
 */
int signedBinaryToDecimal(string binary) {
    // Check MSB for sign
    if (binary[0] == '0') {
        // Positive number
        return binaryToDecimal(binary);
    } else {
        // Negative number: subtract 1, invert, make negative
        string temp = binary;

        // Subtract 1
        int borrow = 1;
        for (int i = temp.length() - 1; i >= 0 && borrow; i--) {
            if (temp[i] == '1') {
                temp[i] = '0';
                borrow = 0;
            } else {
                temp[i] = '1';
            }
        }

        // Invert bits
        for (int i = 0; i < temp.length(); i++) {
            temp[i] = (temp[i] == '0') ? '1' : '0';
        }

        // Convert to decimal and negate
        return -binaryToDecimal(temp);
    }
}

/**
 * Add two binary strings
 * @param bin1 First binary string
 * @param bin2 Second binary string
 * @return Sum as binary string
 */
string binaryAddition(string bin1, string bin2) {
    string result = "";
    int carry = 0;

    // Make strings equal length (pad with zeros)
    int maxLen = max(bin1.length(), bin2.length());
    while (bin1.length() < maxLen) bin1 = "0" + bin1;
    while (bin2.length() < maxLen) bin2 = "0" + bin2;

    // Add from right to left
    for (int i = maxLen - 1; i >= 0; i--) {
        int bit1 = bin1[i] - '0';
        int bit2 = bin2[i] - '0';
        int sum = bit1 + bit2 + carry;

        result = to_string(sum % 2) + result;
        carry = sum / 2;
    }

    // Add final carry if present
    if (carry) {
        result = "1" + result;
    }

    return result;
}

/**
 * Print comprehensive binary information about a number
 * @param number The number to analyze
 */
void printBinaryInfo(int number) {
    cout << "\nAnalysis of " << number << ":" << endl;
    cout << "  8-bit binary:  " << decimalToBinary(abs(number), 8) << endl;
    cout << "  16-bit binary: " << decimalToBinary(abs(number), 16) << endl;
    cout << "  Hexadecimal:   0x" << hex << uppercase << number << dec << endl;

    if (number >= 0) {
        cout << "  Two's comp (8-bit): " << decimalToBinary(number, 8) << endl;
    } else {
        cout << "  Two's comp (8-bit): "
             << twosComplement(decimalToBinary(abs(number), 8)) << endl;
    }

    // Bit analysis
    bitset<8> bits(number);
    cout << "  Bit positions set: ";
    bool first = true;
    for (int i = 7; i >= 0; i--) {
        if (bits[i]) {
            if (!first) cout << ", ";
            cout << i;
            first = false;
        }
    }
    if (first) cout << "none";
    cout << endl;
}
