// CWE-829: lowlevel
pragma solidity ^0.8.0;
contract Test {
    function vuln(address target, bytes memory data) public {
        // ruleid: arbitrary-low-level-call
        target.call(data);
    }
    function vuln2(address target, bytes memory data) public {
        // ruleid: arbitrary-low-level-call
        target.call(data);
    }
    function vuln3(address target, bytes memory data) public {
        // ruleid: arbitrary-low-level-call
        target.call(data);
    }
    // ok: arbitrary-low-level-call
    function safe() public {
        uint x = 1;
    }
    // ok: arbitrary-low-level-call
    function safe2() public {
        uint y = 2;
    }
}
