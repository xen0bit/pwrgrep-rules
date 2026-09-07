pragma solidity ^0.8.0;
// Storage slots start zeroed, so writing the default value wastes gas.
// Redundant initializers flag; constants, immutables and locals stay quiet.
contract Inits {
    // ruleid: init-variables-with-default-value
    uint256 public total = 0;
    // ruleid: init-variables-with-default-value
    bool public paused = false;
    // ruleid: init-variables-with-default-value
    string public name = "";
    // ok: init-variables-with-default-value
    uint256 public constant MAX = 100;
    // ok: init-variables-with-default-value
    uint256 public immutable CAP = 100;
    // ok: init-variables-with-default-value
    uint256 public unset;
    function f() public pure returns (uint256) {
        // ok: init-variables-with-default-value
        uint256 x = 0;
        return x;
    }
}
