pragma solidity ^0.8.0;
contract C {
    function f() public returns (uint256) {
        uint256 a = 10;
        // ruleid: use-prefix-decrement-not-postfix
        a--;
        // ruleid: use-prefix-decrement-not-postfix
        a--;
        return a;
    }
    function g() public returns (uint256) {
        uint256 b = 10;
        // ok: use-prefix-decrement-not-postfix
        --b;
        // ok: use-prefix-decrement-not-postfix
        --b;
        return b;
    }
    function h() public returns (uint256) {
        uint256 c = 10;
        // ok: use-prefix-decrement-not-postfix
        c = c - 1;
        return c;
    }
}
