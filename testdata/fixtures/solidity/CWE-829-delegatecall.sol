// CWE-829: delegatecall
pragma solidity ^0.8.0;
contract Test {
    function vuln(address target, bytes memory data) public {
        // ruleid: delegatecall-to-arbitrary-address
        target.delegatecall(data);
    }
    function vuln2(address target, bytes memory data) public {
        // ruleid: delegatecall-to-arbitrary-address
        target.delegatecall(data);
    }
    function vuln3(address target, bytes memory data) public {
        // ruleid: delegatecall-to-arbitrary-address
        target.delegatecall(data);
    }
    // ok: delegatecall-to-arbitrary-address
    function safe() public {
        uint x = 1;
    }
    // ok: delegatecall-to-arbitrary-address
    function safe2() public {
        uint y = 2;
    }
}
