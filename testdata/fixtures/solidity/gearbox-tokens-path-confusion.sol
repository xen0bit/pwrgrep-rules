pragma solidity ^0.8.0;
// Slicing an address out of a path by hand misaligns when the path layout
// changes. toAddress uses flag; plain casts stay quiet.
contract Path {
    function cut(bytes memory path) public pure returns (address) {
        // ruleid: gearbox-tokens-path-confusion
        return path.toAddress(path.length - 20);
    }
    function cut2(bytes memory path, uint256 n) public pure returns (address) {
        // ruleid: gearbox-tokens-path-confusion
        return path.toAddress(n);
    }
    // ok: gearbox-tokens-path-confusion
    function castIt(address a) public pure returns (address) {
        return address(a);
    }
    // ok: gearbox-tokens-path-confusion
    function size(bytes memory path) public pure returns (uint256) {
        return path.length;
    }
}
