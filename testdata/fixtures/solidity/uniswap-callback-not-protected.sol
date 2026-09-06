pragma solidity ^0.8.0;
contract C {
    // ruleid: uniswap-callback-not-protected
    function uniswapV2Call(address s, uint256 a, uint256 b, bytes calldata d) public {
        uint256 x = 1;
    }
    // ruleid: uniswap-callback-not-protected
    function uniswapV3SwapCallback(int256 a, int256 b, bytes calldata d) public {
        uint256 y = 2;
    }
    function uniswapV3FlashCallback(uint256 f, uint256 s, bytes calldata d) public {
        // ok: uniswap-callback-not-protected
        require(msg.sender == pool, "bad");
    }
    function helper(uint256 a) public returns (uint256) {
        // ok: uniswap-callback-not-protected
        return a * 2;
    }
    address public pool;
}
