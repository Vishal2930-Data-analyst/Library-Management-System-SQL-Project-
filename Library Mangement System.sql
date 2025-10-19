CREATE DATABASE LIBRARY_MANAGEMENT_SYSTEM;
USE LIBRARY_MANAGEMENT_SYSTEM;
SET SQL_SAFE_UPDATES=0;

#CREATING TABLE FOR BOOKS
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(40),
    Author VARCHAR(40),
    PublicationYear YEAR,
    Genre VARCHAR(40)
);
#INSERTING VALUES INTO TABLE BOOKS
INSERT INTO Books VALUES
(1,'Introduction to Science','Carl Sagan',1995,'Science'),
(2,'Modern Physics','Stephen Hawking',2001,'Science'),
(3,'History of Art','John Smith',1980,'Art'),
(4,'Computer Science Basics','Alan Turing',1998,'Technology'),
(5,'AI Revolution','Andrew Ng',2019,'Technology'),
(6,'Biology 101','Jane Goodall',1997,'Science'),
(7,'The Great Novel','Mark Twain',1997,'Fiction'),
(8,'Data Science Handbook','Wes McKinney',2015,'Technology'),
(9,'Chemistry Fundamentals','Marie Curie',1990,'Science'),
(10,'Philosophy of Mind','David Chalmers',2002,'Philosophy');

SELECT * FROM BOOKS;

#CREATING TABLE FOR MEMBERS
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(40),
    LastName VARCHAR(40),
    Email VARCHAR(40),
    MembershipDate DATE
);
#INSERTING INTO MEMBERS TABLE
INSERT INTO Members VALUES
(1,'Vishal','Borse','vishal@example.com','2021-01-10'),
(2,'Om','Raut','om@example.com','2020-03-12'),
(3,'Krutik','Patil','krutik@example.com','2022-07-01'),
(4,'Swapnik','Kini','swapnil@example.com','2023-05-20'),
(5,'Pranjal','Patil','pranjal@example.com','2021-09-14'),
(6,'Sakshi','Patil','sakshi@example.com','2024-02-18'),
(7,'Jatish','Pawade','jatish@example.com','2019-11-30'),
(8,'Vishakha','Pakhare','vishakha@example.com','2020-06-25'),
(9,'Jay','Naik','jay@example.com','2022-10-05'),
(10,'Kiran','Dharade','kiran@example.com','2023-04-19');

SELECT * FROM MEMBERS;

#CREATING TABLE AUTHORS
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(40),
    BirthYear YEAR
);
#INSERTING VALUES IN AUTHORS TABLE
INSERT INTO Authors VALUES
(1,'Carl Sagan',1934),
(2,'Stephen Hawking',1942),
(3,'John Smith',1950),
(4,'Alan Turing',1912),
(5,'Andrew Ng',1976),
(6,'Jane Goodall',1934),
(7,'Mark Twain',1997),
(8,'Wes McKinney',1983),
(9,'Marie Curie',1967),
(10,'David Chalmers',1960);
SELECT * FROM AUTHORS;

#CREATING TABLE FOR LOANS
CREATE TABLE LOANS (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (MemberID)
        REFERENCES Members (MemberID)
);
#INSETING DATA INTO LOANS TABLE
INSERT INTO Loans VALUES
(1,1,1,'2024-01-12',NULL),(2,2,2,'2023-05-15','2023-06-10'),
(3,3,3,'2024-02-01',NULL),(4,4,4,'2022-08-20','2022-09-20'),
(5,5,5,'2024-03-05',NULL),(6,6,6,'2021-07-12','2021-07-22'),
(7,7,7,'2024-05-14',NULL),(8,8,8,'2020-11-10','2020-12-01'),
(9,9,9,'2024-04-02',NULL),(10,10,10,'2023-09-25','2023-10-01'),
(11,3,1,'2023-01-05','2023-01-25'),(12,4,1,'2023-03-10','2023-04-02'),
(13,5,1,'2023-06-15','2023-07-01'),(14,6,1,'2023-10-12','2023-10-30'),
(15,7,1,'2024-06-20',NULL),(16,1,2,'2024-01-20','2024-02-01'),
(17,3,2,'2024-03-01','2024-03-21'),(18,8,2,'2024-04-15',NULL),
(19,9,2,'2024-05-12','2024-05-29'),(20,10,2,'2024-06-18',NULL),
(21,2,3,'2024-02-15','2024-03-05'),(22,4,3,'2024-06-01',NULL),
(23,5,4,'2024-01-05','2024-01-20'),(24,6,4,'2024-07-10',NULL),
(25,7,5,'2024-03-10','2024-03-25'),(26,8,5,'2024-06-05',NULL),
(27,9,6,'2024-02-28','2024-03-10'),(28,10,7,'2024-07-20',NULL),
(29,1,8,'2024-02-10','2024-02-20'),(30,2,9,'2024-05-03',NULL);

SELECT * FROM LOANS;

#CREATING TABLE FOR BOOKAUTHORS
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (AuthorID)
        REFERENCES Authors (AuthorID)
);

#INSETING VALUES INTO BOOKAUTHORS
INSERT INTO BookAuthors VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);
SELECT * FROM BOOKAUTHORS;

#CREATING TABLE FOR FINES
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    LoanID INT,
    FineAmount DEC(10 , 2 ),
    PaidDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loans (LoanID)
);

