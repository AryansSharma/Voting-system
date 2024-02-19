// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract voting{
    address electioncomitte;
    uint public voterid;
    struct voterinfo{
        uint id;
        address info;
        string Name;
        uint age;
        string Gender;
    }
    struct nomenie{
        address nomi;
        string Name;
        uint age;
        string party;
        uint votes;
    }
    uint private voted;
    uint256[] allotedids;
    constructor(){
        electioncomitte = msg.sender;
        
    }
    mapping (uint=>address) public ids;
    mapping (address=>voterinfo)internal io;
    mapping (address=>nomenie)public nm;
    mapping (string=>uint) internal vote;
    mapping (uint=>mapping(string=>uint)) public meter;
    mapping (uint=>mapping(string=>bool)) public per;
    function registration(address from, string memory name, uint _age, string memory gender) public{
        require(_age>=18 ,"you are not eligible");
        io[from].id = voterid;
        io[from].info=from;
        io[from].Name=name;
        io[from].age=_age;
        io[from].Gender=gender;   
        ids[voterid]=from;   
        allotedids[voterid];
        voterid++;
        
    }
    function Nregistration(address from,string calldata name, uint _age, string calldata _party) public{
        require(_age>=18&&msg.sender!=from,"You are not Eligible");
        
        nm[from].nomi=from;
        nm[from].Name=name;
        nm[from].age=_age;
        nm[from].party=_party;
        vote[name] = voted;
        
    }
    function vot(string calldata partyname, address to,uint voteriid) public  {
        require(voteriid==allotedids[voterid]);
        require(per[voteriid][nm[to].Name] != true,"You have already voted this party");
        meter[voteriid][nm[to].Name] = vote[partyname] +1;
        per[voteriid][nm[to].Name] = true;


    }
}
