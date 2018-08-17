DROP TABLE IF EXISTS PARTNERS;

CREATE TABLE PARTNERS(
	partnerid CHAR(1) NOT NULL, 
	productid INTEGER NOT NULL,
	productname VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL
);

INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',1, 'Far Cry 5', 890);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',2, 'Halo 5: Guardians', 700);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',3, 'Cars 3: Driven to Win', 200);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',4, 'The Legend of Zelda', 1700);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',5, 'Minecraft', 1000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',6, 'RIKE', 6000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',7, 'UPPER ARMOUR', 2100);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',8, 'LEEBOK', 2200);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',9, 'EDIDAS', 2800);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('A',10, 'BANANA', 8000);

INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',11, 'GETTLE', 2300);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',12, 'Kringles', 1300);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',13, 'Rerrs', 2300);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',14, 'Rays', 2300);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',15, 'Luffles', 1700);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',16, 'Vitamin B12', 400);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',17, 'Vitamin D3', 1600);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',18, 'Multi-vite', 4000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',19, 'MCT oil', 700);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('B',20, 'Energy Metabolism', 800);



INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',31, 'HELL', 6000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',32, 'LELOVO', 5000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',33, 'ATUT', 5000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',34, 'BANANA', 9000);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',35, 'FP', 3500);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',36, 'Cable', 200);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',37, 'Accessories', 300);
INSERT INTO PARTNERS(partnerid, productid, productname, orderamt ) VALUES ('C',38, 'TV & Video', 6000);




/**
 * 
 * 
 CREATE TABLE PARTNERS(
	partnerid CHAR(1) NOT NULL, 
	productid INTEGER NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	productname VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL
);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',1,'Toys & Video Games', 'Far Cry 5', 890);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',2,'Toys & Video Games', 'Halo 5: Guardians', 700);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',3,'Toys & Video Games', 'Cars 3: Driven to Win', 200);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',4,'Toys & Video Games', 'The Legend of Zelda', 1700);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',5,'Toys & Video Games', 'Minecraft', 1000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',6,'Clothing, Shoes & Accessories', 'RIKE', 6000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',7,'Clothing, Shoes & Accessories', 'UPPER ARMOUR', 2100);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',8,'Clothing, Shoes & Accessories', 'LEEBOK', 2200);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('A',9,'Clothing, Shoes & Accessories', 'EDIDAS', 2800);

INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',11,'Food, Household & Petse', 'GETTLE', 2300);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',12,'Food, Household & Petse', 'Kringles', 1300);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',13,'Food, Household & Petse', 	'Rerrs', 2300);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',14,'Food, Household & Petse', 'Rays', 2300);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',15,'Food, Household & Petse', 'Luffles', 1700);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',16,'Pharmacy, Health & Beauty', 'Vitamin B12', 400);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',17,'Pharmacy, Health & Beauty', 'Vitamin D3', 1600);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',18,'Pharmacy, Health & Beauty', 'Multi-vite', 4000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',19,'Pharmacy, Health & Beauty', 'MCT oil', 700);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('B',20,'Pharmacy, Health & Beauty', 'Energy Metabolism', 800);



INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',31,'Electronics & Office', 'HELL', 6000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',32,'Electronics & Office', 'LELOVO', 5000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',33,'Electronics & Office', 'ATUT', 5000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',34,'Electronics & Office', 'BANANA', 9000);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',35,'Electronics & Office', 'FP', 3500);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',36,'Electronics & Office', 'Cable', 200);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',37,'Electronics & Office', 'Accessories', 300);
INSERT INTO PARTNERS(partnerid, productid, productcategory, productname, orderamt ) VALUES ('C',38,'Electronics & Office', 'TV & Video', 6000);
**/
