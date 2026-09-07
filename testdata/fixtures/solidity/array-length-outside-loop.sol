pragma solidity ^0.8.0;
contract C {
    uint256 public total;
    function f(uint256[] memory a) public {
        // ruleid: array-length-outside-loop
        for (uint256 i = 0; i < a.length; i++) {
            total += a[i];
        }
    }
    function g(uint256[] memory a) public {
        // ruleid: array-length-outside-loop
        for (uint256 i = 0; i < a.length; i++) {
            total += 1;
        }
    }
    function h(uint256[] memory a) public {
        // ok: array-length-outside-loop
        uint256 n = a.length;
        for (uint256 i = 0; i < n; i++) {
            total += 1;
        }
    }
    function k(uint256[] memory a) public returns (uint256) {
        // ok: array-length-outside-loop
        uint256 n = a.length;
        return n;
    }
}
