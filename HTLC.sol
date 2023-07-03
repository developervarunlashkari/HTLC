pragma solidity ^0.8.0;

contract HTLC {

    address payable public owner;
    address payable public recipient;
    uint256 public amount;
    bytes32 public secret;

    constructor(address payable _owner, address payable _recipient, uint256 _amount, bytes32 _secret) {
        owner = _owner;
        recipient = _recipient;
        amount = _amount;
        secret = _secret;
    }

    function redeem(bytes32 _secret) public {
        require(msg.sender == recipient, "Only recipient can redeem");
        require(_secret == secret, "Incorrect secret");
        msg.sender.transfer(amount);
    }

    function refund() public {
        require(msg.sender == owner, "Only owner can refund");
        owner.transfer(amount);
    }

}
