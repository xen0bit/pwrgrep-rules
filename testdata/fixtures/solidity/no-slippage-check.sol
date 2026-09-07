pragma solidity ^0.8.0;
// A zero (or max) slippage limit accepts any price move. Zero limits flag;
// real minimums stay quiet.
contract SwapLim {
    function go(address r, uint256 aIn) public {
        // ruleid: no-slippage-check
        router.swapExactTokensForTokens(aIn, 0, path, to, dl);
    }
    function go2(address r, uint256 aIn) public {
        // ruleid: no-slippage-check
        router.swapExactTokensForETH(aIn, 0, path, to, dl);
    }
    function goOk(address r, uint256 aIn) public {
        // ok: no-slippage-check
        router.swapExactTokensForTokens(aIn, 100, path, to, dl);
    }
    function goOk2(address r, uint256 aIn) public {
        // ok: no-slippage-check
        router.swapExactTokensForETH(aIn, minOut, path, to, dl);
    }
    address public router;
    address[] public path;
    address public to;
    uint256 public dl;
    uint256 public minOut;
}
