CREATE DATABASE [Catering delVia]
USE [Catering delVia]
DROP DATABASE [Catering delVia]
USE [master]

CREATE TABLE StaffPosition(
	StaffPositionID CHAR (5) PRIMARY KEY
	CHECK (StaffPositionID LIKE 'SP[0-9][0-9][0-9]'),
	StaffPositionName VARCHAR (20)
)


CREATE TABLE Staff (
	StaffID CHAR (5) PRIMARY KEY
	CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR (40),
	StaffGender VARCHAR (10),
	StaffEmail VARCHAR (40)
	CHECK (StaffEmail LIKE '%@gmail.com' OR StaffEmail LIKE '%@yahoo.com'
	OR StaffEmail LIKE '%@yahoo.co.id'),
	StaffPhoneNumber VARCHAR (12)
	CHECK (StaffPhoneNumber LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	StaffAddress VARCHAR (50),
	StaffSalary INT
	CHECK (StaffSalary >= 500000 AND StaffSalary <=5000000),
	StaffPositionID CHAR (5) FOREIGN KEY REFERENCES StaffPosition (StaffPositionID)
)


CREATE TABLE Vendor(
	VendorID CHAR (5) PRIMARY KEY
	CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR (40)
	CHECK (VendorName LIKE 'PT%'),
	VendorPhoneNumber VARCHAR (12)
	CHECK (VendorPhoneNumber LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	VendorAddress VARCHAR (50)
)


CREATE TABLE Ingredients(
	IngredientsID CHAR (5) PRIMARY KEY
	CHECK (IngredientsID LIKE 'ID[0-9][0-9][0-9]'),
	IngredientsName VARCHAR (40),
	IngredientsStock INT,
	IngredientsPrice INT
)


CREATE TABLE Purchase(
	PurchaseID CHAR (5) PRIMARY KEY
	CHECK (PurchaseId LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR (5) FOREIGN KEY REFERENCES Staff (StaffID),
	VendorID CHAR (5) FOREIGN KEY REFERENCES Vendor (VendorID),
	PurchaseDate DATE,
	Quantity INT,
	IngredientsID CHAR (5) FOREIGN KEY REFERENCES Ingredients (IngredientsID)
)

--CUSTOMER
CREATE TABLE Customer(
	CustomerID CHAR (5) PRIMARY KEY
	CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR (40),
	CustomerPhoneNumber VARCHAR (12)
	CHECK (CustomerPhoneNumber LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CustomerAddress VARCHAR (50),
	CustomerGender VARCHAR (10),
	CustomerEmail VARCHAR (40)
	CHECK (CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com'
	OR CustomerEmail LIKE '%@yahoo.co.id')
)

CREATE TABLE Menu (
	MenuID CHAR (5) PRIMARY KEY
	CHECK (MenuID LIKE 'ME[0-9][0-9][0-9]'),
	MenuName VARCHAR (20)
	CHECK (LEN(MenuName)>5),
	MenuDescription VARCHAR (255),
	MenuPrice INT
)

CREATE TABLE ServiceTransaction(
	ServiceTransactionID CHAR (5) PRIMARY KEY
	CHECK (ServiceTransactionID LIKE 'TR[0-9][0-9][0-9]'),
	StaffID CHAR (5) CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]') FOREIGN KEY REFERENCES Staff(StaffID),
	CustomerID CHAR (5) FOREIGN KEY REFERENCES Customer(CustomerID),
	MenuID CHAR (5) FOREIGN KEY REFERENCES Menu(MenuID),
	TransactionDate DATE,
	ReservationType VARCHAR (50),
	ReservationAddress VARCHAR (50),
	MenuSold INT,
	PaxOfEachMenu INT
)
DROP TABLE Customer


--Insert StaffPosition
BEGIN TRAN
INSERT INTO StaffPosition 
VALUES('SP001','CEO'),
('SP002','Treasurer'),
('SP003','Marketing'),
('SP004','Head Chef'),
('SP005','Supervisor'),
('SP006','Secretary'),
('SP007','Promotion'),
('SP008','Inventory Manager'),
('SP009','Chef'),
('SP010','Cashier')
SELECT * FROM StaffPosition
ROLLBACK


-- insert staff
BEGIN TRAN
INSERT INTO Staff
VALUES ('ST001','Luciana Antonio','Female','Luci@gmail.com', '082189322132' ,'Jl Baru Raya Blok A',5000000, 'SP001'),
('ST002','Samuel Alexander','Male','Samuel@yahoo.com', '083234541232' ,'Jl U no 1',4700000, 'SP002'),
('ST003','Gunawan Agustino','Male','Gunawan21@gmail.com', '086554673223' ,'Jl Raya B blok C',4000000, 'SP003'),
('ST004','Elena Theodore','Female','Elen@yahoo.co.id', '089874562371' ,'Jl Raya H No 3', 3500000, 'SP004'),
('ST005','Nasla Putri','Female','Nasla24@gmail.com', '089786758912' ,'Jl B no 5', 2750000, 'SP005'),
('ST006','Narca Huge','Male','Narca@yahoo.com', '089182765619','Jl Pasar Lama Blok G',4700000, 'SP006'),
('ST007','Nico Bellic','Male','Nic61@yahoo.co.id', '083215476658','Jl GI Loas Blok H',1400000, 'SP007'),
('ST008','Joni Anderson','Male','Joni@gmail.com', '089067894172','Jl Bundaran no 3', 2850000, 'SP008'),
('ST009','Brad Pitt','Male','Br4d@yahoo.co.id', '085421236381','Jl Hqop lo no 12',2000000, 'SP009'),
('ST010','Asna Turning','Female','Asna@gmail.com', '089712762811','Jl miuas Blok U No 7',750000, 'SP010')
SELECT * FROM Staff
ROLLBACK


-- insert vendor
BEGIN TRAN
INSERT INTO Vendor 
VALUES ('VE001','PT. Papa Suka','081281879999','Jl. Raya Kebangsaan No.21'),
('VE002','PT. Kue Bahan','083892950508','Jl. Raya Kebagusan No.12'),
('VE003','PT. Kue Tart','082812341122','Jl. SukaMaju No.95'),
('VE004','PT. Sweet Cake','081288881212','Jl. Skasmat No.62'),
('VE005','PT. Cipta Boga','089735527090','Jl .Jatimakmur No.13'),
('VE006','PT. Prima Pangan','081277450054','Jl. Jend. Ahmad Yani No.93'),
('VE007','PT. Audi Harum','083822871912','Jl. Kresek No.3'),
('VE008','PT. Primarasa','087811655758','Jl. KH. Moh.Mansyur No.162A'),
('VE009','PT. Zona Kue','085877903231','Jl. Sampora No.74'),
('VE010','PT. Gandum Mas','081234180673','Jl. Moh. Toha No.3')
SELECT * FROM Vendor
ROLLBACK
drop  table Menu

-- insert ingredients
BEGIN TRAN
INSERT INTO Ingredients
VALUES ('ID001', 'Sugar', 100, 10000),
('ID002', 'Salt', 100, 7000),
('ID003', 'Wheat', 160, 18000),
('ID004', 'Egg', 20, 21000),
('ID005', 'Butter', 3, 13000),
('ID006', 'Milk', 160, 42000),
('ID007', 'Red Sugar', 12, 5000),
('ID008', 'Red Velvet', 300, 5000),
('ID009', 'Cheese', 300, 250000),
('ID010', 'Chocolate', 160, 250000)
SELECT * FROM Ingredients
ROLLBACK
delete Ingredients from Ingredients where IngredientsID = 'ID006'
drop table Ingredients

-- insert purchase
BEGIN TRAN
INSERT INTO Purchase VALUES
('PU001','ST003','VE001', '2020-01-24', '5', 'ID001'),
('PU002','ST004','VE002', '2020-03-21', '2', 'ID002'),
('PU003','ST009','VE003', '2020-04-13', '8', 'ID003'),
('PU004','ST004','VE004', '2020-05-25', '20','ID004'),
('PU005','ST005','VE001', '2020-08-13', '5', 'ID005'),
('PU006','ST003','VE004', '2020-02-21', '4', 'ID006'),
('PU007','ST005','VE003', '2020-05-07', '6', 'ID010'),
('PU008','ST010','VE009', '2020-05-07', '10', 'ID007'),
('PU009','ST007','VE010', '2020-09-21', '12', 'ID009'),
('PU010','ST005','VE007', '2020-10-19', '8', 'ID006'),
('PU011','ST008','VE002', '2020-01-28', '4', 'ID008'),
('PU012','ST010','VE005', '2020-11-26', '15', 'ID010'),
('PU013','ST003','VE008', '2020-09-16', '10', 'ID006'),
('PU014','ST009','VE006', '2020-06-17', '17', 'ID008'),
('PU015','ST010','VE003', '2020-10-31', '7', 'ID002')
SELECT * FROM Purchase
ROLLBACK


--insert customer
BEGIN TRAN
INSERT INTO Customer VALUES
('CU001','Aulia','088978966574','Jl. Bendera No.7','Female','Aulia35@gmail.com'),
('CU002','Budi','081234326580','Jl. Sashi No.32','Male','BudiA@gmail.com'),
('CU003','Bayu','089674387925','Jl. Padding blok a No.1','Male','BayuS@yahoo.com'),
('CU004','Fajar','080796985471','Jl. motoshi blok b No.42','Male','Fajarr@yahoo.co.id'),
('CU005','Nurul','080876856426','Jl. Top Blok Y No.43','Female','Nurul@gmail.com'),
('CU006','Lia','089675476141','Jl. maskira Blok U No.79','Female','Lia@gmail.com'),
('CU007','Milhya','088756498096','Jl. Gang I No.1','Female','Milya06@yahoo.com'),
('CU008','Aji','087607468657','Jl. LedZ blok a N0.8','Male','Aji@gmail.com'),
('CU009','Nadhira','081299074590','Perumahan Mutiara Biru No.45','Female','Nadhira123@gmail.com'),
('CU010','Fahri','087832905758','Perumahan Bella Casa No.18','Male','FahriM89@yahoo.com')
SELECT * FROM Customer
ROLLBACK


--insert menu
BEGIN TRAN
INSERT INTO Menu 
VALUES('ME001','Kue Bolu','Bolu dengan berbagai rasa', 60000),
('ME002','Lapis Legit','Kue tradisional dari Indonesia', 85000),
('ME003','Kue kukus','Kue yang dikukus',35000),
('ME004','Kue SUS','Kue dengan isian cream yang manis', 70000),
('ME005','Nastar','Kue kering dengan isian selai nanas', 75000),
('ME006','Brownis','Kue coklat dengan tekstur kasar', 75000),
('ME007','Kue Pukis','Kue dengan isi coklat atau keju', 15000),
('ME008','Bika Ambon','Tekstur yang lembut dan cocok untuk acara', 50000),
('ME009','Pie Susu','Pie khas Bali yang sangat lezat', 500000),
('ME010','Kastengel','Kue kering dengan rasa keju yang gurih', 700000)
SELECT * FROM Menu
ROLLBACK
DROP TABLE ServiceTransaction
DROP TABLE Menu

--insert servicetransaction
BEGIN TRAN
insert into ServiceTransaction VALUES
('TR001','ST003','CU001','ME001','2020-01-04','By Call','Jl. Bendera No.1', 20, 10),
('TR002','ST004','CU002','ME005','2020-03-21','By Call','Jl. Sashi No.32', 35, 50),
('TR003','ST002','CU006','ME004','2020-05-01','By Chat','Jl. Maskira Blok U No.79', 80, 50),
('TR004','ST010','CU003','ME002','2020-12-04','By Call','Jl. Padding Blok A No.1', 100, 50),
('TR005','ST009','CU006','ME004','2020-12-11','By Call','Jl. Padding Blok A No.2', 100, 50),
('TR006','ST003','CU005','ME007','2020-12-11','By Call','Jl. Padding Blok A No.2A',100, 150),
('TR007','ST008','CU005','ME008','2020-08-23','By Call','Jl. Padding Blok A No.2B',100, 150),
('TR008','ST006','CU010','ME009','2020-11-16','By Call','Jl. Padding Blok A No.5', 100, 150),
('TR009','ST004','CU008','ME009','2020-03-31','By Call','Jl. Padding Blok A No.6', 100, 150),
('TR010','ST010','CU004','ME003','2020-08-12','By Call','Jl. Mawar II Blok B No.43', 100, 150),
('TR011','ST009','CU005','ME006','2020-06-08','By Call','Jl. Pademangan 5 No.15', 85, 100),
('TR012','ST002','CU009','ME010','2020-07-30','By Call','Jl. Mekarjaya No.8', 65, 50),
('TR013','ST010','CU003','ME008','2020-12-18','By Call','Jl. Jend. Ahmad Yani No.47A', 100, 150),
('TR014','ST001','CU007','ME001','2020-09-25','By Call','Jl. Margonda Raya No.127N', 100, 150),
('TR015','ST007','CU010','ME005','2020-10-22','By Call','Jl. H. Ir. Juanda No.9', 40, 50)
SELECT * FROM ServiceTransaction
ROLLBACK


--1
SELECT StaffName, StaffPositionName, 
'Total Activity' = COUNT(ServiceTransactionID) + COUNT(PurchaseID)
FROM Staff S JOIN StaffPosition SP ON S.StaffPositionID = SP.StaffPositionID 
JOIN ServiceTransaction ST ON S.StaffID = ST.StaffID
JOIN Purchase P ON S.StaffID = P.StaffID
GROUP BY StaffName, StaffPositionName

--2
SELECT C.CustomerID, CustomerName, 'Pax Bought'=SUM(PaxOfEachMenu) 
FROM Customer C JOIN ServiceTransaction ST ON C.CustomerID = ST.CustomerID
WHERE CustomerGender = 'Male' AND
DATEPART(MONTH,CAST(TransactionDate AS VARCHAR(10)) ) < 6
GROUP BY C.CustomerID, CustomerName

--3
SELECT IngredientsName, 'Ingredient Bought' = SUM(Quantity),
'Purchase Count' = COUNT(PurchaseID),
'Total Expenses' = SUM(Quantity * IngredientsPrice)
FROM Ingredients I JOIN Purchase P ON I.IngredientsID = P.IngredientsID
WHERE DATEPART(MONTH,CAST(P.PurchaseDate AS VARCHAR(10)))%2= 0
AND (DATEPART(dw,P.PurchaseDate) >= 2 AND DATEPART(dw,P.PurchaseDate) <=5)
GROUP BY IngredientsName

--4
SELECT S.StaffID,'StaffName' = LEFT(StaffName,CHARINDEX(' ', StaffName)-1), 'Transaction Count' = COUNT(ServiceTransactionID), 
'Pax Sold' = SUM(PaxOfEachMenu)
FROM Staff S JOIN ServiceTransaction ST ON S.StaffID = ST.StaffID
WHERE (S.StaffID LIKE ('%1') OR S.StaffID LIKE ('%3') OR S.StaffID LIKE ('%5')  OR S.StaffID LIKE ('%7') OR S.StaffID LIKE ('%9')) 
AND (ST.CustomerID LIKE ('%0') OR ST.CustomerID LIKE ('%2') OR ST.CustomerID LIKE ('%4') OR ST.CustomerID LIKE ('%6') OR ST.CustomerID LIKE ('%8'))
GROUP BY StaffName,S.StaffID
SELECT * FROM ServiceTransaction
--5
SELECT 'Vendor Name' = REPLACE (VendorName, 'PT. ', ''), IngredientsName, 'Ingredients Price' = 'Rp.' + CAST(IngredientsPrice AS VARCHAR)
FROM Vendor V JOIN Purchase P ON P.VendorID = V.VendorID
JOIN Ingredients I ON I.IngredientsID = P.IngredientsID 
WHERE IngredientsPrice>=(SELECT AVG(IngredientsPrice) FROM Ingredients) AND IngredientsStock<250

--6
SELECT CustomerName,'Transaction Date'= CONVERT(VARCHAR,TransactionDate,107), MenuName, MenuPrice, 
'Brief Description'=SUBSTRING(MenuDescription, 0, CHARINDEX(' ', MenuDescription, CHARINDEX(' ', MenuDescription, 0)+1)),PaxOfEachMenu,
'Total Price'=MenuPrice*PaxOfEachMenu
FROM Customer C JOIN ServiceTransaction ST ON ST.CustomerID = C.CustomerID
JOIN Menu M ON M.MenuID = ST.MenuID
WHERE MenuPrice>(SELECT AVG(MenuPrice) FROM Menu) AND PaxOfEachMenu>100

--7
SELECT 'StaffName'=UPPER(StaffName), 'Purchase Date' = CONVERT(VARCHAR,PurchaseDate,107),
'Quantity Bought' = CAST(SUM(P.Quantity)AS VARCHAR) + ' pcs'
FROM Staff S JOIN Purchase P ON P.StaffID = S.StaffID
JOIN Ingredients I ON I.IngredientsID = P.IngredientsID
WHERE DATEPART(month,CAST(P.PurchaseDate AS VARCHAR(10)))%2 = 0 
AND IngredientsPrice < (SELECT MAX(IngredientsPrice) FROM Ingredients)
GROUP BY StaffName,PurchaseDate

--8
SELECT C.CustomerID,'CustomerEmail'=SUBSTRING(CustomerName, 0, CHARINDEX('@', CustomerEmail)), 'MenuName'=LOWER(MenuName),
'Pax Bought'=SUM(ST.PaxOfEachMenu) 
FROM Customer C JOIN ServiceTransaction ST ON ST.CustomerID = C.CustomerID
JOIN Menu M ON M.MenuID = ST.MenuID
WHERE CustomerGender = 'Male' AND ST.PaxOfEachMenu >= (SELECT AVG(PaxOfEachMenu) FROM ServiceTransaction)
GROUP BY C.CustomerID,CustomerEmail,MenuName,CustomerName

--9
CREATE VIEW LoyalCustomerView AS
SELECT CustomerName, 'Total Transaction' = COUNT(ST.CustomerID), 'Total Pax Purchased'=SUM(ST.PaxOfEachMenu), 'Total Price'=SUM(ST.PaxOfEachMenu*M.MenuPrice)
FROM Customer C JOIN ServiceTransaction ST ON ST.CustomerID = C.CustomerID JOIN Menu M ON M.MenuID = ST.MenuID
WHERE CustomerGender = 'Female' 
GROUP BY CustomerName HAVING COUNT(ST.CustomerID) > 2

--10
CREATE VIEW VendorRecapView AS
SELECT VendorName, 'Purchase Made'=COUNT(V.VendorID), 'Ingredients Purchase'=SUM(P.Quantity)
FROM Vendor V JOIN Purchase P ON P.VendorID = V.VendorID
JOIN Ingredients I ON I.IngredientsID = P.IngredientsID
WHERE I.IngredientsStock > 150
GROUP BY VendorName
HAVING COUNT(P.VendorID)>1 


SELECT * FROM VendorRecapView
SELECT * FROM LoyalCustomerView
SELECT * FROM StaffPosition
SELECT * FROM Staff
SELECT * FROM Vendor
SELECT * FROM Ingredients
SELECT * FROM Purchase
SELECT * FROM Customer
SELECT * FROM Menu