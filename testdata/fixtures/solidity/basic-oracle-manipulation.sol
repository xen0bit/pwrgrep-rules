pragma solidity ^0.8.0;
// Pricing from a spot division moves with one swap. Divisions by a supply
// value inside price functions flag; other math stays quiet.
contract Oracle {
    function getPrice(uint256 reserve) public view returns (uint256) {
        // ruleid: basic-oracle-manipulation
        return reserve / totalSupply();
    }
    function getPrice2(uint256 reserve, uint256 supply) public view returns (uint256) {
        // ruleid: basic-oracle-manipulation
        return reserve.div(supply * totalSupply());
    }
    function getPriceOk(uint256 reserve) public view returns (uint256) {
        // ok: basic-oracle-manipulation
        return reserve * 2;
    }
    function other(uint256 reserve, uint256 supply) public view returns (uint256) {
        // ok: basic-oracle-manipulation
        return reserve / supply;
    }
}
