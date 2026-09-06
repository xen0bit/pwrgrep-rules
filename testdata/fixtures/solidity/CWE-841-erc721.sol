// CWE-841: reentrancy
pragma solidity ^0.8.0;
contract Test {
    function vuln(address to, uint256 tokenId) public {
        // ruleid: erc721-reentrancy
        _checkOnERC721Received(to, to, tokenId, "");
    }
    function vuln2(address to, uint256 tokenId) public {
        // ruleid: erc721-reentrancy
        _checkOnERC721Received(msg.sender, to, tokenId, "");
    }
    function vuln3(address to, uint256 tokenId) public {
        // ruleid: erc721-reentrancy
        _checkOnERC721Received(address(0), to, tokenId, "");
    }
    // ok: erc721-reentrancy
    function safe(address to, uint256 tokenId) public {
        uint x = 1;
    }
    // ok: erc721-reentrancy
    function safe2(address to, uint256 tokenId) public {
        uint y = 2;
    }
    function _helper(address from, address to, uint256 tokenId, bytes memory data) internal {}
}
