// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;
import "forge-std/Test.sol";


/*
────────────────────────────────────────────────────────
2️⃣ VISIBILITY MODIFIERS (Who can call the function?)

• public
  - Callable from anywhere (inside the contract, other contracts, and externally)
  - Automatically creates a public interface
  - Most commonly used for general functions

• external
  - Callable only from outside the contract
  - Cannot be called internally without `this.`
  - Slightly more gas-efficient for external calls

• internal
  - Callable only inside this contract and derived contracts
  - Useful for inheritance and shared logic

• private
  - Callable only inside this contract
  - Not accessible by child contracts
────────────────────────────────────────────────────────
*/


/*
────────────────────────────────────────────────────────
3️⃣ STATE MUTABILITY MODIFIERS (Does it change blockchain state?)

• view
  - Can read state variables
  - Cannot modify state
  - Example: getter functions

• pure
  - Cannot read or modify state variables
  - Used for calculations only

• (no modifier)
  - Can read AND modify state
  - Default for state-changing functions

• payable
  - Allows the function to receive Ether (msg.value > 0)
  - Required for ETH transfers to a function
────────────────────────────────────────────────────────
*/




contract L01_Counter {
    uint8 public count;
    uint8 public number = 10;

    constructor () {
        count = 128;
    }


    function incrementCount() public {
        require(count < type(uint8).max, "overflow");
        count+=1;
    }

}



contract L01_CounterTest is Test {
    function testCounter() public {
        // Initialise Class for Testing
        L01_Counter counter = new L01_Counter();


        // All testing Code
        uint8 result = counter.count();

        console.log("The addition result is:", result);

        counter.incrementCount();
        uint8 finalResult = counter.count();
        console.log("After Updating : ", finalResult);

    }
}
