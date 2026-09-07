pragma solidity ^0.8.0;
// Anyone may call an unguarded sweepToken and take stray tokens. Open
// sweepers flag; access-controlled ones stay quiet.
contract Sweep {
    // ruleid: compound-sweeptoken-not-restricted
    function sweepToken(address token, address to) public {
        token.transfer(to, 100);
    }
    // ok: compound-sweeptoken-not-restricted
    function sweepTokenGuarded(address token, address to) public onlyOwner {
        token.transfer(to, 100);
    }
    function other(address token, address to) public {
        // ok: compound-sweeptoken-not-restricted
        token.transfer(to, 100);
    }
}
contract SweepB {
    // ruleid: compound-sweeptoken-not-restricted
    function sweepToken(address token, address to) public {
        token.transfer(to, 100);
    }
}
