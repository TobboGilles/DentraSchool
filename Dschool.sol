//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

contract School {
    

    address SuperAdmin;
    uint8 public index;
    
    struct student {
        uint id;
        string name;
        string major;
        string department;
        address etudiant;
        bool Register;
        
    }
    
    struct course {
        uint id;
        string course01;
        string course02;
        string course03;
        string courseTakerName;
        address addressCourseTaker;
        
    }
    
    struct examApproval {
        uint id;
        bool value;
        address addressExam;
    }
    
    
     constructor () {
       SuperAdmin = msg.sender;
     }
       
       modifier onlySuperAdmin {
       require (SuperAdmin==msg.sender);
       _;
           
       }
    
    mapping (address => examApproval) public Approval;
    mapping (address => course) public Courses;
    mapping (address => student) public AllStudents;
   
   // to register student in the School system
    function setStudents (
        string memory _name , 
        string memory _major,
        string memory _faculty) public {
   // increment student registration    
    index++;
    AllStudents[msg.sender]= student (index, _name, _major,_faculty, msg.sender, true);
    
        
            }
      // verify if student is Register      
    function checkStudent (address _add)view public returns (bool) {
        return  AllStudents[_add].Register;    
            }
            
    // student registration course
    function RegisterSemesterCourse (
    string memory _course01, 
    string memory _course02, 
    string memory _course03,
    string memory _courseTakerName, 
    address _addressCourseTaker) public {
    
    // student can register course if and only if he is enrolled
    if (checkStudent (msg.sender)) {
        
        // increment course registration
        index++;
        Courses[msg.sender]= course (index, _course01, _course02, _course03, _courseTakerName,_addressCourseTaker);
    }
}
    // Set exam or course address for the  
    function ExamRegistration ( address _addressExam ) public {
        index++;
        Approval[_addressExam]= examApproval (index, true, msg.sender);
    }
    // Check wether exam is set on the system
    function CheckExam ()public view returns (bool) {
        return Approval[msg.sender].value;
    }

    // student take exam 
    function TakeExam () public {
       
      }
}


