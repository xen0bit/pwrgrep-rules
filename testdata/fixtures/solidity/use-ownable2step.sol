pragma solidity ^0.8.0;
// Ownable hands control to an address that may not want it; the two-step
// variant requires acceptance. Plain Ownable flags; two-step stays quiet.
import {Ownable} from "./Ownable.sol";
import {Ownable2Step} from "./Ownable2Step.sol";
// ruleid: use-ownable2step
contract A is Ownable {
    uint256 public x;
}
// ruleid: use-ownable2step
contract B is OwnableUpgradeable {
    uint256 public x;
}
// ok: use-ownable2step
contract C is Ownable2Step {
    uint256 public x;
}
// ok: use-ownable2step
contract D is Pausable {
    uint256 public x;
}
