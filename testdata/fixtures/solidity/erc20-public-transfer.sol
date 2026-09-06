pragma solidity ^0.8.0;
contract C {
    // ruleid: erc20-public-transfer
    function _transfer(address a, address b, uint256 v) public {
        _do(a, b, v);
    }
    // ok: erc20-public-transfer
    function _move(address a, address b, uint256 v) internal {
        _do(a, b, v);
    }
}
contract D {
    // ruleid: erc20-public-transfer
    function _transfer(address a, address b, uint256 v) public {
        _do(a, b, v);
    }
    function helper(uint256 a) public returns (uint256) {
        // ok: erc20-public-transfer
        return a * 2;
    }
}