#INSERTING VALUES INTO FINES TABLES
INSERT INTO Fines VALUES
(1,1,15.00,'2024-02-15'),(2,3,5.00,NULL),(3,5,20.00,'2024-04-01'),
(4,7,8.00,NULL),(5,9,12.00,'2024-05-10'),(6,2,0.00,NULL),
(7,4,7.00,'2022-09-25'),(8,6,10.00,'2021-07-25'),(9,8,3.00,'2020-12-10'),
(10,10,18.00,'2023-10-05'),(11,18,6.00,NULL),(12,18,7.50,'2024-05-10'),     
(13,20,5.00,NULL),(14,20,6.25,NULL),(15,22,12.00,NULL),             
(16,24,4.00,'2024-07-20'),(17,24,8.00,NULL),(18,25,2.00,'2024-03-28'),
(19,26,9.00,NULL),(20,28,3.00,NULL),(21,30,15.00,'2024-05-20'),     
(22,15,4.00,NULL),(23,15,9.00,'2024-06-28'),(24,11,5.00,'2023-01-28'),(25,11,6.50,NULL);  
            
SELECT * FROM FINES;


SELECT * FROM BOOKS;
SELECT * FROM AUTHORS;
SELECT * FROM MEMBERS;
SELECT * FROM LOANS;
SELECT * FROM BOOKAUTHORS;
SELECT * FROM FINES;

#QUESTIONS

#Q1) WRITE A QUERY TO SELECT ALL BOOKS PUBLISHED BEFORE 2000 FROM THE BOOKS TABLE
SELECT * FROM BOOKS WHERE PUBLICATIONYEAR <2000;


#Q2)WRITE A QUERY TO SELECT ALL LOANS WHERE THE LOANDATE IS IN 2024 AND THE RETURNDATE IS NULL
SELECT * FROM LOANS WHERE LOANDATE="2024-01-01" OR RETURNDATE IS NULL;


#Q3)WRITE A QUERY TO SELECT ALL BOOKS WHERE THE TITLE CONTAINS 'SCIENCE'.
SELECT * FROM BOOKS WHERE TITLE LIKE "%SCIENCE%";


#Q4)WRITE A QUERY TO SELECT TITLE AND NEW COLUMN AVAILABILITY FROM THE BOOKS TABLE. IF A BOOK
# HAS BEEN LOANED OUT (I.E, EXISTS IN LOANS TABLE WITH A NULL RETURNDATE),SET AVAILABILITY TO 'CHECKED OUT', OTHERWISE 'AVAILABLE'.
SELECT b.Title,
       CASE WHEN EXISTS (SELECT 1 FROM Loans l
             WHERE l.BookID = b.BookID AND l.ReturnDate IS NULL) THEN 'Checked Out'
         ELSE 'Available'
       END AS Availability
FROM Books b;


#Q5)WRITE A QUERY TO FIND ALL MEMBERS WHO HAVE BORROWED MORE THAN 5 BOOKS. USE A SUBQUERY TO FIND THERE MEMBERIDS
SELECT * FROM LOANS;
SELECT * FROM (SELECT MemberID, COUNT(MEMBERID) AS BorrowCount FROM Loans
    GROUP BY MemberID) AS t
WHERE BorrowCount > 5;

#Q6)Write a query to get the total FineAmount collected for each LoanID, 
#but only include loans where the total fine amount is greater than $10. Use the HAVING clause.
SELECT LoanID, SUM(FineAmount) AS TotalFine
FROM Fines GROUP BY LoanID HAVING SUM(fineAmount) > 10;

#Q7)Write a query to select the top 5 most frequently borrowed books.
SELECT b.Title, COUNT(l.LoanID) AS BorrowCount
FROM Loans l JOIN Books b ON l.BookID = b.BookID
GROUP BY b.BookID, b.Title ORDER BY BorrowCount DESC
LIMIT 5;

#Q8)Write a query to join Loans with Books to get a list of all loans with Title, LoanDate, and ReturnDate.
SELECT b.Title, l.LoanDate, l.ReturnDate from Books b
Inner join Loans l on b.BookID = l.BookID;

#Q9)Write a query to get a list of all Books and any associated loans. Include books that might not be currently borrowed.
Select b.Title, l.LoanDate, l.ReturnDate from Loans l
Left Join Books b on l.BookID = b.BookID;

#Q10)Write a query to get the total number of books each Author has written. 
#Use an INNER JOIN between Books and BookAuthors, and group by AuthorID.
SELECT a.AuthorID, a.AuthorName, COUNT(ba.BookID) AS TotalBooks
FROM Authors a
INNER JOIN BookAuthors ba ON a.AuthorID = ba.AuthorID
GROUP BY a.AuthorID, a.AuthorName;

#Q11)Write a query to find all Books that were written by authors born after 1970. 
#Use a subquery in the WHERE clause to find these AuthorIDs.
SELECT b.Title
FROM Books b
WHERE b.BookID IN (
    SELECT ba.BookID
    FROM BookAuthors ba
    JOIN Authors a ON ba.AuthorID = a.AuthorID
    WHERE a.BirthYear > 1970
);

#Q12)Write a query to list Title, AuthorName, and FineAmount for all books where a fine has been recorded. 
#Use INNER JOIN and LEFT JOIN as necessary to get all required details.
SELECT b.Title, a.AuthorName, f.FineAmount
FROM Fines f
INNER JOIN Loans l ON f.LoanID = l.LoanID
INNER JOIN Books b ON l.BookID = b.BookID
LEFT JOIN BookAuthors ba ON b.BookID = ba.BookID
LEFT JOIN Authors a ON ba.AuthorID = a.AuthorID;
