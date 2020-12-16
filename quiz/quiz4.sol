pragma solidity ^0.5.0;

contract Calculator {
    
    int256 public accum;
    constructor() public{
        accum=0;
    }
    
    function clear() public returns(bool) {
        accum = 0;
        return true;
    }
    
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
    
    
    
    function addToAccum (int256 a) public returns (int256){
        accum +=a;
    }
    function subToAccum (int256 a) public returns (int256){
        accum -=a;
    }
    function mulToAccum (int256 a) public returns (int256){
        accum *=a;
    }
    function divToAccum (int256 a) public returns (int256){
        accum /=a;
    }
    function modToAccum (int256 a) public returns (int256){
        accum +=a;
    }
    
    function biggerNumberIs( int256 a, int256 b) pure public returns (int256) {
        
        // int256 bignumber = a>b ?  a: (a==b ?  0:  b);
        // return bignumber;
        
        if( a == b) return 0;
        else if (a > b) return a;
        else return b;
    }
    
    function swap(int256 a, int256 b) pure public returns(int256, int256) {
        if( a >= b) return (a,b);
        else return (b,a);
    }
    
    function sort(int256 a, int256 b, int256 c) pure public returns(int256, int256, int256) {
        int256 b1 = a;
        int256 b2 = b;
        int256 b3 = c;

        (b1,b2) = swap(b1,b2);
        (b1,b3) = swap(b1,b3);
        (b2,b3) = swap(b2,b3);

        return (b1,b2,b3);
    }
}