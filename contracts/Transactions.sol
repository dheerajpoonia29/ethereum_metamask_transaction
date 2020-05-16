pragma solidity >=0.4.21 <0.7.0;
/*
payee and payer
payer : who pay the eth to payee
payee : who get the eth from payer

*/

contract Transaction{
    
    mapping(address => uint256) public bank;

    uint256 public returnPayeeDepositedAmount;

    constructor() public{
        returnPayeeDepositedAmount = bank[msg.sender];
    }
    
    function deposit(address _payee) public payable{
        require(msg.sender!=_payee);            // PAYER (MSG.SENDER) IS NOT BACAME ITSELF AS A PAYEE
        bank[_payee] += msg.value;
    }
    
    function withdraw(address payable _payee)  public{
        require(msg.sender==_payee);            // ONLY PAYEE CAN withdraw MONEY FROM HIS ADDRESS, NO ONE CAN withdraw HIS MONEY
        uint256 amount_receive = bank[_payee];
        bank[_payee] = 0;
        _payee.transfer(amount_receive);
    }
    
}