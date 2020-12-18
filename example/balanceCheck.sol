pragma solidity ^0.5.0;

contract BalanceCheck{
    
    function balanceCheck(address who) view public returns(uint256) {
        uint256 amount = who.balance;
        return amount;
    }
    
    function sendEth(address payable who) payable public returns(bool){
        uint256 amount = msg.value;
        bool sendSuccess = who.send(amount);
        if(sendSuccess==false){
            msg.sender.transfer(amount);
        }
    }
    
    function testInternal() internal pure returns(uint256) {
        return 100;
    }
    
    function testPrivate() private pure returns(uint256) {
        return 100;
    }
    
    function testPublic() public pure returns(uint256) {
        return 100;
    }
    
    function testExternal() external pure returns(uint256) {
        return 100;
    }
    
    function testAll() public pure returns(uint256){
        // testExternal(); // external function cannot be called in contract
        testInternal();
        testPrivate();
        testPublic();
    }
}

contract balanceCheckVer2 is BalanceCheck{
    function testAllv2() pure public returns(uint256){
        // testPrivate(); //private function cannot be called in chiled contract
        testInternal();
        return 100;
    }
    
}
contract temp{
    
}