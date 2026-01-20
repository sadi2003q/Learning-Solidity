// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;
import "forge-std/Test.sol";

contract Subtraction {
    function subtract(uint256 a, uint256 b)  public pure returns (uint256) {
        return a-b;
    }
}


contract SubtractionTest is Test {
    function testSubtraction() public {
        Subtraction calc = new Subtraction();
        uint256 result = calc.subtract(10, 5);
        console.log("The addition result is:", result);
    }
}
