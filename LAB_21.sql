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
1. 
