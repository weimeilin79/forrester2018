/**
 * 
CREATE TABLE PRODUCTORDER(
	orderid INTEGER NOT NULL, 
	productid INTEGER NOT NULL, 
	productname VARCHAR(100) NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL,
	purchasetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (1, 34, 'BANANA', 'Electronics & Office', 1200);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (1, 14, 'Rays', 'Food, Household & Pets', 20);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (2, 18, 'Multi-vite', 'Pharmacy, Health & Beauty', 100);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (2, 37, 'Accessories', 'Electronics & Office', 50);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (3, 15, 'Luffles', 'Food, Household & Pets', 100);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (3, 17, 'Vitamin D3', 'Pharmacy, Health & Beauty', 700);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (3, 35, 'FP', 'Electronics & Office', 200);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (4, 4,  'The Legend of Zelda', 'Toys & Video Games', 150);
INSERT INTO PRODUCTORDER(orderid, productid, productname, productcategory, orderamt) VALUES (4, 37, 'Accessories', 'Electronics & Office', 600);





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




**/

/**
 *
CREATE OR REPLACE FUNCTION add_product(orderidvar INTEGER, productidvar INTEGER, productnamevar VARCHAR(100), orderamt INTEGER) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO PRODUCTORDER (orderid, productid, productname, productcategory, orderamt) 
      	SELECT orderidvar, P.productid, P.productname, C.productcategory, orderamt
				FROM PRODUCT P, PRODUCTCATEGORY C
				WHERE P.categoryid = C.categoryid
				AND P.productid = productidvar;
    END;
    $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_inventory(partneridvar VARCHAR(1), productidvar INTEGER, orderamtvar INTEGER) 
    RETURNS void AS $$
    BEGIN
      UPDATE PARTNERS SET 
				orderamt = orderamt+orderamtvar
			WHERE partnerid = partneridvar
			AND productid = productidvar; 
		IF NOT FOUND THEN
			INSERT INTO PARTNERS
			SELECT partneridvar, productidvar, B.productcategory, A.productname, orderamtvar
			FROM PRODUCT A, 
			PRODUCTCATEGORY B
			WHERE A.categoryid = B.categoryid
			AND A.productid = productidvar;
		END IF;
    END;
$$ LANGUAGE plpgsql;        
 
SELECT update_inventory('C',34,200);
**/






