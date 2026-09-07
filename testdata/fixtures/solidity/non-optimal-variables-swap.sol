pragma solidity ^0.8.0;
// A scratch temporary costs more gas than a tuple swap. Adjacent
// three-statement swaps flag; tuple swaps stay quiet.
contract Swap2 {
    // ruleid: non-optimal-variables-swap
    function swap1(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        uint256 tmp = a;
        a = b;
        b = tmp;
        return (a, b);
    }
    // ruleid: non-optimal-variables-swap
    function swap2(uint256 a, uint256 b) public pure {
        uint256 t = a;
        a = b;
        b = t;
    }
    // ok: non-optimal-variables-swap
    function swapOk(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        return (b, a);
    }
    // ok: non-optimal-variables-swap
    function other(uint256 a) public pure returns (uint256) {
        return a * 2;
    }
}
