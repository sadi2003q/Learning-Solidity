// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";

// Ether Payment
// Modifiers
// Visibilities
// Events
// Enum


contract L06_HotelRoom {


    // vacant to occupied
    enum Statuses { vacant, occupied }
    Statuses private status;

    event Occupy(address _occupant, uint _value);


    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        status = Statuses.vacant;
    }

    modifier onlyWhileVacant {
        require(status == Statuses.vacant, "Currently Occupied");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not Enough Ether");
        _;
    }




    function book() public payable onlyWhileVacant costs(2 ether) {

        // amount of ether send from the owner
        // owner.transfer(msg.value);
        (bool sent, ) = owner.call{value: msg.value}(""); // This line add the balance from Function caller to Owner
        require(sent, "Ether transfer failed");


        // Hotel Room occupied
        status = Statuses.occupied;


        emit Occupy(msg.sender, msg.value);
    }



}

contract L06_HotelRoom_Test is Test {

    receive() external payable {}
    L06_HotelRoom public hotel;

    address public sadi = address(1);
    address public adnan = address(2);
    address public owner = address(this);


    function setUp() public {
        hotel = new L06_HotelRoom();
    }

    // ✅ book successfully with enough ether
    function testBookHotel_enoughEther() public {
        // pretend that sadi is calling the function and he has 10 ether
        vm.deal(sadi, 10 ether);
        vm.prank(sadi);

        hotel.book{value: 5 ether}();
    }


    // ❌ Book with intentional error
    function testBookHotel_notEnoughEther() public {
        vm.deal(sadi, 1 ether);
        vm.prank(sadi);

        vm.expectRevert("Not Enough Ether");
        hotel.book{value: 1 ether}();
    }


    // ❌ Book hotel room already occupied
    function testBookHotel_alreadyOccupied() public {
        // First Occupying by Sadi
        vm.deal(sadi, 10 ether);
        vm.prank(sadi);

        hotel.book{value: 5 ether}();

        // Finally Trying to Book from Adnan
        vm.deal(adnan, 10 ether);
        vm.prank(adnan);


        vm.expectRevert(bytes("Currently Occupied"));
        hotel.book{value: 5 ether}();
    }


    // Checking Owner Balance
    function testCheckBalance() public {
        uint balanceBefore = owner.balance;

        vm.deal(sadi, 10 ether);
        vm.prank(sadi);

        hotel.book{value: 5 ether}();

        uint balanceAfter = owner.balance;


        console.log("ETH received:", ((balanceAfter - balanceBefore) / 1 ether)); // ✅ divide by 1 ether to see ETH

    }




}

