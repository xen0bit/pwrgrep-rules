pragma solidity ^0.8.0;
contract C {
    function _transfer(address from, address to, uint256 id) public {
        require(prevOwnership.addr == from, "ok");
        // ruleid: erc721-arbitrary-transferfrom
        _approve(from, to, id);
    }
    function _move(address from, address to, uint256 id) public {
        require(prevOwnership.addr == from, "ok");
        // ruleid: erc721-arbitrary-transferfrom
        _approve(from, to, id);
    }
    function helper(uint256 a) public returns (uint256) {
        // ok: erc721-arbitrary-transferfrom
        return a * 2;
    }
    function helper2(uint256 a) public returns (uint256) {
        // ok: erc721-arbitrary-transferfrom
        return a + 1;
    }
}
