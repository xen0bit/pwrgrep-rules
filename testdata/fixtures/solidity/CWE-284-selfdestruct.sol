// CWE-284: selfdestruct
pragma solidity ^0.8.0;
contract Test {
    function vuln() public {
        // ruleid: accessible-selfdestruct
        selfdestruct(payable(msg.sender));
    }
    function vuln2() public {
        // ruleid: accessible-selfdestruct
        selfdestruct(payable(address(0)));
    }
    function vuln3() public {
        // ruleid: accessible-selfdestruct
        suicide(payable(msg.sender));
    }
    // ok: accessible-selfdestruct
    function safe() public {
        uint x = 1;
    }
    // ok: accessible-selfdestruct
    function safe2() public {
        uint y = 2;
    }
    address owner;
}
