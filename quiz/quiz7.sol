pragma solidity ^0.5.0;
contract Quiz7 {
    
    function Sum(uint256 a, uint256 b) pure public returns(uint256) {
        uint256 sum=0;
        if(a==b){
            return 0;
        }
        else if( a>b ){
            uint256 temp = a;
            a=b;
            b=temp;
        }
        for(uint256 i=a; i<=b; i++){
                sum = sum+i;
        }
        return sum;
    }
}