pragma solidity ^0.5.0;

contract Callee{
    address public caller;
    event Called( address indexed);

    constructor() public {
    }
    
    function func() public returns(bool result) {
        caller = msg.sender;
        emit Called(caller);
        result = true;
    }
}

contract Callee_new {
    address public caller;
    event Called( address indexed);
    event TextOut( string );
    
    constructor() public {
    }
    
    function func() public returns(bool result) {
        caller = msg.sender;
        emit Called(caller);
        emit TextOut("NEWCALLEE");
        result = true;
    }
}

contract Caller {
    address public temp;
    Callee[] public _callee;
    mapping(address => uint256) userMaped;
    
    constructor( address _ca) public {
        _callee.push( Callee(_ca));
    }
    
    function addCallee( address _newCallee ) public {
        _callee.push( Callee(_newCallee) );
    }
    
    function funcDefaultCall() public returns (bool result) {
        result = _callee[0].func();
    }
    
    function funcStaticCall() public returns (bool) {
        (bool result,) = address(_callee[0]).call(
            abi.encodePacked( bytes4(keccak256("func()"))));
        return result;
    }
    
    function funcDelegateCall() public returns (bool) {
        (bool result,) = address(_callee[ userMaped[msg.sender] ]).delegatecall( 
            abi.encodePacked(bytes4( keccak256("func()"))));
        return result;
    }
    
    function userMapChaing(address _user, uint256 _idx) public {
        userMaped[_user] = _idx;
    }
    
}