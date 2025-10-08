------------------------------------------------------------------------------------------------------------------------
-- PART A --
------------------------------------------------------------------------------------------------------------------------
1. db.Student.updateMany({name : "John"},{$set : {age : 31}})
2. db.Student.updateMany({city : "New York"},{$set : {city : "New Jersey"}})
3. db.Student.updateMany({age : {$gt : 35}},{$set : {isActive : false}})
4. db.Student.updateMany({},{$set : {$inc : {age : 1}}})
5. db.Student.updateMany({name : "Eva"},{$set : {city : "Cambridge"}})
6. db.Student.updateMany({name : "Sophia"},{$set : {isActive : false}})
7. db.Student.updateMany({age : {$lt : 30}},{$set : {city : "San Diego"}})
8. db.Student.updateMany({},{$rename : {age : "years"}})
9. db.Student.updateMany({name : "Nick"},{$set : {isActive : true}})
10. db.Student.updateMany({},{$set : {country : "USA"}},{upsert : true})
11. db.Student.updateMany({name : "David"},{$set : {city : "Orlando"}})
12. db.Student.updateMany({},{$mul : {age : 2}})
13. db.Student.updateMany({name : "Tom"},{$unset : {city : ""}})
14. db.Student.updateMany({age : {$gt : 30}},{$set : {premiumUser : true}},{upsert : true}) 
15. db.Student.updateMany({name : "Jane"},{$set : {isActive : true}})
16. db.Student.updateMany({name : "Lucy"},{$set : {isActive : false}})
17. db.Student.deleteMany({name : "Nick"})
18. db.Student.deleteMany({isActive : false})
19. db.Student.deleteMany({city : "New York"})
20. db.Student.deleteMany({age : {$gt : 35}})
21. db.Student.deleteMany({name : "Olivia"})
22. db.Student.deleteMany({age : {$lt : 25}})
23. db.Student.deleteOne({isActive : true})
24. db.Student.deleteMany({city : "Los Angeles"})
25. db.Student.deleteMany({city : ""})
26. db.Student.updateMany({},{$rename : {city : "location"}})
27. db.Student.updateMany({name : "John"},{$rename : {name : "fullname"}})
28. db.Student.updateMany({},{$rename : {isActive : "status"}})
29. db.Student.updateMany({location : "San Francisco"},{$rename : {age : "yearsOld"}})
30. Pending - will be done at last [after knowing validation rules]
------------------------------------------------------------------------------------------------------------------------
-- PART - B --
------------------------------------------------------------------------------------------------------------------------
* create and insert query pending [to be done]
1. db["Student_data"].find({$and : {gender : "Female"},{city : "Rajkot"}})
2. db["Student_data"].find({sem : {$ne : 3}}).forEach(printjson)
3. db["Student_data"].find({city : {$in : ["Jamnagar","Baroda"]}}).forEach(printjson)
4. db["Student_data"].find({city : "Baroda"}).limit(2).forEach(printjson)
5. db["Student_data"].find({$and : {gender : "Male"},{sem : 3}}).forEach(printjson)
6. db["Student_data"].find({rollno : {$lt : 105}},{sname : 1,city: 1,fees : 1,_id : 0}).forEach(printjson)
7. db["Student_data"].updateMany({$and : {city : "Jamnagar"},{department : "CE"}},{$set : {city : "Surat"}})
8. db["Student_data"].updateMany({$not : {gender : "Female"}},{$set : {$inc : {fees : 500}}})
9. db["Student_data"].updateMany({$and : {department : "EE"},{sem : 3}},{$set : {department : "Electrical"}})
10. db["Student_data"].updateMany({$and : {city : "Rajkot"},{gender : "Male"}},{$set : {fees : 20000}})
11. db["Student_data"].updateMany({$and : {sem : 5},{fees : {$lt : 10000}}},{$set : {city : "Vadodara"}})
12. db["Student_data"].deleteMany({$or : {city : "Ahmedabad"},{gender : "Male"}})
13. db["Student_data"].deleteMany({rollno : {$nin : [101, 105, 110]}})
14. db["Student_data"].deleteMany({$and : {department : "Civil"},{$or : {sem : 5},{sem : 7}}})
15. db["Student_data"].deleteMany({city : {$nin : ["Rajkot","Baroda","Jamnagar"]}})
16. db["Student_data"].deleteMany({$and : {rollno : {$gt : 105}},{rollno : {$lt : 108}}})
17. db["Student_data"].updateMany({},{$rename : {city : "LOCATION"}})
18. db["Student_data"].updateMany({fees : {$lt : 10000}},{$rename : {department : "Branch"}})
19. -- Rename Sname to Fullname for students with Rollno in [106, 107, 108].
20. -- Rename Fees to Tuition_Fees for all students with Fees greater than 9000.
21. -- Rename Department to Major where the Fees is less than 15000 and Gender is 'Female'.
22. -- Rename City to Hometown for all students whose SEM is 3 and Department is not 'Mechanical'.
