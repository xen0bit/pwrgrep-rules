pragma solidity ^0.8.0;
// An unvalidated context lets calldata impersonate other accounts. Decoding
// without a validity check flags; other calls stay quiet.
contract Flow {
    function useCtx(bytes calldata ctx) public {
        // ruleid: superfluid-ctx-injection
        decodeCtx(ctx);
    }
    function useCtx2(bytes calldata ctx) public {
        // ruleid: superfluid-ctx-injection
        decodeCtx(ctx);
    }
    function other(bytes calldata ctx) public {
        // ok: superfluid-ctx-injection
        encodeCtx(ctx);
    }
    function pureIt(uint256 x) public pure returns (uint256) {
        // ok: superfluid-ctx-injection
        return x * 2;
    }
}
