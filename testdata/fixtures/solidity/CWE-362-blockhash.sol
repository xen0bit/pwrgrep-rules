// CWE-362: blockhash
pragma solidity ^0.8.0;
contract Test {
    function vuln() public {
        // ruleid: incorrect-use-of-blockhash
        blockhash(block.number);
    }
    function vuln2() public {
        // ruleid: incorrect-use-of-blockhash
        blockhash(block.number + 1);
    }
    function vuln3() public {
        // ruleid: incorrect-use-of-blockhash
        blockhash(block.number);
    }
    // ok: incorrect-use-of-blockhash
    function safe() public {
        uint x = 1;
    }
    // ok: incorrect-use-of-blockhash
    function safe2() public {
        uint y = 2;
    }
}
