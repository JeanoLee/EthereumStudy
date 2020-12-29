pragma solidity ^0.5.0;

contract Proxy {
    address public implementation;
    
    function upgradeTo( address _impl) public {
        implementation = _impl;
    }
    
    function () payable external {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)
            
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
    
}

contract TestAdd is Proxy{
    uint256 public number;
    
    function add( uint256 _num) public {
        number+= _num;
    }
}

contract TestText is Proxy{
    string public text;
    function setText( string memory _text) public {
        text = _text;
    }
}