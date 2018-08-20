pragma solidity ^0.4.19;



contract abc {
  
 
  
  struct User {
      bytes32 name;
      uint score;
      
  }
  
      
  
  
  //User[] public userArray;
  
  mapping(uint => User[]) userAccess;
  
  
  function setuser(uint _level, string _name, uint _score) public {
      User memory newUser;   
      newUser.name = stringToBytes32(_name);
      newUser.score = _score;
      
      
      userAccess[_level].push(newUser);
      //userArray.push(newUser);
      
  }
  
  function stringToBytes32(string memory source) public pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
}
  
  function getUser(uint _level) view public returns(bytes32[], uint[]){
      //return(userAccess[level]);
      uint length = userAccess[_level].length;
      
      bytes32[] memory nameName = new bytes32[](length);
      uint[] memory scoreScore = new uint[](length);
      
      for (uint i = 0; i < length; i++){
      nameName[i] = userAccess[_level][i].name;
      scoreScore[i] = userAccess[_level][i].score;

    }
  return(nameName, scoreScore);
  
      
      
  }
  

    function getIndUser(uint _level, uint _score) public view returns (bytes32, uint) {
        User[] storage u = userAccess[_level];
        
        for (uint i = 0; i < u.length; i++) {
            if (u[i].score == _score) {
                return (u[i].name, u[i].score);
            }
        }
    }
    
    function getUserByRange(uint _level, uint _score) public view returns (bytes32[], uint[]) {
        User[] storage u = userAccess[_level];
        
        bytes32[] memory b = new bytes32[](u.length);
        uint[] memory ui = new uint[](u.length);
        
        for (uint i = 0; i < u.length; i++) {
            if(u[i].score > _score) {
                b[i] = u[i].name;
                ui[i] = u[i].score;
            }
        } return (b, ui);
    }
    /*event logUser(string, uint);
    function getUserByRangelog(uint _level, uint _score) public returns(string, uint) {
        User[] memory u = userAccess[_level];
        
        for (uint i=0;i<u.length;i++) {
            if (u[i].score > _score) {
                emit logUser(u[i].name, u[i].score);
            }
    }
 

}*/


}



//User memory currentUser;
      //currentUser = userArray[i];
      //nameName[i] = currentUser.name;
      //scoreScore[i] = currentUser.score;
