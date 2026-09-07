pragma solidity ^0.8.0;
// Storage reads inside loops repeat every iteration. Loop headers flag so
// the reviewer can hoist state reads into locals; straight-line code stays
// quiet.
contract Loop {
    uint256 public total;
    function sums(uint256 n) public view returns (uint256) {
        uint256 s = 0;
        // ruleid: state-variable-read-in-a-loop
        for (uint256 i = 0; i < n; i++) {
            s += total;
        }
        return s;
    }
    function sums2(uint256 n) public view returns (uint256) {
        uint256 s = 0;
        // ruleid: state-variable-read-in-a-loop
        while (s < n) {
            s += total;
        }
        return s;
    }
    // ok: state-variable-read-in-a-loop
    function bump(uint256 y) public {
        total += y;
    }
    // ok: state-variable-read-in-a-loop
    function get() public view returns (uint256) {
        return total;
    }
}
