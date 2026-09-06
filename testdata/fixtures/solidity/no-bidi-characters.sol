pragma solidity ^0.8.0;
contract C {
    function f() public {
        // ruleid: no-bidi-characters
        string memory a = "first‮token";
    }
    function g() public {
        // ruleid: no-bidi-characters
        string memory b = "second‮token";
    }
    function h() public {
        // ok: no-bidi-characters
        uint256 x = 1;
    }
    function k() public {
        // ok: no-bidi-characters
        uint256 y = 2;
    }
}
