// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract AssignmentOnError {
    uint public amount;
    mapping(address => uint256) public balanceOf;

    // Function to deposit tokens into the contract (for testing)
    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
    }

    function transfer(uint256 amount) public {
        // Check if sender has enough balance
        require(balanceOf[msg.sender] >= amount, "Insufficient funds");

        // Perform the transfer
        balanceOf[msg.sender] -= amount;
    }
}
