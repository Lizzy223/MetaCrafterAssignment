// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // Constructor to set the token name and symbol
    constructor() ERC20("MyToken", "MTK") {}

    // Mint function restricted to only the owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
