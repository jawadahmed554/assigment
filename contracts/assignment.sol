pragma solidity ^0.4.19;



contract abc {
  
 
  
    struct User {
        bytes32 name;
        uint score;
      
    }
  
      
  
  
    User[] public userArray;
  
  //mapping(uint => User) userAccess;
  
  
    function setuser(string _name, uint _score) public {
        User memory newUser;   
        newUser.name = stringToBytes32(_name);
        newUser.score = _score;
      
      
      //userAccess[level].push(newUser);
        userArray.push(newUser);
      
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
  
    function getUser() public view returns(bytes32[], uint[]){
      //return(userAccess[level]);
        uint length = userArray.length;
      
        bytes32[] memory nameName = new bytes32[](length);
        uint[] memory scoreScore = new uint[](length);
      
        for (uint i = 0; i < userArray.length; i++){
            nameName[i] = userArray[i].name;
            scoreScore[i] = userArray[i].score;

        }
        return (nameName, scoreScore);
    }
     
}