# HTLC

This contract implements a simple HTLC (Hashed Timelock Contract) that allows a recipient to redeem a payment if they know the secret. The secret is generated randomly and stored in the contract. The owner of the contract can also refund the payment if the secret is not revealed.

To compile this code, you can use a Solidity compiler like Remix IDE. Once the code is compiled, you can deploy it to a blockchain like Ethereum.

Here is an explanation of the code:

The pragma solidity ^0.8.0; line specifies the version of Solidity that the contract is written in.
The contract HTLC line defines the contract.
The address payable public owner; line declares the owner variable, which is an address that can receive payments.
The address payable public recipient; line declares the recipient variable, which is the address that can redeem the payment.
The uint256 public amount; line declares the amount variable, which is the amount of the payment.
The bytes32 public secret; line declares the secret variable, which is the secret that is required to redeem the payment.
The constructor(address payable _owner, address payable _recipient, uint256 _amount, bytes32 _secret) { line is the constructor for the contract. It sets the values of the owner, recipient, amount, and secret variables.
The function redeem(bytes32 _secret) public { line defines the redeem function. This function allows the recipient to redeem the payment if they know the secret.
The require(msg.sender == recipient, "Only recipient can redeem"); line checks that the sender of the message is the recipient.
The require(_secret == secret, "Incorrect secret"); line checks that the secret provided is correct.
The msg.sender.transfer(amount); line transfers the amount of the payment to the sender of the message.
The function refund() public { line defines the refund function. This function allows the owner of the contract to refund the payment if the secret is not revealed.
The require(msg.sender == owner, "Only owner can refund"); line checks that the sender of the message is the owner.
The owner.transfer(amount); line transfers the amount of the payment to the owner of the contract.
