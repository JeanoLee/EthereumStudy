pragma solidity ^0.5.0;

contract Wallet {
    address public owner;
    uint256 public balance;
    
    constructor() public {
        owner = msg.sender;
        balance = 0;
    }
    
    function () external payable {
        balance += msg.value;
    }
    
    function withdraw(address payable to, uint256 amount) payable public returns(bool){
        require(msg.sender == owner);
        require(amount <= getBalance() );
        to.transfer(amount);
        balance -= amount;
    }
    
    function changeOwner(address newOwner) public returns(bool) {
        require(msg.sender == owner);
        owner = newOwner;
    }
    
    function getBalance() view public returns(uint256){
        return ((address(this))).balance;
    }
}