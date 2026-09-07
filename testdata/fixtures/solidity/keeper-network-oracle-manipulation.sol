pragma solidity ^0.8.0;
// Keep3r feeds are cheap to skew: two manipulated points move the price.
// current() calls flag; other oracle reads stay quiet.
contract Keep {
    function q(address keeper, address tIn, uint256 aIn) public returns (uint256) {
// ruleid: keeper-network-oracle-manipulation
        return keeper.current(tIn, aIn, tIn);
    }
    function q2(address keeper, address tIn) public view returns (uint256) {
// ruleid: keeper-network-oracle-manipulation
        return keeper.current(tIn, 0, tIn);
    }
// ok: keeper-network-oracle-manipulation
    function qOk(address keeper, address tIn) public view returns (uint256) {
        return keeper.last(tIn);
    }
// ok: keeper-network-oracle-manipulation
    function qPure(uint256 a) public pure returns (uint256) {
        return a * 2;
    }
}
