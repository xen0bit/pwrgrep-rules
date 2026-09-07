pragma solidity ^0.8.0;
contract C {
    // ruleid: balancer-readonly-reentrancy-getrate
    function f(address pool) public returns (uint256) { return pool.getRate(); }
    function _updateTokenRateCache(address pool) public {
        // ok: balancer-readonly-reentrancy-getrate
        uint256 r = pool.getRate();
        stored = r;
    }
    function h(uint256 a) public returns (uint256) {
        // ok: balancer-readonly-reentrancy-getrate
        return a * 2;
    }
    uint256 public stored;
}
