pragma solidity ^0.8.0;
// Checking the allowance slot backwards lets burnFrom skip approval.
// Backwards checks flag; straight checks stay quiet.
contract Tecra {
    mapping(address => mapping(address => uint256)) private _allowances;
    function burnFrom(address from, uint256 amount) public {
        // ruleid: tecra-coin-burnfrom-bug
        require(_allowances[msg.sender][from] >= amount, "low");
        _burn(from, amount);
    }
    function burnFromOk(address from, uint256 amount) public {
        // ok: tecra-coin-burnfrom-bug
        require(_allowances[from][msg.sender] >= amount, "low");
        _burn(from, amount);
    }
    function other(address from, uint256 amount) public {
        // ok: tecra-coin-burnfrom-bug
        require(amount > 0, "zero");
        _burn(from, amount);
    }
}
contract TecraB {
    mapping(address => mapping(address => uint256)) private _allowances;
    function burnFrom(address from, uint256 amount) public {
        // ruleid: tecra-coin-burnfrom-bug
        require(allowance(msg.sender, from) >= amount, "low");
        _burn(from, amount);
    }
}
