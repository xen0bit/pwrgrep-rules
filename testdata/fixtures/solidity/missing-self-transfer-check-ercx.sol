pragma solidity ^0.8.0;
// Crediting the same account twice on a self transfer mints value from
// nothing. Unguarded balance writes flag; from!=to guarded ones stay quiet.
contract SelfTx {
    mapping(address => uint256) private _balances;
    function updateBad(address from, address to, uint256 value) public {
        // ruleid: missing-self-transfer-check-ercx
        _balances[from] = _balances[from] - value;
        // ruleid: missing-self-transfer-check-ercx
        _balances[to] = _balances[to] + value;
    }
    function updateOk(address from, address to, uint256 value) public {
        if (from != to) {
            // ok: missing-self-transfer-check-ercx
            _balances[from] = _balances[from] - value;
            // ok: missing-self-transfer-check-ercx
            _balances[to] = _balances[to] + value;
        }
    }
}
