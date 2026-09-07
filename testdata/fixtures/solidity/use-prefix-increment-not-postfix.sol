pragma solidity ^0.8.0;
contract C {
    function f() public returns (uint256) {
        uint256 a = 0;
        // ruleid: use-prefix-increment-not-postfix
        a++;
        // ruleid: use-prefix-increment-not-postfix
        a++;
        return a;
    }
    function g() public returns (uint256) {
        uint256 b = 0;
        // ok: use-prefix-increment-not-postfix
        ++b;
        // ok: use-prefix-increment-not-postfix
        ++b;
        return b;
    }
    function h() public returns (uint256) {
        uint256 c = 0;
        // ok: use-prefix-increment-not-postfix
        c = c + 1;
        return c;
    }
}
