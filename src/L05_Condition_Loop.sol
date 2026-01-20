// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

contract L05_Condition_Loop {

    address private owner = msg.sender;


    // Conditions
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function isEvenNumber(uint _number) public pure returns(bool) {
        return (_number % 2) == 0;
    }

    function checkNumber() public view {
        for(uint i=0; i<numbers.length; i++) {
            if (isEvenNumber(numbers[i])) {
                console.log(numbers[i], "is Even Number");
            } else {
                console.log(numbers[i], "is Odd Number");
            }
        }
    }

    function isOwner() public view  {
        if (msg.sender == owner) console.log("Owner Calling this Function");
        else console.log("Outsider Calling this function");
    }

}

contract L05_Condition_Loop_Test is Test {
    function testCounter() public {
        L05_Condition_Loop template = new L05_Condition_Loop();

        template.checkNumber();

        template.isOwner();

    }
}

