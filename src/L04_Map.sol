// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";



/*
────────────────────────────────────────────────────────
MAPPINGS IN SOLIDITY – COMMON OPERATIONS & RULES

🔹 DECLARATION
• Simple mapping:
    mapping(uint => string) public data;

• Mapping to struct:
    mapping(uint => Book) public books;

• Nested mapping:
    mapping(address => mapping(uint => Book)) public myBook;

--------------------------------------------------------

🔹 WRITE (SET VALUE)
• Assign value:
    data[key] = value;

• Struct assignment:
    books[id] = Book("Title", "Author");

• Nested mapping:
    myBook[msg.sender][id] = Book("Title", "Author");

--------------------------------------------------------

🔹 READ (GET VALUE)
• Public mapping auto-creates getter:
    data(key)

• Mapping → struct getter:
    (string memory title, string memory author) = books(id);

• Nested mapping read:
    (string memory title, string memory author) =
        myBook(userAddress, id);

--------------------------------------------------------

🔹 UPDATE
• Same as write:
    books[id] = Book("New Title", "New Author");

--------------------------------------------------------

🔹 DELETE
• Reset to default value:
    delete books[id];

• Default values:
    string → ""
    int → 0
    struct → all fields reset

--------------------------------------------------------

🔹 IMPORTANT RULES
• Mappings have NO length
• Cannot iterate over mappings
• Keys always exist (return default values if not set)
• Use arrays if iteration is needed
────────────────────────────────────────────────────────
*/

contract L04_Map {

    mapping(int => string) public names;
    mapping(int => Book) public books;

    mapping (address => mapping(int => Book)) public myBook;


    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[0]="Adnan";
        names[1]="Abdullah";
        names[2]="Sadi";
    }


    // Add Function
    function addBook(
        int _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        int _id,
        string memory _title,
        string memory _author
    ) public {
        myBook[msg.sender][_id] = Book(_title, _author);
    }






}

contract L04_Map_Test is Test {
//    function testCounter() public {
//        L04_Map template = new L04_Map();
//
//    }
}

