pragma solidity ^0.8.0;
// Packing two dynamic values then hashing can collide. Packed hashes flag;
// plain hashes stay quiet.
contract Pack {
    function h(bytes memory a, bytes memory b) public pure returns (bytes32) {
        // ruleid: encode-packed-collision
        return keccak256(abi.encodePacked(a, b));
    }
    function h2(string memory a, string memory b) public pure returns (bytes32) {
        // ruleid: encode-packed-collision
        bytes32 x = keccak256(abi.encodePacked(a, b));
        return x;
    }
    // ok: encode-packed-collision
    function hOk(bytes32 a) public pure returns (bytes32) {
        return keccak256(abi.encode(a));
    }
    // ok: encode-packed-collision
    function hPure(uint256 a, uint256 b) public pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }
}
