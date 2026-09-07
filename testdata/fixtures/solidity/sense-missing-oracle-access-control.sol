pragma solidity ^0.8.0;
// Oracle setters anyone can call let attackers feed prices. Bare external
// and public setters flag; vault-guarded and unrelated functions stay quiet.
contract Sense {
    // ruleid: sense-missing-oracle-access-control
    function setOracle(uint256 REQUEST) external {
        price = REQUEST;
    }
    // ruleid: sense-missing-oracle-access-control
    function setOracle2(uint256 REQUEST) public {
        price = REQUEST;
    }
    // ok: sense-missing-oracle-access-control
    function setGuarded(uint256 REQUEST) external onlyVault {
        price = REQUEST;
    }
    // ok: sense-missing-oracle-access-control
    function other(uint256 x) public {
        price = x;
    }
    uint256 public price;
}
