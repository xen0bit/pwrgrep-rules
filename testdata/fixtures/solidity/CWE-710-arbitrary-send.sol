// CWE-710: arbitrary send
pragma solidity ^0.8.0;
contract Test {
    function vuln(address token, address from, address to, uint amount) public {
        // ruleid: arbitrary-send-erc20
        token.transferFrom(from, to, amount);
    }
    function vuln2(address token, address from, address to, uint amount) public {
        // ruleid: arbitrary-send-erc20
        token.transferFrom(from, to, amount);
    }
    function vuln3(address token, address from, address to, uint amount) public {
        // ruleid: arbitrary-send-erc20
        token.transferFrom(from, to, amount);
    }
    // ok: arbitrary-send-erc20
    function safe(address token, address from, uint amount) public {
        uint x = 1;
    }
    // ok: arbitrary-send-erc20
    function safe2(address token, address from, uint amount) public {
        uint y = 2;
    }
}
