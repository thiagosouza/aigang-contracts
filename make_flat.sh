#!/usr/bin/env bash

#pip3 install solidity-flattener --no-cache-dir -U
solidity_flattener contracts/EventEmitter.sol --out flat/EventEmitter_flat.sol 
solidity_flattener contracts/ContractManager.sol --out flat/ContractManager_flat.sol 
solidity_flattener contracts/insuranceProducts/Wallet.sol --out flat/insuranceProducts/Wallet_flat.sol --solc-paths="..=contracts"
solidity_flattener contracts/insuranceProducts/InvestmentManager.sol --out flat/insuranceProducts/InvestmentManager_flat.sol --solc-paths="..=contracts"


