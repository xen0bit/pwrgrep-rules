pragma solidity ^0.8.0;
// A malleable signature stored as used still passes a second time. Recover
// calls followed by a replay-guard store flag; returned recoveries stay
// quiet.
contract Oz {
    mapping(address => bytes32) public used;
    mapping(address => mapping(bytes32 => bool)) public seen;
    function redeem(bytes memory sig) public {
        // ruleid: openzeppelin-ecdsa-recover-malleable
        address r = ECDSA.recover(hash, sig);
        used[r] = sig;
    }
    function redeem2(bytes memory sig) public {
        // ruleid: openzeppelin-ecdsa-recover-malleable
        address r = ECDSA.recover(hash, sig);
        seen[r][sig] = true;
    }
    function redeemOk(bytes memory sig) public returns (address) {
        // ok: openzeppelin-ecdsa-recover-malleable
        address r = ECDSA.recover(hash, sig);
        return r;
    }
    function other(uint256 x) public pure returns (uint256) {
        // ok: openzeppelin-ecdsa-recover-malleable
        return x * 2;
    }
}
