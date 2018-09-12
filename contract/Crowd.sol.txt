contract Crowd{
    address owner;
    uint numTitle;
    uint numSuccess;
    uint numFail;
    
    
    address[] private crowds; 
    mapping(address=>address) titles;
    
    constructor(){
        owner=msg.sender;
        numTitle=0;
    }
    
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
    
    
    function createCrowdTitle(string _idol, string _title, uint _duration, uint _goalAmount){
        CrowdTitle ct=new CrowdTitle(_idol, _title, msg.sender, _duration, _goalAmount);
        crowds.push(ct.getAddr());
        titles[ct.getAddr()]=msg.sender;
        numTitle++;
        
    }
    
    function showtitles() public view returns(address[] _crowds, uint _numTitle){
        _crowds=crowds;
        _numTitle=numTitle;
    }
    
    function deleteCrowd(address deleteCrowdAddress) public{
        require(msg.sender==titles[deleteCrowdAddress]);   
        address[] tmp;
        
        //delete crowdaddress
        for(uint i=0; i<crowds.length; i++){
            if(crowds[i]!=deleteCrowdAddress){
                tmp.push(crowds[i]);
            }
        }
        
        crowds=tmp;
        
        delete titles[msg.sender];
        numTitle--;
    }
    
}


/***************************************************/
contract Owned{
    address public owner;
    
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
    
    function owned(address _owner) internal{
        owner=_owner;
    }
    
    function changeOwner(address _newOwner) public onlyOwner{
        owner=_newOwner;
    }
}

/* contract for each fund */
contract CrowdTitle is Owned{
    string public idol;
    string public title;
    uint public deadline;
    uint public goalAmount;
    uint public totalAmount;
    uint public numInvestors;
    bool public succeeded;
    bool public ended;
    
    mapping(address => uint) public investors;
    
    modifier isFailed(){
        require(ended&&!succeeded);
        _;
    }
    
    constructor(string _idol, string _title, address _owner, uint _duration, uint _goalAmount){
        owned(_owner);
        idol=_idol;
        title=_title;
        deadline=now+_duration;
        goalAmount=_goalAmount;
        totalAmount=0;
        numInvestors=0;
        succeeded=true;
        ended=false;
    }
    
    function() payable{
        require(!ended);
        
        investors[msg.sender]+=(msg.value/1000000000000000000);//wei to ether
        totalAmount+=msg.value;
        numInvestors++;
    }
    
    function getAddr() public view returns(address){
        return address(this);
    }
    
    function checkCrowd() public onlyOwner{
        require(!ended);
        require(now >= deadline);
        
        if(totalAmount >= goalAmount){  //fund success
            succeeded=true;
            ended=true;
            
            if(!owner.send(this.balance)){
                throw;
            }
            
        }else{
            succeeded=false;
            ended=true;
        }
    }
    
    function withdraw() public{
        if(investors[msg.sender]>0){
           if(!msg.sender.send(investors[msg.sender]*1000000000000000000)) throw;
           investors[msg.sender]=0;
        }
    }
    
    function kill() public onlyOwner{
        selfdestruct(owner);
    }
}