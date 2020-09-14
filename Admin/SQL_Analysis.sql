SELECT * FROM HR.EMPLOYEES8;
--Not good way to slice date :(
SELECT DISTINCT(SUBSTR(hire_date,4)) AS month,  COUNT(SUBSTR(hire_date,4)) as numofemphire FROM hr.employees 
    WHERE SUBSTR(hire_date,9) = 05
GROUP BY hire_date ORDER BY month;

DESC ALL_TABLES;

SELECT table_name FROM all_tables WHERE owner = 'SH';

DESC SH.SALES;
DESC SH.COSTS

SELECT * FROM sh.sales;
SELECT * FROM sh.costs;
SELECT * FROM SH.PRODUCTS;

SELECT cst.prod_id, cst.unit_const,cst.unit_price  FROM sh.costs cst;

--demo
SELECT TRUNC (TO_DATE(hire_date), 'month')   "New Year" FROM hr.employees ORDER BY "New Year";

-- Number of product units sold in each month

SELECT 
DISTINCT(TRUNC(TO_DATE(time_id),'Month'))  AS "New Year" , COUNT (TRUNC(TO_DATE(time_id),'Month'))  AS "UnitSold"
FROM sh.sales GROUP BY TRUNC(TO_DATE(time_id),'Month') ORDER BY 1;

-- Query 2:  product unit sold each month
select prod_id,  sum(quantity_sold) "UnitSold" from sh.sales  group by prod_id order by 1;

-- product id and product name Join Clause
select distinct(sale.prod_id), prod.prod_name FROM sh.products prod, sh.sales sale
where sale.prod_id = prod.prod_id
order by 1;

-- show product id and product name sold each month

select * from sh.PRODUCTS;

-- select Electronics product
SELECT prod_id, prod_name,prod_desc,prod_category,prod_subcategory FROM sh.PRODUCTS;

SELECT prod_category,prod_subcategory, count(prod_category) "COUNT"FROM sh.PRODUCTS
GROUP BY prod_category,prod_subcategory
ORDER BY 3 ASC;


SELECT table_name, owner FROM all_tables WHERE table_name LIKE '%EMP%';

select * from scott.emp;

SELECT * FROM SH.SALES;
-- product sold by month in 2001
SELECT TRUNC(time_id,'month'), prod_id, COUNT(prod_id) AS "UnitSolds" FROM SH.SALES
WHERE substr(time_id,8) = '01'
GROUP BY TRUNC(time_id,'month'),prod_id
HAVING COUNT(prod_id) > 700
ORDER BY 1;

-- JOIN on tables
select table_name, owner FROM all_tables WHERE table_name LIKE  '%salesman%' or  table_name LIKE  '%order%'; 


