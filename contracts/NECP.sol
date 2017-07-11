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

contract NECPToken is owned {
    /* Public variables of the token */
    string public constant standard = 'Token 0.1';
    string public constant name = "Neureal Early Contributor Points";
    string public constant symbol = "NECP";
    uint256 public constant decimals = 8;
    uint256 public constant MAXIMUM_SUPPLY = 3000000000000;
    
    uint256 public totalSupply;

    /* This tracks all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This tracks token holders in a loopable mapping */
    mapping (address => bool) balanceOfSeen;
    uint256 public holders = 1;
    mapping (uint256 => address) holderAddresses;



    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);
    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function NECPToken() {
        balanceOf[msg.sender] = MAXIMUM_SUPPLY;              // Give the creator all initial tokens
        holderAddresses[0] = msg.sender;                     // Set creator as the sole holder
        totalSupply = MAXIMUM_SUPPLY;                        // Update total supply
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (_to == 0x0) throw;                               // Prevent transfer to 0x0 address. Use burn() instead
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        if (_value != 0) trackHolder(_to);
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
        if (_value != 0) trackHolder(_to);
        Transfer(_from, _to, _value);
        return true;
    }

    function trackHolder(address _to) internal {
        if (!balanceOfSeen[_to]) {
            holderAddresses[holders] = _to;
            holders++;
            balanceOfSeen[_to] = true;
        }
    }
    // function untrackHolder(uint256 _del) internal {
    //     if (!balanceOfSeen[_to]) {
    //         balanceOfAddresses[balanceOfAddresses.length] = _to;
    //         balanceOfSeen[_to] = true;
    //     }
    // }
    function holder(uint256 i) constant returns (address, uint256) {
        return (holderAddresses[i], balanceOf[holderAddresses[i]]);
    }

    function burnReserveAndLockTransfers() onlyOwner returns (bool success)  {
        uint256 _value = balanceOf[owner];
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
