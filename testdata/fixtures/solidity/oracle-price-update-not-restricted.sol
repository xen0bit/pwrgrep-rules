pragma solidity ^0.8.0;
contract C {
    address public owner;
    uint256 public price;
    uint256 public rate;
    // ruleid: oracle-price-update-not-restricted
    function setPrice(uint256 p) public {
        price = p;
    }
    // ruleid: oracle-price-update-not-restricted
    function setRate(uint256 r) public {
        rate = r;
    }
    function setGuarded(uint256 r) public onlyOwner {
        // ok: oracle-price-update-not-restricted
        rate = r;
    }
    function setSybil(uint256 r) public onlySybil {
        // ok: oracle-price-update-not-restricted
        rate = r;
    }
}
