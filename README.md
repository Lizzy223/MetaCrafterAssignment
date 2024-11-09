# Functions and Errors

Functions and Errors

## Description

This is an assignment from metacrafters on errors in soilidity.

## Getting Started

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract AssignmentOnError {
    function testRequire(uint _i) public pure {
    
        require(_i > 9, "Input must be greater than 9");
    }

    function testRevert(uint _i) public pure {
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile AssignmentOnError.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can execute th functions there.

## Authors

 Kolade Elizabeth,Metacrafter Chris 
 [@Lizziee](https://x.com/thisebiragirl,@metacraftersio)
