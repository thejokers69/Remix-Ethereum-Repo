// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FirstContract {
    string message;
    constructor(){
        message="Hello World!";
    }

    function seMessage(string memory _message) public{
        message=_message;
    }
    function getMessage() public view returns (string memory){
        return message;
    }
}