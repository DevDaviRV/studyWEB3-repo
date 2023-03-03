// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Coin {
    address public owner;
    mapping(address => uint) public balances;


    constructor(){
        owner = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == owner, 'Somente o dono');
        balances[receiver] += amount;
    }

    error insufficientBalance(uint amountRequire, uint avaliable);


    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender]){
            revert insufficientBalance({
                amountRequire: amount,
                avaliable: balances[msg.sender]
            });
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }

}
