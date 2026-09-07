pragma solidity ^0.8.0;
contract C {
    address public owner;
    // ruleid: unrestricted-transferownership
    function transferOwnership(address n) public {
        owner = n;
    }
    function helper(uint256 a) public returns (uint256) {
        // ok: unrestricted-transferownership
        return a * 2;
    }
}
contract D {
    address public owner;
    // ruleid: unrestricted-transferownership
    function transferOwnership(address n) public {
        owner = n;
    }
    function transferGuarded(address n) public onlyOwner {
        // ok: unrestricted-transferownership
        owner = n;
    }
}
