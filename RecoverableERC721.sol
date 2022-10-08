//SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract RecoverableERC721 is ERC721 {
  address public arbitrator;

  constructor(address _arbitrator) ERC721('Example Collection', 'EXAMPLE') {
    arbitrator = _arbitrator;
  }

  function compensateTheft(address rightfulOwner, uint256 tokenId) external {
    require(msg.sender == arbitrator);
    _owners[tokenId] = rightfulOwner;
  }
}

