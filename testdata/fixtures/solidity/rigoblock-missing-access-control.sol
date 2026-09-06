pragma solidity ^0.8.0;
contract C {
    // ruleid: rigoblock-missing-access-control
    function setMultipleAllowances(address[] memory s) public {
        _set(s);
    }
    function helper(uint256 a) public returns (uint256) {
        // ok: rigoblock-missing-access-control
        return a * 2;
    }
}
contract D {
    // ruleid: rigoblock-missing-access-control
    function setMultipleAllowances(address[] memory s) public {
        _set(s);
    }
    function setGuarded(address[] memory s) public onlyOwner {
        // ok: rigoblock-missing-access-control
        _set(s);
    }
}
