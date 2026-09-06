pragma solidity ^0.8.0;
contract C {
    address public pool;
    function f() public returns (uint256) {
        // ruleid: curve-readonly-reentrancy
        return pool.get_virtual_price();
    }
    function g() public returns (uint256) {
        // ruleid: curve-readonly-reentrancy
        uint256 p = pool.get_virtual_price();
        return p;
    }
    function h(uint256 a) public returns (uint256) {
        // ok: curve-readonly-reentrancy
        return a * 2;
    }
    function k() public {
        // ok: curve-readonly-reentrancy
        uint256 x = 1;
    }
}
