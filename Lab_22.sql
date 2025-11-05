-- LAB 22 --
-------------------------------------------------------------------------------------
** PART A **
** Create Query **
db.createCollection("employee")
** Insert Query **
db.employee.insertMany([
  {
    EID: 1,
    ENAME: "Nick",
    GENDER: "Male",
    JOININGDATE: new Date("2013-01-01"),
    SALARY: 4000,
    CITY: "London"
  },
  {
    EID: 2,
    ENAME: "Julian",
    GENDER: "Female",
    JOININGDATE: new Date("2014-10-01"),
    SALARY: 3000,
    CITY: "New York"
  },
  {
    EID: 3,
    ENAME: "Roy",
    GENDER: "Male",
    JOININGDATE: new Date("2016-06-01"),
    SALARY: 3500,
    CITY: "London"
  },
  {
    EID: 4,
    ENAME: "Tom",
    GENDER: "Male",
    JOININGDATE: null,
    SALARY: 4500,
    CITY: "London"
  },
  {
    EID: 5,
    ENAME: "Jerry",
    GENDER: "Male",
    JOININGDATE: new Date("2013-02-01"),
    SALARY: 2800,
    CITY: "Sydney"
  },
  {
    EID: 6,
    ENAME: "Philip",
    GENDER: "Male",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 7000,
    CITY: "New York"
  },
  {
    EID: 7,
    ENAME: "Sara",
    GENDER: "Female",
    JOININGDATE: new Date("2017-08-01"),
    SALARY: 4800,
    CITY: "Sydney"
  },
  {
    EID: 8,
    ENAME: "Emily",
    GENDER: "Female",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 5500,
    CITY: "London"
  },
  {
    EID: 9,
    ENAME: "Michael",
    GENDER: "Male",
    JOININGDATE: null,
    SALARY: 6500,
    CITY: "London"
  },
  {
    EID: 10,
    ENAME: "John",
    GENDER: "Male",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 8800,
    CITY: "London"
  }
]);
--1. db.employee.find({ename : {$regex : "^E"}}).forEach(printjson)
--2. db.employee.find({ename : {$regex : "n$"}}).forEach(printjson)
--3. db.employee.find({$or : [{ename : {$regex : "^S"}},{ename : {$regex : "^M"}}]}).forEach(printjson)
--4. db.employee.find({city : {$regex : /^[A-M]/}}).forEach(printjson)
--5. db.employee.find({city : {$regex : /[ney]$/}}).forEach(printjson)
--6. db.employee.find({ename : {$regex : "n",$options: "i"}}).forEach(printjson)
--7. db.employee.find({city : {$regex : "^E...."}}).forEach(printjson)
--8. db.employee.find({$and : [{ename : {$regex : "^S"}}, {ename : {$regex : "a$"}}]}).forEach(printjson)
--9. db.employee.find({ename : {$regex : /^[Phi]/}},{eid:1,ename:1, city:1,salary:1}).forEach(printjson)
--10. db.employee.find({city : {$regex : /[dne]/}},{ename:1, joining_date:1,city:1}).forEach(printjson)
--11. db.employee.find({$not : {$regex : [{city : "London"},{city : "Sydney"}]}},{ename:1, joining_date:1,city:1}).forEach(printjson)
--12. db.employee.find({ename : {$regex : "^J"}}).forEach(printjson)
--13. db.employee.find({ename : {$regex : "y$"}}).forEach(printjson)
--14. db.employee.find({ename : {$regex : "a"}}).forEach(printjson)
--15. db.employee.find({$or : [{ename : {$regex : "a"}},{ename : {$regex : "e"}}]}).forEach(printjson)
--16. db.employee.find({$and : [{ename : {$regex : "^J"}},{ename : {$regex : "n$"}}]}).forEach(printjson)
--17. db.employee.find({city : {$regex : "/^[New]/}}).forEach(printjson)
--18. db.employee.find({city : {$not : {$regex : "^L"}}}).forEach(printjson)
--19. db.employee.find({city : {$regex : /[York]/}}).forEach(printjson)
--20. db.employee.find({ename : {$regex : /*[a,e,i,o,u]{2}*/}}).forEach(printjson)
--21. db.employee.find({ename : {$regex : /{3,}/}}).forEach(printjson)
--22. db.employee.find({ename : {$regex : /.{4}$/}}).forEach(printjson)
--23. db.employee.find({$or : [{ename : {$regex : "^S"}},{ename : {$regex : "^M"}}]}).forEach(printjson)
--24. db.employee.find({ename : {$regex : /[il]/}}).forEach(printjson)
--25. db.employee.find({ename : {$not : {$regex : /a/i}}}).forEach(printjson)
--26. db.employee.find({ename : {$regex : /[0-9]/}}).forEach(printjson)
--27. db.employee.find({ename : {$regex : /[^a,e,i,o,u]*[a,e,i,o,u]*[^a,e,i,o,u]/}}).forEach(printjson)
--28. db.employee.find({city : {$regex : /^[A-Z][a-z]/}}).forEach(printjson)
-------------------------------------------------------------------------------------
** PART B **
--1. db.student.find({sname : {$regex : "^K"}}).forEach(printjson)
--2. db.student.find({$or : [{sname : {$regex : "^Z"}},{sname : {$regex : "^D"}}]}).forEach(printjson)
--3. db.student.find({city : {$regex : /^[A-R]/}}).forEach(printjson)
--4. db.student.find({$and : [{sname : {$regex : "^P"}},{sname : {$regex : "i$"}}]}).forEach(printjson)
--5. db.student.find({department : {$regex : "^C"}}).forEach(printjson)
--6. db.student.find({city : {$regex : /[med]/}},{sname:1, sem:1,fees:1,department:1}).forEach(printjson)
--7. db.student.find({$not : {$regex : [{city : "Rajkot"},{city : "Baroda"}]}},{sname:1, sem:1,fees:1,department:1}).forEach(printjson)
--8. db.student.find({sname : {$regex : /^K*/}}).forEach(printjson)
--9. db.studet.find({sname : {$regex : "a$"}}).forEach(printjson)
--10. db.student.find({ename : {$regex : /[ri]/,$options: "i"}}).forEach(printjson)
-------------------------------------------------------------------------------------
** PART C **
--1. db.student.find({sname : {$regex : /^[A,E,I,O,U]/}}).forEach(printjson)
--2. db.student.find({$or : [{city : {$regex : /[pur]$/}},{city : {$regex : /[bad]$/}}]}).forEach(printjson)
--3. db.student.find({fees : {$regex : /^1/}}).forEach(printjson)
--4. db.student.find({$or : [{sname : {$regex : "^K"}},{sname : {$regex : "^V"}}]}).forEach(printjson)
--5. db.student.find({city : {$regex : /{5}/}}).forEach(printjson)
--6. db.student.find({sname : {$not : {$regex : "e"}}}).forEach(printjson)
--7. db.student.find({$and : [{city : {$regex : /^[Ra]/}}, {city : {$regex : /[ot]$/}}]}).forEach(printjson)
--8. db.student.find({sname : {$regex : /[^a,e,i,o,u]*[a,e,i,o,u]*[^a,e,i,o,u]/}}).forEach(printjson)
--9. db.student.find({$and : [{sname : {$regex : /^T/}}, {sname : {$regex : /t$/}}]}).forEach(printjson)
--10. db.student.find({$or : [{department : {$regex : /^C/}},{department : {$regex : /^E/}}]}).forEach(printjson)
--11. db.student.find({sname : {$regex : /{5}/}}).forEach(printjson)
--12. db.student.find({$and : [{gender : "Female"}, {city : {$regex : /^A/}}]}).forEach(printjson)
-------------------------------------------------------------------------------------
