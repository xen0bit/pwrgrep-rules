// CWE-477: origin
pragma solidity ^0.8.0;
contract Test {
    function vuln() public {
        // ruleid: tx-origin
        require(tx.origin == msg.sender);
    }
    function vuln2() public {
        // ruleid: tx-origin
        address a = tx.origin;
    }
    function vuln3() public {
        // ruleid: tx-origin
        if (tx.origin == msg.sender) {}
    }
    // ok: tx-origin
    function safe() public {
        require(msg.sender == owner, "not owner");
    }
    // ok: tx-origin
    function safe2() public {
        uint x = 1;
    }
    address owner;
}
