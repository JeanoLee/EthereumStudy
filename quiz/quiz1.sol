pragma solidity ^0.5.0;

contract Calculator {
    
    function add( int256 a, int256 b) pure public returns( int256 ) {
        int256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    
    function sub( int256 a, int256 b) pure public returns( int256 ) {
        int256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return a-b;
    }
    
    function mul( int256 a, int256 b) pure public returns( int256 ) {
        if(a == 0){
            return 0;
        }
        int256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    
    function div( int256 a, int256 b) pure public returns( int256 ) {
        int256 c = a / b;
        return c;
    }
    
    function mod( int256 a, int256 b) pure public returns( int256 ) {
        return a % b;
    }
}