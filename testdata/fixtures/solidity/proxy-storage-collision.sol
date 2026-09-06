pragma solidity ^0.8.0;
// ruleid: proxy-storage-collision
contract C is Ownable, TransparentUpgradeableProxy, Pausable {
    address public implementation;
    constructor(address impl) {
        implementation = impl;
    }
}
contract E is Ownable, TransparentUpgradeableProxy, Pausable {
    // ok: proxy-storage-collision
    address public immutable implementation;
    constructor(address impl) {
        implementation = impl;
    }
}
contract Neutral {
    // ok: proxy-storage-collision
    uint256 public x;
}
