//SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RecoverableERC20 is ERC20 {
  address public arbitrator;

  constructor(address _arbitrator) ERC20('Example Token', 'EXAMPLE') {
    arbitrator = _arbitrator;
  }

  function compensateTheft(address thief, address rightfulOwner, uint256 amount) external {
    require(msg.sender == arbitrator);
    _transfer(thief, rightfulOwner, amount);
  }
}
