pragma solidity ^0.8.0;
// Calling back into the sender mid-transfer lets it reenter. transfer()
// functions that call out flag; plain transfers stay quiet.
contract T677 {
    function transfer(address to, uint256 amount) public {
        // ruleid: erc677-reentrancy
        callAfterTransfer(to, amount);
    }
    function transferOk(address to, uint256 amount) public {
        // ok: erc677-reentrancy
        emit Sent(to, amount);
    }
    function other(uint256 amount) public {
        // ok: erc677-reentrancy
        burn(amount);
    }
}
contract T677b {
    function transfer(address to, uint256 amount) public {
        // ruleid: erc677-reentrancy
        callAfterTransfer(to, amount);
    }
}
