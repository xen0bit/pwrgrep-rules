pragma solidity ^0.8.0;
// x += y on a state variable costs more than x = x + y. Every += is listed
// so the reviewer can confirm the target lives in storage, not memory.
contract Incr {
    uint256 public total;
    function bump(uint256 y) public {
        // ruleid: inefficient-state-variable-increment
        total += y;
    }
    function bump2(uint256 y) public {
        // ruleid: inefficient-state-variable-increment
        total += y * 2;
    }
    // ok: inefficient-state-variable-increment
    function bumpOk(uint256 y) public {
        total = total + y;
    }
    // ok: inefficient-state-variable-increment
    function bumpPure(uint256 y) public pure returns (uint256) {
        return y * 2;
    }
}
