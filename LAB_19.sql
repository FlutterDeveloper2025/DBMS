# -------------------------------------------------------------------------------------------- #
# Part A: MongoDB Queries
1. 	use Darshan
2.	use DIET
3.	show dbs
4. 	db
5.	db.dropDatabase()
6.	db.createCollection("Student")
7.	db.createCollection("Department")
8.	show collections
9.	db.Department.insertOne({Dname: "CE", HOD: "Patel"})
10.	db.Department.insertMany([{Dname: "IT"}, {Dname: "ICT"}])
11.	db.Department.drop()
12.	db.Student.insertOne({
    	Name: "Alice Johnson",
    	City: "New York",
    	Branch: "Computer Science",
    	Semester: 3,
    	Age: 20
	})
13. 	db.Student.insertMany([
    	{
        	Name: "Bob Smith",
        	City: "Los Angeles",
        	Branch: "Information Technology",
        	Semester: 3,
        	Age: 21
    	},
    	{
        	Name: "Carol Davis",
        	City: "Chicago",
        	Branch: "Computer Engineering",
        	Semester: 3,
        	Age: 19
    	},
    	{
        	Name: "David Wilson",
        	City: "Houston",
       		Branch: "Computer Science",
        	Semester: 3,
        	Age: 22
    	}
	])
14.	db.getCollectionNames().includes("Student")
15.	db.Student.stats()
16.	db.Student.drop()
17.	db.createCollection("Deposit")
18.	-------------------------------
19.	db.Deposit.find()
20.	db.Deposit.drop()
# -------------------------------------------------------------------------------------------- #
# Part B: MongoDB Queries
# -------------------------------------------------------------------------------------------- #
1.	use Computer
2.	db.createCollection("Faculty")
3. 	db.Faculty.insertOne({
    	FID: "1",
    	FNAME: "ANIL",
    	FBNAME: "CE",
    	SALARY: 10000,
    	JDATE: "03-01-1995"
	})
4.  db.Faculty.insertMany([
	{
	    	FID: "2",
	    	FNAME: "SUNIL",
	    	FBNAME: "CE",
	    	SALARY: 50000,
	    	JDATE: "0-01-1996"
	}

	{
	    	FID: "3",
	    	FNAME: "MEHUL",
	    	FBNAME: "IT",
	    	SALARY: 35000,
	    	JDATE: "17-11-1995"
	}

	{
	    	FID: "4",
	    	FNAME: "MAHDHURI",
	    	FBNAME: "IT",
	    	SALARY: 12000,
	    	JDATE: "17-12-1995"
	}

	{
	    	FID: "5",
	    	FNAME: "PRAMOD",
	    	FBNAME: "CE",
	    	SALARY: 30000,
	    	JDATE: "27-03-1996"
	}

	{
	    	FID: "6",
	    	FNAME: "SANDIP",
	    	FBNAME: "CE",
	    	SALARY: 20000,
	    	JDATE: "31-03-1996"
	}
	{
	    	FID: "7",
	    	FNAME: "SHIVANI",
	    	FBNAME: "CE",
	    	SALARY: 10000,
	    	JDATE: "05-09-1995"
	}
	{
	    	FID: "8",
	    	FNAME: "KRANTI",
	    	FBNAME: "IT",
	    	SALARY: 50000,
	    	JDATE: "02-07-1995"
	}
])

17.	db.Faculty.find()
18. db.dropCollection()
19. db.drop()
# -------------------------------------------------------------------------------------------- #
# Part c: MongoDB Queries 
# -------------------------------------------------------------------------------------------- #
[TO BE PERFORMED USING UI]
