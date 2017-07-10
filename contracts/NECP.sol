pragma solidity ^0.4.11;
contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }
contract owned {
    address public owner;
    function owned() {
        owner = msg.sender;
    }
    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }
    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract NECPToken {
    /* Public variables of the token */
    string public standard = 'Token 0.1';
    string public name = "Neureal Early Contributor Points";
    string public symbol = "NECP";
    uint256 public decimals = 8;
    uint256 public INITIAL_SUPPLY = 30000;
    
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => bool) balanceOfSeen;
    address[] public balanceOfAddresses;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);
    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function NECPToken() {
        balanceOf[msg.sender] = INITIAL_SUPPLY;              // Give the creator all initial tokens
        balanceOfAddresses[0] = msg.sender;
        totalSupply = INITIAL_SUPPLY;                        // Update total supply
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (_to == 0x0) throw;                               // Prevent transfer to 0x0 address. Use burn() instead
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        if (!balanceOfSeen[_to]) {
            balanceOfAddresses[balanceOfAddresses.length] = _to;
            balanceOfSeen[_to] = true;
        }
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value)
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    /* Approve and then communicate the approved contract in a single tx */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        returns (bool success) {
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
        if (!balanceOfSeen[_to]) {
            balanceOfAddresses[balanceOfAddresses.length] = _to;
            balanceOfSeen[_to] = true;
        }
        Transfer(_from, _to, _value);
        return true;
    }
    
    function burnReserveAndLockTransfers() returns (bool success) onlyOwner {
        _value = balanceOf[owner];
        totalSupply -= _value;                                // Updates totalSupply
        balanceOf[owner] = 0;                                 // Subtract from the sender
        Burn(owner, _value);
        //TODO lock token
        return true;
    }

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;   // Prevents accidental sending of ether
    }
}
