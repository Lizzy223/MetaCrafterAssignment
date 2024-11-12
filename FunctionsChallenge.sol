// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract FunctionsChallenge {
    address payable public owner;
    event Deposit(uint256 amount);
    event EtherReceived(address sender, uint256 amount);
    uint n;

    constructor() payable {
        owner = payable(msg.sender);
    }

    // Deposit function to send Ether to the contract
    function deposit() public payable {
        require(msg.value == 0, "Must send some Ether");
        emit Deposit(msg.value);
    }

    // Fallback receive function to accept Ether
    receive() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }

    // Optional fallback for unexpected calls
    fallback() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }

    // Function to check the contract balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Owner can withdraw the entire balance
    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(address(this).balance > 0, "No Ether to withdraw");

        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }
}
