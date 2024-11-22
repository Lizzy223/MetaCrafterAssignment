// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LizzieToken is ERC20, Ownable {
    constructor() ERC20("lizzietoken", "lt") Ownable(msg.sender) {
         _mint(msg.sender, 1000*10**decimals());
         }

    // Only the owner can mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Any user can burn their tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}

