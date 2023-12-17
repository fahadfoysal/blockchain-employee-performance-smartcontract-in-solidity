// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 < 0.9.0;


contract PerformanceApprisalsCheck {
    struct EmployeeInfo {
        uint256 id;
        string name;
        string designation;
        string company;
        string workingperiod;
        string skills;
        string feedback;
    }

    //struct type array to store values
    EmployeeInfo[] public employeeinfo;
    uint256 nextId = 1;

    function find(uint256 _id) public view returns (uint256) {
        for (uint256 i; i < employeeinfo.length; i++) {
            if (employeeinfo[i].id == _id) return i;
        }
        revert("Employee does not exist.");
    }

    //function to insert employee information.
    function insertEmp(
        string memory _name,
        string memory _designation,
        string memory _company,
        string memory _workingperiod,
        string memory _skills,
        string memory _feedback
    ) public {
        employeeinfo.push(EmployeeInfo(nextId, _name, _designation, _company, _workingperiod,
        _skills, _feedback));
        nextId++;
    }

    //function to read employee information
    function readEmpById(uint256 _id)
        public
        view
        returns (uint256, string memory, string memory, string memory, string memory, string memory, string memory)
    {
        uint256 i = find(_id);
        return (
            employeeinfo[i].id,
            employeeinfo[i].name,
            employeeinfo[i].designation,
            employeeinfo[i].company,
            employeeinfo[i].workingperiod,
            employeeinfo[i].skills,
            employeeinfo[i].feedback
        );
    }

    //function to update employee information
    function updateEmpById(
        uint256 _id,
        string memory _name,
        string memory _designation,
        string memory _company,
        string memory _workingperiod,
        string memory _skills,
        string memory _feedback
    ) public {
        uint256 i = find(_id);
        employeeinfo[i].name = _name;
        employeeinfo[i].designation = _designation;
        employeeinfo[i].company = _company;
        employeeinfo[i].workingperiod = _workingperiod;
        employeeinfo[i].skills = _skills;
        employeeinfo[i].feedback = _feedback;
    }

    //function to delete employee information
    function DeleteEmpById(uint256 _id) public returns (uint256) {
        uint256 i = find(_id);
        delete employeeinfo[i];
        return _id;
    }
}
