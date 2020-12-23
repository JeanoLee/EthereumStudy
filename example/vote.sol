pragma solidity ^0.5.0;

contract Vote {
    
    // 투표 제목을
    string public title;
    
    // 투표할 수 있는 항목과 각 항목당 투표 수
    string[] public subjectList;
    mapping (string => uint256) public subjectItems;
    
    
    // 주소 별 투표 여부
    mapping( address => bool ) public voter;
    
    // 투표  제한시간
    uint256 public timeLimit;
    
    // 현재까지 총 투표 수
    uint256 public voteCount;
    
    event VoteFinish( address, string);
    
    constructor(string memory _title, uint256 _timeLimit) public {
        title = _title;
        timeLimit = _timeLimit;
    }
    
    function vote( string memory _subject) public returns(bool){
        // 이미 투표한 사람은 투표할 수 없음
        require( voter[msg.sender] == false, "Already voted");

        // 투표시간이 지난 후에는 투표할 수 없음
        require( timeLimit > now, "Vote time is over");

        voter[msg.sender] = true;
        if(subjectItems[ _subject ] == 0){
            subjectList.push( _subject );
            subjectItems[ _subject ] = 1;
        }
        else {
            subjectItems[ _subject ] += 1;
        }
        
        voteCount +=1;
        emit VoteFinish(msg.sender, _subject);
        
        return true;
    }
    
    function voteCountof(string memory _subject) view public returns(uint256) {
        return subjectItems[_subject];
    }

    function numberOfSubjectItems() view public returns(uint256) {
        return subjectList.length;
    }
}

contract VoteFactory{
    
    Vote[] public votes;
    
    mapping(string => uint256) votesTableByTitle;
    mapping(address => uint256) votesTableByAddress;
    
    constructor() public{
        
    }
    
    function createVote( string memory _title, uint256 _timeLimit) public returns(bool) {
        Vote vote = new Vote(_title,_timeLimit);
        uint256 idx = votes.length;
        votesTableByTitle[_title] = idx;
        votesTableByAddress[ address(vote)] = idx;
        votes.push(vote);
    }
    
    function findVoteByTitle( string memory _title) public view returns(address){
        return address(votesTableByTitle[_title]);
    }
    
    function findVoteByIndex( uint256 _idx) public view returns(address){
        require(_idx < votes.length, "_idx exceed votes size");
        return address(votes[_idx]);
    }
    
    function countOfVote() public view returns (uint256){
        return votes.length;
    }
    
}