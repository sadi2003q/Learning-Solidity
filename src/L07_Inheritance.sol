// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be Owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}


contract SecretVault {
    string private secret;
    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }
}



contract L07_Inheritance is Ownable{
    address private secretVault;


    constructor (string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns(string memory){
        return SecretVault(secretVault).getSecret();
    }

}

contract L07_Inheritance_Test is Test {
    function testL07_Inheritance() public {
        L07_Inheritance template = new L07_Inheritance("12345");
        string memory secret = template.getSecret();

        console.log("Secret Key : ", secret);

    }
}

