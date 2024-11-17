// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./token_Function.sol";

contract MyToken is LizzieToken {
    constructor()  LizzieToken("lizzietoken", "lt", 5) {
        _mints(msg.sender, 100 * 10 ** uint256(decimals));
    }

}










