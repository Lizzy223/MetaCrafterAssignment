// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract AssignmentOnError {
    function testRequire(uint _i) public pure {
    
        require(_i > 9, "Input must be greater than 9");
    }

    function testRevert(uint _i) public pure {
        // revert returns the gas fee used
        if (_i <= 9) {
            revert("Input must be greater than 9");
        }
    }

    uint public num;

    function testAssert() public view {
        // since it is impossible to update the value of num
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}
