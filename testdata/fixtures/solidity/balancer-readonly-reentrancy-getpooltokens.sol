pragma solidity ^0.8.0;
// Reading pool tokens without reentrancy context can return transient
// mid-swap values. Unguarded reads flag; guarded reads stay quiet.
contract Bal {
    // ruleid: balancer-readonly-reentrancy-getpooltokens
    function quote(address vault, bytes32 pool) public view returns (uint256[] memory) {
        uint256[] memory tokens = vault.getPoolTokens(pool);
        return tokens;
    }
    // ruleid: balancer-readonly-reentrancy-getpooltokens
    function quote2(address vault, bytes32 pool) public view returns (uint256[] memory) {
        return vault.getPoolTokens(pool);
    }
    // ok: balancer-readonly-reentrancy-getpooltokens
    function quoteOk(address vault, bytes32 pool) public view returns (uint256[] memory) {
        VaultReentrancyLib.ensureNotInVaultContext(vault);
        uint256[] memory tokens = vault.getPoolTokens(pool);
        return tokens;
    }
    // ok: balancer-readonly-reentrancy-getpooltokens
    function other(uint256 x) public pure returns (uint256) {
        return x * 2;
    }
}
