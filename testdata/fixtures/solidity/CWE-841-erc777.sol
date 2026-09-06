// CWE-841: reentrancy 777
pragma solidity ^0.8.0;
contract Test {
    function vuln(address to, uint amount) public {
        // ruleid: erc777-reentrancy
        tokensReceived(to, amount);
    }
    function vuln2(address to, uint amount) public {
        // ruleid: erc777-reentrancy
        tokensReceived(to, amount);
    }
    function vuln3(address to, uint amount) public {
        // ruleid: erc777-reentrancy
        tokensReceived(to, amount);
    }
    // ok: erc777-reentrancy
    function safe(address to, uint amount) public {
        uint x = 1;
    }
    // ok: erc777-reentrancy
    function safe2(address to, uint amount) public {
        uint y = 2;
    }
    function helper(address to, uint amount) internal {}
}
