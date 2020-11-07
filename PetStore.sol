pragma solidity ^0.4.25;

/**
 * @title Pet Store
 *Pet Store Contract created by Chen Xin.
 */

 contract PetStoreMarket {
    // admin (管理员：帐户开户、初始化、监测市场里的宠物价格分布、售卖次数、处理纠纷)
    address public admin;
    // seller(出售人：将宠物上架、制定价格、售卖成功则收款)
    address public seller;
    // buyer (购买人：选择宠物、进行购买)
    address public buyer;
    
    struct pet {
        uint Id;//ID 
        string petname;//名称
        string class;//品类
        uint birth;//出生日期
        uint value;//价格
        string description;//描述
        address owner;
    }
    
    pet[88] pets;//假设宠物数量为88

    mapping (address => uint256) public balances; 
    
    function BuyPet(uint Id) public returns (uint) {
        require(Id >= 0 && Id <= 87);
        //pets[Id] = msg.sender;
        return Id;
    }
    
    function changeOwner(uint Id) {
        pets[Id].owner = buyer;
    }
  
    function _transfer(uint _value) internal {

        require(buyer != 0x0); 
        require(balances[seller] >= _value); 
        require(balances[buyer] + _value > balances[buyer]); //_value不能为负值

        uint previousBalances = balances[seller] + balances[buyer]; 

        balances[seller] -= _value; 
        balances[buyer] += _value;

        assert(balances[seller] + balances[buyer] == previousBalances);  
    }
  
 }
