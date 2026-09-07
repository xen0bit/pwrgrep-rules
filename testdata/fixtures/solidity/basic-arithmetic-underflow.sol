pragma solidity ^0.8.0;
// 0.8 checked math reverts on underflow, but the pattern is still worth a
// look wherever an operand is user influenced. Subtractions flag.
contract Arith {
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        // ruleid: basic-arithmetic-underflow
        uint256 c = a - b;
        return c;
    }
    function sub2(uint256 total, uint256 amount) public pure returns (uint256) {
        // ruleid: basic-arithmetic-underflow
        return total - amount;
    }
    // ok: basic-arithmetic-underflow
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
    // ok: basic-arithmetic-underflow
    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }
}
