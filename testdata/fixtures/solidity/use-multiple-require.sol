pragma solidity ^0.8.0;
// Splitting one require with && into several costs less gas. Combined
// conditions flag; separate checks stay quiet.
contract Reqs {
    function check(uint256 a, uint256 b) public pure {
        // ruleid: use-multiple-require
        require(a > 0 && b > 0, "bad");
    }
    function check2(uint256 a, uint256 b) public pure {
        // ruleid: use-multiple-require
        require(a > 0 && b > 0);
    }
    // ok: use-multiple-require
    function checkOk(uint256 a, uint256 b) public pure {
        require(a > 0, "bad a");
        require(b > 0, "bad b");
    }
    // ok: use-multiple-require
    function checkPure(uint256 a) public pure returns (uint256) {
        return a * 2;
    }
}
