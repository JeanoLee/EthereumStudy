pragma solidity ^0.5.0;


contract Wallet {
    struct History {
        uint256 time;
        uint256 amount;
        address from;
        address to;
    }
    
    address public owner;
    uint256 public balance;
    
    History[] public history;
    mapping( uint256 => History) public historyTimeMap;
    mapping( address => History[]) public historyaddressMap;

    constructor() public {
        owner = msg.sender;
        balance = 0;
    }
    
    function () external payable {
        insertHistory(msg.value, msg.sender, address(this));
        balance += msg.value;
    }
    
    
    function insertHistory(uint256 amount, address from, address to) internal returns(bool) {
        uint256 nowTime = now;
        History memory h = History(nowTime,amount,from, to);
        history.push(h);
        historyTimeMap[nowTime] = h;
    }
    function deleteHistory(uint idx) public returns(bool){
        uint256 time = history[idx].time;
        uint lastIdx = history.length-1;
        history[idx] = history[ lastIdx ];
        delete history[lastIdx];
        delete historyTimeMap[time];
    }
    
    function withdraw(address payable to, uint256 amount) payable public returns(bool){
        require(msg.sender == owner);
        require(amount <= getBalance() );
        to.transfer(amount);
        balance -= amount;
        insertHistory(amount,address(this), to);
    }
    
    function changeOwner(address newOwner) public returns(bool) {
        require(msg.sender == owner);
        owner = newOwner;
    }
    
    function getBalance() view public returns(uint256){
        return ((address(this))).balance;
    }
}