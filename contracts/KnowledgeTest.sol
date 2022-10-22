//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    function changeTokens() external {
        tokens[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

	function transferAll(address payable _receiver) external {
		require(msg.sender == owner, "ONLY_OWNER");
		_receiver.transfer(getBalance());
	}

	function start() external {
		players.push(msg.sender);
	}

	function concatenate (string calldata a, string calldata b) public pure returns (string memory) {
		return string(abi.encodePacked(a, b));
	}

    receive() payable external {}
}
