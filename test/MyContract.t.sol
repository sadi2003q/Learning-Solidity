// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MyContract.sol";

contract MyContractTest is Test {
    MyContract myContract;

    function setUp() public {
        myContract = new MyContract();
    }

    function testConsoleResult() public view {
        uint256 result = myContract.add(10, 5);
        console.log("The addition result is:", result);
    }
}
