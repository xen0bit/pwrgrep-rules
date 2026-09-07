pragma solidity ^0.8.0;
contract C {
    function f(uint256 n) public returns (uint256) {
        uint256 s = 0;
        // ruleid: unnecessary-checked-arithmetic-in-loop
        // ruleid: unnecessary-checked-arithmetic-in-loop
        for (uint256 i = 0; i < n; i++) {
            s += i;
        }
        return s;
    }
    function g(uint256 n) public returns (uint256) {
        uint256 s = 0;
        // ruleid: unnecessary-checked-arithmetic-in-loop
        // ruleid: unnecessary-checked-arithmetic-in-loop
        for (uint256 j = 0; j < n; j++) {
            s += j;
        }
        return s;
    }
    function h(uint256 n) public returns (uint256) {
        // ok: unnecessary-checked-arithmetic-in-loop
        return n * 2;
    }
    function k(uint256 n) public returns (uint256) {
        // ok: unnecessary-checked-arithmetic-in-loop
        uint256 s = n + 1;
        return s;
    }
}
