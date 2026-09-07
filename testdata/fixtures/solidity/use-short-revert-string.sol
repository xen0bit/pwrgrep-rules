pragma solidity ^0.8.0;
contract C {
    function f(uint256 a) public {
        // ruleid: use-short-revert-string
        require(a > 0, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    }
    function g(uint256 a) public {
        // ok: use-short-revert-string
        require(a > 0, "ok");
    }
    function h(uint256 a) public {
        // ruleid: use-short-revert-string
        if (a == 0) revert("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
    }
    function k(uint256 a) public {
        // ok: use-short-revert-string
        if (a == 0) revert("bad");
    }
}
