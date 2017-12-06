pragma solidity ^0.4.13;

import "./helpers/Ownable.sol";
import "./interfaces/IEventEmitter.sol";
import "./interfaces/IContractManager.sol";

contract ContractManager is Ownable, IContractManager {
	mapping (string => address) contracts;
	IEventEmitter logger;

	function ContractManager(address eventEmitter) public {
		logger = IEventEmitter(eventEmitter);
	}

	function setContract(string name, address contractAddress) public onlyOwner {
		contracts[name] = contractAddress;
		logger.info("[ContractManager] Contract address is set", name);
	}

	function removeContract(string name) public onlyOwner {
		require(contracts[name] != 0);

		contracts[name] = 0;
		logger.info("[ContractManager] Contract address is removed", name);
	}

	function getContract(string name) constant public returns (address contractAddress) {
		require(contracts[name] != 0);

		return contracts[name];
	}

	function changeEventEmitter(address eventEmitter) public onlyOwner {
		logger = IEventEmitter(eventEmitter);
		logger.info("[ContractManager] event emiter is changed");
	}
}