pragma solidity ^0.8.0;
// A non-payable constructor cannot receive ether by mistake, but marking it
// payable saves gas when nothing else needs the check. Plain constructors
// flag; payable ones stay quiet.
contract Ctor {
    // ruleid: non-payable-constructor
    constructor() {
        total = 0;
    }
    uint256 public total;
    // ok: non-payable-constructor
    function paid() public payable {
        total = 1;
    }
}
contract CtorPaid {
    // ok: non-payable-constructor
    constructor() payable {
        total = 0;
    }
    uint256 public total;
}
contract CtorArgs {
    // ruleid: non-payable-constructor
    constructor(uint256 start) {
        total = start;
    }
    uint256 public total;
}
