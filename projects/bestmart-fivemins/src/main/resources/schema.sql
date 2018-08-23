/**
 * 
DROP TABLE PREORDER;
CREATE TABLE PREORDER(
	orderid INTEGER NOT NULL, 
	productid INTEGER NOT NULL,  
	productname VARCHAR(200) NOT NULL,
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

INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  50, 'Sceptre 75 Class 4K (2160P) LED TV (U750CV-U)', 'Electronics & Office', 1100, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  51, 'Furniture of America Contemporary Multiple Storage TV Stand', 'Food, Household & Pets', 275, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  52, 'VIZIO 42 5.1ch Sound Bar System (S4251w-B4)', 'Electronics & Office', 198, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  53, 'Best Choice Products Executive Swivel Massage Recliner w/ Control, 5 Heat & Massage Modes, 2 Cup Holders, 92lbs (Brown)', 'Food, Household & Pets', 284, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  54, '1.7 cu ft Refrigerator with Camouflage-Wrapped Door', 'Electronics & Office', 175, '2018-09-27 00:00:00');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (5,  55, 'Pabst Blue Ribbon Beer (6 pack)', 'Food, Household & Pets', 7, '2018-09-27 00:00:00');

*/

/*

CREATE TABLE PRODUCTCATEGORY(
	  categoryid CHAR(1) NOT NULL,
		productcategory VARCHAR(40) NOT NULL
);


INSERT INTO PRODUCTCATEGORY (categoryid, productcategory) VALUES ( 'A' , 'Electronics & Office');
INSERT INTO PRODUCTCATEGORY (categoryid, productcategory) VALUES ( 'B' , 'Food, Household & Pets');
INSERT INTO PRODUCTCATEGORY (categoryid, productcategory) VALUES ( 'C' , 'Pharmacy, Health & Beauty');
INSERT INTO PRODUCTCATEGORY (categoryid, productcategory) VALUES ( 'D' , 'Toys & Video Games');
INSERT INTO PRODUCTCATEGORY (categoryid, productcategory) VALUES ( 'E' , 'Clothing, Shoes & Accessories');

CREATE TABLE PRODUCT(
		productid INTEGER NOT NULL,
	  categoryid CHAR(1) NOT NULL,
		productname VARCHAR(200) NOT NULL
);


INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (1  ,'D', 'Far Cry 5'							);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (2  ,'D', 'Halo 5: Guardians'			);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (3  ,'D', 'Cars 3: Driven to Win'	);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (4  ,'D', 'The Legend of Zelda'		);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (5  ,'D', 'Minecraft'							);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (6  ,'E', 'RIKE'									);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (7  ,'E', 'UPPER ARMOUR'					);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (8  ,'E', 'LEEBOK'								);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (9  ,'E', 'EDIDAS'								);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (11 ,'B',  'GETTLE'						);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (12 ,'B',  'Kringles'					);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (13 ,'B',  'Rerrs'						);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (14 ,'B',  'Rays'							);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (15 ,'B',  'Luffles' 					);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (16 ,'C',  'Vitamin B12'			);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (17 ,'C',  'Vitamin D3'				);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (18 ,'C',  'Multi-vite'				);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (19 ,'C',  'MCT oil'					);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (20 ,'C', 'Energy Metabolism');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (31 ,'A', 'HELL'							);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (32 ,'A', 'LELOVO'						);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (33 ,'A', 'ATUT'							);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (34 ,'A', 'BANANA'						);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (35 ,'A', 'FP'								);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (36 ,'A', 'Cable'						);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (37 ,'A', 'Accessories'			);
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (38 ,'A',  'TV & Video'				);

INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (50  ,'A', 'Sceptre 75 Class 4K (2160P) LED TV (U750CV-U)');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (51  ,'B', 'Furniture of America Contemporary Multiple Storage TV Stand');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (52  ,'A', 'VIZIO 42 5.1ch Sound Bar System (S4251w-B4)');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (53  ,'B', 'Best Choice Products Executive Swivel Massage Recliner w/ Control, 5 Heat & Massage Modes, 2 Cup Holders, 92lbs (Brown)');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (54  ,'A', '1.7 cu ft Refrigerator with Camouflage-Wrapped Door');
INSERT INTO PRODUCT (productid, categoryid, productname) VALUES (55  ,'B', 'Pabst Blue Ribbon Beer (6 pack)');



CREATE TABLE PREORDER(
	orderid INTEGER NOT NULL, 
	productid INTEGER NOT NULL,  
	productname VARCHAR(200) NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL,
	pickupdate date NOT NULL,
	purchasetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 12, 'Kringles', 'Food, Household & Pets', 40, '2018-09-27');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 16, 'Vitamin B12', 'Pharmacy, Health & Beauty', 10, '2018-09-27');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 17, 'Vitamin D3', 'Pharmacy, Health & Beauty', 12, '2018-09-27');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (1, 19, 'MCT oil', 'Pharmacy, Health & Beauty', 50, '2018-09-27');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 20, 'Energy Metabolism', 'Pharmacy, Health & Beauty', 30, '2018-09-29');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 33, 'ATUT', 'Electronics & Office', 7, '2018-09-29');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (2, 7, 'UPPER ARMOUR', 'Clothing, Shoes & Accessories', 30, '2018-09-29');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 13, 'Rerrs', 'Food, Household & Pets', 2, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 14, 'Rays', 'Food, Household & Pets', 15, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 12, 'Kringles', 'Food, Household & Pets', 24, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 15, 'Luffles', 'Food, Household & Pets', 10, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3, 18, 'Multi-vite', 'Pharmacy, Health & Beauty', 10, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3,  9, 'EDIDAS', 'Clothing, Shoes & Accessories', 99, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (3,  8, 'RIKE', 'Clothing, Shoes & Accessories', 20, '2018-10-01');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (4,  2, 'Halo 5: Guardians', 'Toys & Video Games', 70, '2018-10-04');
INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate) VALUES (4, 31, 'HELL', 'Electronics & Office', 90, '2018-10-04');

*/
