// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

contract Calculator {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}

// This second contract contains the "runnable" logic
contract CalculatorTest is Test {
    // REMOVED the 'view' keyword here
    function testAddition() public { 
        Calculator calc = new Calculator();
        uint256 result = calc.add(10, 5);
        console.log("The addition result is:", result);
    }
}
