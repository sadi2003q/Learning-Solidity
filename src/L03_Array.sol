// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";


/*
────────────────────────────────────────────────────────
ARRAYS IN SOLIDITY – COMMON BUILT-IN OPERATIONS

🔹 DECLARATION
• Dynamic array:
    uint[] public arr;

• Fixed-size array:
    uint[3] public fixedArr;

• Multi-dimensional array:
    uint[][] public matrix;

--------------------------------------------------------

🔹 LENGTH
• Get array length:
    arr.length

• Length updates automatically for dynamic arrays

--------------------------------------------------------

🔹 PUSH (Dynamic arrays only)
• Add element to the end:
    arr.push(10);

• Push default value and get reference (Solidity ≥0.6):
    arr.push();
    arr[arr.length - 1] = 20;

--------------------------------------------------------

🔹 POP (Dynamic arrays only)
• Remove last element:
    arr.pop();

• Reduces array length by 1

--------------------------------------------------------

🔹 READ ELEMENT
• Access by index:
    uint value = arr[0];

--------------------------------------------------------

🔹 UPDATE ELEMENT
• Modify by index:
    arr[1] = 50;

--------------------------------------------------------

🔹 DELETE ELEMENT
• Reset element to default value (does NOT shrink array):
    delete arr[0];

• Default values:
    int → 0
    string → ""
    address → address(0)

--------------------------------------------------------

🔹 CLEAR ENTIRE ARRAY
• Reset array completely:
    delete arr;

--------------------------------------------------------

🔹 LOOP THROUGH ARRAY
• Use for-loop:
    for (uint i = 0; i < arr.length; i++) {
        // arr[i]
    }

--------------------------------------------------------

🔹 MULTI-DIMENSION ARRAY ACCESS
• Read:
    matrix[row][column]

• Example:
    uint value = matrix[1][2];

--------------------------------------------------------

🔹 IMPORTANT NOTES
• Only dynamic arrays support push() and pop()
• Fixed-size arrays cannot change length
• delete does NOT remove index, only resets value
• Array out-of-bounds access will revert
────────────────────────────────────────────────────────
*/


contract L03_Array {
    // Single Dimension Array
    uint[] public myArray = [1, 2, 3];
    string[] public myStringArray = ["Adnan", "Abdullah", "sadi"];
    string[] public myNames;


    // MultiDimension Array
    uint[][] public two_Array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];


    function addValue() public {
        myArray.push(5);
        myNames.push("sadi");
        myNames.push("Abdullah");
    }
}

contract L03_Array_Test is Test {
//    function testCounter() public {
//        L03_Array template = new L03_Array();
//
//    }
}

