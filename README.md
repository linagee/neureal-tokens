# Ethereum contracts for Neureal

### Ethereum standard token contracts (ERC20)
- Neureal Early Contributor Points (NECP.sol)
- Neureal Token including a token sale contract (NEUREAL.sol)

### Counterparty To Ethereum Token Conversion

A centralized approach will be used to transfer balances from the Counterparty token NEUREAL (https://counterpartychain.io/asset/NEUREAL) to the NECP token.

### Neureal Early Contributor Points Token Contract Information

- Symbol: NECP
- Name: Neureal Early Contributor Points
- Address: 0xB8f527Da18D3ef8BE32730229D598775cc6B659a
- Decimal places: 8 // Aligns with bitcoin not the 18 in ethereum
- Total supply: 30,000

### NEUREAL-ECP To NEUREAL Token Conversion

The balances are automatically transfered as part of the NEUREAL contract.

### Token Sale Contract Information

- Symbol: NEUREAL
- Name: Neureal Token
- Address: 0xEc9b2392B1dcc5bd9e92A2EEf9CeCF16aff0816c
- Decimal places: 18
- Total supply: 25,000,000

### How To Watch The Token In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH TOKEN to open the Add token window. Then:

- Under TOKEN CONTRACT ADDRESS, enter 0xB8f527Da18D3ef8BE32730229D598775cc6B659a or 0xEc9b2392B1dcc5bd9e92A2EEf9CeCF16aff0816c
- The additional fields should automatically be filled in.

- Click OK

### How To Watch The Token Contract In Ethereum Wallet / Mist

In Ethereum Wallet / Mist, select the CONTRACTS tab and click WATCH CONTRACT to open the Watch contract window. Then:

- Under CONTRACT NAME, enter NEUREAL-ECP or NEUREAL
- Under CONTRACT ADDRESS, enter 0xB8f527Da18D3ef8BE32730229D598775cc6B659a or 0xEc9b2392B1dcc5bd9e92A2EEf9CeCF16aff0816c
- Copy the Standard ERC20 Application Binary Interface below and paste it into the JSON INTERFACE text box

```javascript
[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"version","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"},{"name":"_extraData","type":"bytes"}],"name":"approveAndCall","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"type":"function"},{"inputs":[{"name":"_initialAmount","type":"uint256"},{"name":"_tokenName","type":"string"},{"name":"_decimalUnits","type":"uint8"},{"name":"_tokenSymbol","type":"string"}],"payable":false,"type":"constructor"},{"payable":false,"type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_owner","type":"address"},{"indexed":true,"name":"_spender","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Approval","type":"event"}]
```

.
