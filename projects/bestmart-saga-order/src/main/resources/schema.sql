/**
 * 
CREATE TABLE PRODUCTORDER(
	orderid INTEGER NOT NULL, 
	productname VARCHAR(100) NOT NULL,
	productcategory VARCHAR(40) NOT NULL,
	orderamt INTEGER NOT NULL,
	purchasetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (1, 'someproduct', 'Electronics & Office', 300);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (1, 'someproduct', 'Food, Household & Pets', 400);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (2, 'someproduct', 'Pharmacy, Health & Beauty', 100);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (2, 'someproduct', 'Electronics & Office', 250);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (3, 'someproduct', 'Food, Household & Pets', 100);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (3, 'someproduct', 'Pharmacy, Health & Beauty', 700);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (3, 'someproduct', 'Electronics & Office', 200);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (4, 'someproduct', 'Toys & Video Games', 150);
INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (4, 'someproduct', 'Electronics & Office', 600);
**/

/**
 *
CREATE OR REPLACE FUNCTION add_city(orderid INTEGER, productname VARCHAR(100), productcategory VARCHAR(40), orderamt INTEGER) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (orderid, productname, productcategory, orderamt);
    END;
    $$ LANGUAGE plpgsql;
    
SELECT add_city(a, 'The Product', 'Pharmacy, Health & Beauty', 290);
**/






