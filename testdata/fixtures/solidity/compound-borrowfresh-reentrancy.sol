pragma solidity ^0.8.0;
// borrowFresh must checkpoint interest before paying out; paying first lets
// the borrower compound stale debt. Missing checkpoints flag.
contract Borrow {
    function borrowFresh(address borrower, uint256 idx) public {
        // ruleid: compound-borrowfresh-reentrancy
        doTransferOut(borrower, idx);
    }
    function other(address borrower, uint256 idx) public {
        // ok: compound-borrowfresh-reentrancy
        doTransferIn(borrower, idx);
    }
    function helper(uint256 idx) public pure returns (uint256) {
        // ok: compound-borrowfresh-reentrancy
        return idx * 2;
    }
}
contract BorrowB {
    function borrowFresh(address borrower, uint256 idx) public {
        // ruleid: compound-borrowfresh-reentrancy
        doTransferOut(borrower, idx);
    }
}
