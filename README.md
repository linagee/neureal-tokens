# Ethereum contracts for Neureal

### Ethereum standard token contracts (ERC20)
- Neureal Early Contributor Points (NECPToken.sol)
- Neureal Token including a token sale contract (NeurealToken.sol)

## Neureal Early Contributor Points - Token Contract Information

- Symbol: NECP
- Name: Neureal Early Contributor Points
- Address: 0x91923993C4Dc3e089BBb1fc9d4A5A765A479B68f
- Decimal places: 8 // Aligns with bitcoin not the 18 in ethereum
- Total supply: 30,000

### Counterparty To Ethereum Token Conversion

A centralized approach will be used to transfer balances from the Counterparty token NEUREAL (https://counterpartychain.io/asset/NEUREAL) to the NECP token.

### How To Watch The Token In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH TOKEN to open the Add token window. Then:

- Under TOKEN CONTRACT ADDRESS, enter 0x91923993C4Dc3e089BBb1fc9d4A5A765A479B68f
- The additional fields should automatically be filled in.

- Click OK

### How To Watch The Token Contract In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH CONTRACT to open the Watch contract window. Then:

- Under CONTRACT NAME, enter Neureal Early Contributor Points
- Under CONTRACT ADDRESS, enter 0x91923993C4Dc3e089BBb1fc9d4A5A765A479B68f
- Copy the Standard ERC20 Application Binary Interface below and paste it into the JSON INTERFACE text box

```javascript
[ { "constant": false, "inputs": [], "name": "freezeTransfers", "outputs": [], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "frozen", "outputs": [ { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "name", "outputs": [ { "name": "", "type": "string", "value": "Neureal Early Contributor Points" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [ { "name": "", "type": "uint256", "value": "3000000000000" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [ { "name": "", "type": "uint256", "value": "8" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "MAXIMUM_SUPPLY", "outputs": [ { "name": "", "type": "uint256", "value": "3000000000000" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "standard", "outputs": [ { "name": "", "type": "string", "value": "Token 0.1" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "", "type": "address" } ], "name": "balanceOf", "outputs": [ { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [ { "name": "", "type": "address", "value": "0xb8f527da18d3ef8be32730229d598775cc6b659a" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [ { "name": "", "type": "string", "value": "NECP" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "_to", "type": "address" }, { "name": "_value", "type": "uint256" } ], "name": "transfer", "outputs": [], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" }, { "payable": false, "type": "fallback" }, { "anonymous": false, "inputs": [ { "indexed": true, "name": "from", "type": "address" }, { "indexed": true, "name": "to", "type": "address" }, { "indexed": false, "name": "value", "type": "uint256" } ], "name": "Transfer", "type": "event" } ]
```

.

## Neureal Token - Token Sale Contract Information

- Symbol: NEUREAL
- Name: Neureal Token
- Address: 
- Decimal places: 18
- Maximum supply: 324,000,000

### NEUREAL-ECP To NEUREAL Token Conversion

The balances are transfered as part of the NEUREAL contract.

### How To Watch The Token In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH TOKEN to open the Add token window. Then:

- Under TOKEN CONTRACT ADDRESS, enter 
- The additional fields should automatically be filled in.

- Click OK

### How To Watch The Token Contract In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH CONTRACT to open the Watch contract window. Then:

- Under CONTRACT NAME, enter Neureal Early Contributor Points
- Under CONTRACT ADDRESS, enter 
- Copy the Standard ERC20 Application Binary Interface below and paste it into the JSON INTERFACE text box

```javascript

```

.

