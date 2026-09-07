pragma solidity ^0.8.0;
// Nested ifs cost less gas than one condition joined with &&. Joined
// conditions flag; nested checks stay quiet.
contract Nests {
    function nest(uint256 a, uint256 b) public pure returns (uint256) {
        // ruleid: use-nested-if
        if (a > 0 && b > 0) {
            return a + b;
        }
        return 0;
    }
    function nest2(uint256 a, uint256 b, uint256 c) public pure returns (uint256) {
        // ruleid: use-nested-if
        if (a > 0 && b > 0 && c > 0) {
            return a;
        }
        return 0;
    }
    // ok: use-nested-if
    function nestOk(uint256 a, uint256 b) public pure returns (uint256) {
        if (a > 0) {
            if (b > 0) {
                return a + b;
            }
        }
        return 0;
    }
    // ok: use-nested-if
    function plain(uint256 a) public pure returns (uint256) {
        return a * 2;
    }
}
