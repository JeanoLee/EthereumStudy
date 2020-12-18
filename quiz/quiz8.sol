pragma solidity ^0.5.0;
contract Quiz8 {
    
    function Sum(uint256 a, uint256 b,uint8 condition) pure public returns(uint256) {
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
            if(condition == 0 && i%2 == 0){
                sum = sum+i;
            }else if( condition == 1 && i%2 == 1){
                sum = sum+i;
            }else if( condition == 2){
                sum = sum+i;
            }
        }
        return sum;
    }
}