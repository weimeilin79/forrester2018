/**
 * 
DROP TABLE PREORDER;
CREATE TABLE PREORDER(
	orderid INTEGER NOT NULL, 
	productid INTEGER NOT NULL,  
	productname VARCHAR(100) NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL,
	pickupdate date NOT NULL,
	purchasetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 12, 'Kringles', 'Food, Household & Pets', 40, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 16, 'Vitamin B12', 'Pharmacy, Health & Beauty', 10, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 17, 'Vitamin D3', 'Pharmacy, Health & Beauty', 12, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 19, 'MCT oil', 'Pharmacy, Health & Beauty', 50, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 20, 'Energy Metabolism', 'Pharmacy, Health & Beauty', 30, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 33, 'ATUT', 'Electronics & Office', 7, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 7, 'UPPER ARMOUR', 'Clothing, Shoes & Accessories', 30, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 13, 'Rerrs', 'Food, Household & Pets', 2, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 14, 'Rays', 'Food, Household & Pets', 15, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 12, 'Kringles', 'Food, Household & Pets', 24, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 15, 'Luffles', 'Food, Household & Pets', 10, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 18, 'Multi-vite', 'Pharmacy, Health & Beauty', 10, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3,  9, 'EDIDAS', 'Clothing, Shoes & Accessories', 99, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3,  8, 'RIKE', 'Clothing, Shoes & Accessories', 20, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (4,  2, 'Halo 5: Guardians', 'Toys & Video Games', 70, '2018-10-04 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (4, 31, 'HELL', 'Electronics & Office', 90, '2018-10-04 00:00:00');



*/