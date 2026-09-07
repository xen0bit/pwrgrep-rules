pragma solidity ^0.8.0;
// Reducing someone else's allowance with _approve lets the caller spend it.
// transferFrom() functions that do so flag; plain approvals stay quiet.
contract Redacted {
    function transferFrom(address s, address r, uint256 amt) public returns (bool) {
        // ruleid: redacted-cartel-custom-approval-bug
        _approve(s, allowance(s, r).sub(amt), 0);
        return true;
    }
    function transferFromOk(address s, address r, uint256 amt) public returns (bool) {
        // ok: redacted-cartel-custom-approval-bug
        _approve(s, amt, 0);
        return true;
    }
    function other(address s, uint256 amt) public {
        // ok: redacted-cartel-custom-approval-bug
        _approve(s, amt, 0);
    }
}
contract RedactedB {
    function transferFrom(address s, address r, uint256 amt) public returns (bool) {
        // ruleid: redacted-cartel-custom-approval-bug
        _approve(s, allowance(s, r).sub(amt), 0);
        return true;
    }
}
