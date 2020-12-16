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

    function biggerNumberis(int256 a, int256 b) public returns(int256) {
        if(a==b) return 0
        if( a > b) return a;
        else return b;
    }
    
}