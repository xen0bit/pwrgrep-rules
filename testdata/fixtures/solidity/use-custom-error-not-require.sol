pragma solidity ^0.8.0;
contract C {
    function f(uint256 a) public {
        // ruleid: use-custom-error-not-require
        require(a > 0, "zero");
    }
    function g(uint256 a) public {
        // ruleid: use-custom-error-not-require
        require(a > 1, "small");
    }
    function h(uint256 a) public {
        // ok: use-custom-error-not-require
        if (a == 0) revert CustomError();
    }
    function k(uint256 a) public {
        // ok: use-custom-error-not-require
        if (a == 0) revert CustomError();
    }
}
