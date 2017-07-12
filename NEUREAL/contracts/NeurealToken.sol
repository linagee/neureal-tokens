pragma solidity ^0.4.11;

contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }
contract NECPToken {
    //function totalSupply() returns (uint256);
    function holders() returns (uint256);
    function holder(uint256 i) returns (address, uint256);
}

contract NeurealToken {
    /* Public variables of the token */
    string public constant standard = 'Token 0.1';
    string public constant name = "Neureal Token";
    string public constant symbol = "NEUREAL";
    uint256 public constant decimals = 18;
    uint256 public MAXIMUM_SUPPLY = 150000000000000000000000000;

    //TODO *** Must set this to the Neureal Early Contributor Points (NECP) contract address before creating this!!! ***
    address public transferFromContract = 0xb4315153492424153ffA0c631bf73DA69F362be3;
    
    uint256 public totalSupply = 0;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);

    /* Initializes contract and transfers balances from the transferFromContract */
    function NeurealToken() {
        //TODO try to owner call burnReserveAndLockTransfers() in NECP from here 

        //TODO *** Must call burnReserveAndLockTransfers() as owner in NECPToken before creating this!!! ***
        NECPToken _from = NECPToken(transferFromContract);
        uint256 _fromCount = _from.holders();
        for (uint256 i = 0; i < _fromCount; i++) {
            var (_add, _bal) = _from.holder(i);
            uint256 _balConvert = _bal * 10000000000 * 400; //TODO add multiplier here
            if (_balConvert < _bal) continue; //uint256 overflow
            if (_balConvert < 1000000000000000000) continue; //dust
            uint256 _newTotalSupply = totalSupply + _balConvert;
            if (_newTotalSupply > MAXIMUM_SUPPLY) continue; //max
            if (_newTotalSupply < totalSupply) continue; //uint256 overflow
            balanceOf[_add] = _balConvert;
            totalSupply = _newTotalSupply;
        }
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (_to == 0x0) throw;                               // Prevent transfer to 0x0 address. Use burn() instead
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    /* Approve and then communicate the approved contract in a single tx */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }        

    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (_to == 0x0) throw;                                // Prevent transfer to 0x0 address. Use burn() instead
        if (balanceOf[_from] < _value) throw;                 // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  // Check for overflows
        if (_value > allowance[_from][msg.sender]) throw;     // Check allowance
        balanceOf[_from] -= _value;                           // Subtract from the sender
        balanceOf[_to] += _value;                             // Add the same to the recipient
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    function burn(uint256 _value) returns (bool success) {
        if (balanceOf[msg.sender] < _value) throw;            // Check if the sender has enough
        balanceOf[msg.sender] -= _value;                      // Subtract from the sender
        totalSupply -= _value;                                // Updates totalSupply
        Burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value) returns (bool success) {
        if (balanceOf[_from] < _value) throw;                // Check if the sender has enough
        if (_value > allowance[_from][msg.sender]) throw;    // Check allowance
        balanceOf[_from] -= _value;                          // Subtract from the sender
        totalSupply -= _value;                               // Updates totalSupply
        Burn(_from, _value);
        return true;
    }

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}
