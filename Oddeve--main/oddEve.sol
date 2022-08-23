// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract oddEve {
  uint public score_board= 0;
  uint hitter = 0;
  uint userinput = 0;

  function Rand_num(uint p, uint a) internal view returns (uint) {
    return p + uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, hitter))) % a;
  }

  function Game_reset() public {
    score_board = 0;
    hitter = 0;
    userinput = 0;
  }

  function set_hitter() internal {
    hitter = Rand_num(1, 6);
  }

  function get_decision() internal returns (uint score, string memory status) {
    if (userinput == hitter) {
      uint temp = score_board;
      Game_reset();
      return (temp, "OUT");
    }
    score_board += hitter;
    return (hitter, "RUNS");
  }

  function playGame(uint choice) public {
    userinput = choice;
    set_hitter();
    get_decision();
  }
}
