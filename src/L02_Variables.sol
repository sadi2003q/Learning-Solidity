// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";


/*
────────────────────────────────────────────────────────
STATE VARIABLES vs LOCAL VARIABLES

🔹 STATE VARIABLES
• Declared at contract level (outside functions)
• Stored permanently on the blockchain
• Cost gas when written or modified
• Retain value between function calls
• Accessible by all functions in the contract

Example:
    uint public count;

--------------------------------------------------------

🔹 LOCAL VARIABLES
• Declared inside functions
• Exist only during function execution
• Not stored on the blockchain
• Do NOT cost gas (unless used to update state)
• Value is discarded after function finishes

Example:
    function add(uint a, uint b) public pure returns (uint) {
        uint result = a + b; // local variable
        return result;
    }

--------------------------------------------------------

🔹 KEY DIFFERENCES

| Feature            | State Variable | Local Variable |
|-------------------|----------------|----------------|
| Declared in       | Contract scope | Function scope |
| Storage location  | Storage        | Stack / Memory |
| Persists data     | Yes            | No             |
| Gas cost to write | Yes            | No             |
| Access scope      | Entire contract| Function only  |

--------------------------------------------------------

🔹 WHEN TO USE
• Use STATE variables to store contract data
• Use LOCAL variables for calculations & temporary values
────────────────────────────────────────────────────────
*/



contract L02_Variables {


    /*────────────────────────────────────────────
      1️⃣ VALUE TYPES
    ────────────────────────────────────────────*/

    // Unsigned integers
    uint public myUint = 1;        // uint == uint256
    uint8 public myUint8 = 2;      // range: 0 → 255

    // Signed integers
    int public myInt = -4;         // int == int256

    // Boolean
    bool public myBool = true;

    // Address
    address public myAddress = msg.sender;


    /*────────────────────────────────────────────
      3️⃣ REFERENCE TYPES
    ────────────────────────────────────────────*/

    // String
    string public myString = "Hello from Solidity";

    // Dynamic bytes
    bytes public myBytes = "ABC";

    // Array
    uint[] public myArray = [1, 2, 3];
    string[] public myStringArray = ["Adnan", "Abdullah", "Sadi"];

    // Fixed-size array
    uint[3] public fixedArray = [10, 20, 30];


    /*────────────────────────────────────────────
      4️⃣ MAPPING
    ────────────────────────────────────────────*/

    mapping(address => uint) public balances;

    constructor() {
        balances[msg.sender] = 100;
    }

    /*────────────────────────────────────────────
      5️⃣ STRUCT
    ────────────────────────────────────────────*/

    struct User {
        uint id;
        string name;
        bool isActive;
    }

    User public user;

    function setUser(uint _id, string memory _name) public {
        user = User(_id, _name, true);
    }

    /*────────────────────────────────────────────
      6️⃣ ENUM
    ────────────────────────────────────────────*/

    enum Status {
        Pending,
        Approved,
        Rejected
    }

    Status public status = Status.Pending;

    function approve() public {
        status = Status.Approved;
    }

    /*────────────────────────────────────────────
      7️⃣ LOCAL VARIABLE EXAMPLE
    ────────────────────────────────────────────*/



    // State Variable
    uint private myVariable  = 1; // uint = uint256;
    uint8 private num2 = 2;
    int private num3 = 4;


    // Local Variable
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }



}

contract L02_Variables_Test is Test {
//    function testCounter() public {
//        L02_Variables template = new L02_Variables();
//
//    }
}

