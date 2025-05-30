-- SQL CLAUSES
-- 1.WHERE   2. ORDER BY    3. GROUP BY   4. HAVING

-- WHERE CLAUSE
USE CONSTRAINT_EG;

SELECT * FROM SALES;

-- COMPARISON OPERATOR:  =, !=, <, >, <=, >=
SELECT * FROM SALES WHERE SUBCATEGORY = "PHONES";

SELECT * FROM SALES WHERE STATE != "CALIFORNIA";

SELECT * FROM SALES WHERE SALES >= 500;

-- LOGICAL OPERATOR: AND, OR, NOT
SELECT * FROM SALES WHERE REGION = "WEST" AND STATE ="CALIFORNIA";

SELECT * FROM SALES WHERE CATEGORY = "FURNITURE" OR SALES <= 200;

SELECT * FROM SALES WHERE NOT REGION = "CENTRAL";


-- ORDER BY
-- ASC   DESC
SELECT * FROM SALES ORDER BY PROFIT ASC;

SELECT * FROM SALES ORDER BY REGION;

SELECT * FROM SALES WHERE SEGMENT = "CONSUMER" ORDER BY QUANTITY DESC;

-- IS NULL / NOT NULL

SELECT * FROM SALES WHERE POSTALCODE IS NULL;



-- TASK
-- FETCH RECORDS RELATED TO TECHNOLOGY ORDER BY ORDER DATE IN DESCENDING ORDER
SELECT * FROM SALES WHERE CATEGORY = "TECHNOLOGY" ORDER BY ORDERDATE DESC;

-- LIMIT
SELECT * FROM SALES ORDER BY SALES DESC LIMIT 10;

-- IN
SELECT * FROM SALES WHERE SUBCATEGORY IN('ART', 'PHONES','TABLES');

-- BETWEEN
SELECT * FROM SALES WHERE ORDERDATE BETWEEN '2014-06-01' AND '2016-12-01';

-- LIKE
SELECT * FROM SALES WHERE REGION LIKE "E%";

SELECT * FROM SALES WHERE SUBCATEGORY LIKE "__R%";

SELECT * FROM SALES WHERE CATEGORY LIKE "%NO%";

-- AGGREGATE FUNCTION
-- COUNT
SELECT COUNT(*) FROM SALES WHERE CATEGORY = "TECHNOLOGY";

SELECT COUNT(DISTINCT SUBCATEGORY) FROM SALES;

-- AVG()
SELECT AVG(QUANTITY) FROM SALES;

-- SUM()
SELECT SUM(PROFIT) FROM SALES WHERE REGION = "EAST";
SELECT SUM(SALES) FROM SALES;

-- MIN()
SELECT MIN(SALES) FROM SALES;
SELECT MIN(QUANTITY) FROM SALES WHERE CATEGORY = "FURNITURE";

-- MAX()
SELECT MAX(SALES) FROM SALES;

-- GROUP BY
SELECT COUNT(ORDERID), CATEGORY FROM SALES GROUP BY CATEGORY;

SELECT SUM(SALES), REGION FROM SALES GROUP BY REGION ORDER BY SUM(SALES) DESC;

SELECT COUNT(*),SUM(SALES),MIN(SALES), CATEGORY FROM SALES GROUP BY CATEGORY;

-- HAVING CLAUSE
SELECT COUNT(ORDERID), SUBCATEGORY FROM SALES GROUP BY SUBCATEGORY HAVING COUNT(ORDERID)> 10;

SELECT SUM(SALES),CATEGORY FROM SALES GROUP BY CATEGORY HAVING SUM(SALES)<500;

SELECT COUNT(ORDERID), REGION FROM SALES GROUP BY REGION HAVING COUNT(ORDERID) >10;

SELECT COUNT(ORDERID), AVG(QUANTITY), REGION FROM SALES GROUP BY REGION HAVING COUNT(ORDERID) <20;

SELECT sum(SALES), CATEGORY, subcategory FROM SALES group by CATEGORY, SUBCATEGORY HAVING sum(SALES) > 50;


-- SUBQUERY
CREATE TABLE CUSTOMER(C_ID INT,C_NAME VARCHAR(10));
INSERT INTO CUSTOMER VALUES(1, "JOHN"),(2,"ROBERT"),(3,"DAVID"),(4,"JOHN"),(5,"BETTY");

CREATE TABLE ORDERS(O_ID INT, AMT INT, C_ID INT);
INSERT INTO ORDERS VALUES(1,1000,4),(2,3900,10),(3,2000,3),(4,2000,1),(5,100,2);

SELECT C_ID FROM ORDERS;
SELECT C_ID,C_NAME FROM CUSTOMER WHERE C_ID IN (SELECT C_ID FROM ORDERS);