pragma solidity ^0.5.0;

contract Calculator {
    enum ORDER {ASC, DESC}
    
    
    ORDER public order = ORDER.DESC;
    
    function chageOrder( ORDER newOrder)public {
        order = newOrder;
    }
    
    function swap(int256 a, int256 b) pure public returns(int256, int256) {
        return (b,a);
    }
    
    function sort(int256[] memory numbers) view public returns(int256[] memory) {

        for(uint i=0; i<numbers.length; i++){
           for(uint j= i+1 ; j< numbers.length; j++){
               if(order == ORDER.ASC){
                   if(numbers[j] < numbers[i]){
                       (numbers[i],numbers[j]) = swap(numbers[i],numbers[j]);
                   }
               }else{
                   if(numbers[j] > numbers[i]){
                       (numbers[i],numbers[j]) = swap(numbers[i],numbers[j]);
                   }
               }
           }
        }
        return numbers;     
    }
}