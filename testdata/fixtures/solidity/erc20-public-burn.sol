pragma solidity ^0.8.0;
// A public burn over an arbitrary account destroys anyone's tokens. Open
// burns flag; sender-scoped burns stay quiet.
contract Burnable {
    // ruleid: erc20-public-burn
    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }
    // ok: erc20-public-burn
    function burnMine(uint256 amount) public {
        _burn(msg.sender, amount);
    }
    // ok: erc20-public-burn
    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }
}
contract BurnableB {
    // ruleid: erc20-public-burn
    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }
}
