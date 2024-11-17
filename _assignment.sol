// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;


contract AssignmentOnError {
    uint public amount;
    mapping(address => uint256) public balanceOf;

    // Function to deposit tokens into the contract (for testing)
    function deposit() public payable {
        balanceOf[msg.sender] =100 + msg.value;
    }

    function transfer(uint256 _amount) public {
        // Check if the sender has enough balance using `require`
        require(balanceOf[msg.sender] >= _amount, "Insufficient funds");

        // Perform the balance deduction
        balanceOf[msg.sender] -= _amount;

        // Use `assert` to ensure that the sender's balance is logically consistent
        //    This is used to check an internal state that should always be true
        assert(balanceOf[msg.sender] + _amount >= _amount);

        //  Use `revert` with a condition to illustrate an error state explicitly
        if (balanceOf[msg.sender] < 0) {
            revert("Balance became negative (This should never happen)");
        }

    }
}

