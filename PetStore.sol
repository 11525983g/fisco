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
    address[16] public buyer;
    
    struct pet {
        uint Id;//ID 
        string petname;//名称
        string class;//品类
        uint birth;//出生日期
        uint value;//价格
        string description;//描述
        address delegate;
        uint amount;//数量
    }

    mapping (address => uint256) public balances; 
    
    function BuyPet(uint petId) public returns (uint) {
        buyer[petId] = msg.sender;
        return petId;
    }
    
    function _transfer(address _from, address _to, uint _value) internal {

        require(_to != 0x0); 
        require(balances[_from] >= _value); 
        require(balances[_to] + _value > balances[_to]); //_value不能为负值

        uint previousBalances = balances[_from] + balances[_to]; 

        balances[_from] -= _value; 
        balances[_to] += _value;

        assert(balances[_from] + balances[_to] == previousBalances);  
    }
 }
