pragma solidity ^0.8.0;
// A multicall batch replays the same msg.value for every subcall, so logic
// that spends it runs once per call. Uses inside Multicall flag.
contract M is Multicall {
    function pay() public payable {
        // ruleid: msg-value-multicall
        x = msg.value;
    }
    function pay2() public payable {
        // ruleid: msg-value-multicall
        y = msg.value;
    }
    function viewIt() public view returns (uint256) {
        // ok: msg-value-multicall
        return x;
    }
    function nopay(uint256 a) public pure returns (uint256) {
        // ok: msg-value-multicall
        return a * 2;
    }
    uint256 public x;
    uint256 public y;
}
