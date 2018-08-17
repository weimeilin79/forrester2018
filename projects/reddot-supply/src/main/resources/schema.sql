/**
 * 
 CREATE TABLE PREORDER(
	orderid INTEGER NOT NULL, 
	productname VARCHAR(100) NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL,
	pickupdate date NOT NULL,
	purchasetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (1, 'someproduct', 'Food, Household & Pets', 40, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (1, 'someproduct', 'Pharmacy, Health & Beauty', 10, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (1, 'someproduct', 'Pharmacy, Health & Beauty', 12, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (1, 'someproduct', 'Pharmacy, Health & Beauty', 16, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (2, 'someproduct', 'Pharmacy, Health & Beauty', 8, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (2, 'someproduct', 'Electronics & Office', 7, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (2, 'someproduct', 'Clothing, Shoes & Accessories', 30, '2018-09-29 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Food, Household & Pets', 2, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Food, Household & Pets', 15, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Food, Household & Pets', 24, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Food, Household & Pets', 10, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Pharmacy, Health & Beauty', 10, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Clothing, Shoes & Accessories', 15, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (3, 'someproduct', 'Clothing, Shoes & Accessories', 20, '2018-10-01 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (4, 'someproduct', 'Toys & Video Games', 70, '2018-10-04 00:00:00');
INSERT INTO PREORDER(orderid, productname, productcategory, orderamt, pickupdate) VALUES (4, 'someproduct', 'Electronics & Office', 90, '2018-10-04 00:00:00');

*/