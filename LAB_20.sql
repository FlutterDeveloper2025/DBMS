--------------------------------------------------------
-- CREATE DATABASE BANK_INFO --
* db.createDatabase("BANK_INFO")
* db.createCollection("DEPOSIT")
* db.DEPOSIT.insertMany([
  {
    ACTNO : 101 
    CNAME : "ANIL"
    BANAME : "VRCE"
    AMOUNT : 1000
    ADATE : "1-3-95"
  }
  {
    ACTNO : 102 
    CNAME : "SUNIL"
    BANAME : "AJNI"
    AMOUNT : 5000
    ADATE : "4-1-96"
  }
  {
    ACTNO : 103 
    CNAME : "MEHUL"
    BANAME : "KAROLBAGH"
    AMOUNT : 3500
    ADATE : "17-11-95"
  }
  {
    ACTNO : 104 
    CNAME : "MADHURI"
    BANAME : "CHANDI"
    AMOUNT : 1200
    ADATE : "17-12-95"
  }
  {
    ACTNO : 105 
    CNAME : "PRAMOD"
    BANAME : "M.G. ROAD"
    AMOUNT : 3000
    ADATE : "27-3-96"
  }
  {
    ACTNO : 106 
    CNAME : "SUNDIP"
    BANAME : "ANDHERI"
    AMOUNT : 2000
    ADATE : "31-3-96"
  }
  {
    ACTNO : 107 
    CNAME : "SHIVANI"
    BANAME : "VIRAR"
    AMOUNT : 1000
    ADATE : "5-9-95"
  }
  {
    ACTNO : 108
    CNAME : "KRANTI"
    BANAME : "NEHRU PLACE"
    AMOUNT : 5000
    ADATE : "2-7-95"
  }
  
])
--------------------------------------------------------
--------------------------------------------------------
-- PART A --
1. db.DEPOSIT.find().forEach(printjson)
2. db.DEPOSIT.findOne().forEach(printjson)
3. db.DEPOSIT.insertOne({
    ACTNO : 109,
    CNAME : "KIRTI",
    BNAME : "VIRAR",
    AMOUNT : 3000,
    ADATE : "3-5-97"
})
4. db.DEPOSIT.insertMany([
    {
      ACTNO : 110 
      CNAME : "MITALI"
      BANAME : "ANDHERI"
      AMOUNT : 4500
      ADATE : "4-9-95"
    }
    {
      ACTNO : 111 
      CNAME : "RAJIV"
      BANAME : "NEHRU PLACE"
      AMOUNT : 7000
      ADATE : "2-10-98"
    }
  ])
5. db.DEPOSIT.find({BNAME : "VIRAR"}).forEach(printjson)
6. db.DEPOSIT.find({$and : {AMOUNT : 3000},{AMOUNT : 5000}}).forEach(printjson)
7. db.DEPOSIT.find({$and : {AMOUNT : {$gt : 2000}},{BNAME : "VIRAR"}}).forEach(printjson)
8. db.DEPOSIT.find({},{CNAME , BNAME , AMOUNT}).forEach(printjson)
9. db.DEPOSIT.find().sort(CNAME : 1).forEach(printjson)
10. db.DEPOSIT.find().sort(BNAME : -1).forEach(printjson)
11. db.DEPOSIT.find().sort(ACTNO : 1 , AMOUNT : -1).forEach(printjson)
12. db.DEPOSIT.find().limit(2).forEach(printjson)
13. db.DEPOSIT.find().limit(1).skip(2).forEach(printjson)
14. db.DEPOSIT.find().limit(2).skip(5).forEach(printjson)
15. db.DEPOSIT.count()
--------------------------------------------------------
-- PART B --
1. db.createCollection("Student")
2. db.Student.insertMany([
  { "_id": 1, "name": "John", "age": 30, "city": "New York", "isActive": true }
  { "_id": 2, "name": "Jane", "age": 25, "city": "Los Angeles", "isActive": false }
  { "_id": 3, "name": "Tom", "age": 35, "city": "Chicago", "isActive": true }
  { "_id": 4, "name": "Lucy", "age": 28, "city": "San Francisco", "isActive": true }
  { "_id": 5, "name": "David", "age": 40, "city": "Miami", "isActive": false }
  { "_id": 6, "name": "Eva", "age": 23, "city": "Boston", "isActive": true }
  { "_id": 7, "name": "Nick", "age": 38, "city": "Seattle", "isActive": false }
  { "_id": 8, "name": "Sophia", "age": 27, "city": "New York", "isActive": true }
  { "_id": 9, "name": "Liam", "age": 32, "city": "Los Angeles", "isActive": false }
  { "_id": 10, "name": "Olivia", "age": 29, "city": "San Diego", "isActive": true }
])
3. db.Student.find().forEach(printjson)
4. db.Student.find({age : 30}).forEach(printjson)
5. db.Student.find({$and : {name : "John"},{age : 30}}).forEach(printjson)
6. db.Student.find({age : {$ne : 25}}).forEach(printjson)
7. db.Student.find({$or : [{age : 25}, {age : 30}, {age : 35}]}) [using or operator]
7. db.Student.find({age : {$in : [25,30,35]}}) [using in operator]
8. db.Student.find({$or : [{name : "John"},{age : 30}]}).forEach(printjson)
9. db.Student.find({$and : {name : "John"},{city : "New York"}}).forEach(printjson)
10. db.Student.find({$and : {name : "John"},{city : "New York"}},{name : 1, age : 1,_id: 0}).forEach(printjson) 
--------------------------------------------------------
--------------------------------------------------------
-- PART C --
[PENDING]
--------------------------------------------------------
