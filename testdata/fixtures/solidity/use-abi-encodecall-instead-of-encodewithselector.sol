pragma solidity ^0.8.0;
// abi.encodeCall checks argument types at compile time; the Selector form
// does not. Selector calls flag; the typed forms stay quiet.
contract Encode {
    function enc(bytes32 sel, bytes memory a) public pure returns (bytes memory) {
        // ruleid: use-abi-encodecall-instead-of-encodewithselector
        return abi.encodeWithSelector(sel, a);
    }
    function enc2(address t, uint256 v) public pure returns (bytes memory) {
        // ruleid: use-abi-encodecall-instead-of-encodewithselector
        return abi.encodeWithSelector(bytes4(keccak256("go(uint256)")), v);
    }
    // ok: use-abi-encodecall-instead-of-encodewithselector
    function encOk(address t, uint256 v) public pure returns (bytes memory) {
        return abi.encodeCall(t, v);
    }
    // ok: use-abi-encodecall-instead-of-encodewithselector
    function encPacked(uint256 v) public pure returns (bytes memory) {
        return abi.encodePacked(v);
    }
}
