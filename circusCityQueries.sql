USE CIRCUS_CITY;

-- Query to find all customers in Lakewood and Denver
/*
SELECT CUST_ID, CUS_FNAME, CUS_LNAME, CONTACTS.CONTACT_ID, ADDRESS, CITY, STATE, ZIP_CODE
	FROM CUSTOMERS
    JOIN CONTACTS
		ON CONTACTS.CONTACT_ID = CUSTOMERS.CONTACT_ID
			WHERE CITY IN ('Lakewood','Denver');
*/


-- Query to find all employees, what job they do, and who their manager is
/*
SELECT EMP_ID, EMP_FNAME,EMP_LNAME, JOBS.JOB_ID, JOB_DESCRIPTION, EMPLOYEES.MANAGER_ID, MGR_FNAME, MGR_LNAME
	FROM EMPLOYEES
	JOIN JOBS
		ON EMPLOYEES.JOB_ID = JOBS.JOB_ID
	JOIN MANAGERS
		ON EMPLOYEES.MANAGER_ID = MANAGERS.MANAGER_ID;
*/


-- Query to show all invoices, the last name of the customer, the last name of the employee, and the products purchased
/*
SELECT INVOICES.INVOICE_ID, INVOICES.CUSTOMER_ID, CUS_LNAME, INVOICES.EMP_ID, EMP_LNAME, INVOICE_DATE, LINE_ITEMS.PRODUCT_ID, QTY, LINE_PRICE
	FROM INVOICES
	JOIN LINE_ITEMS
		ON INVOICES.INVOICE_ID = LINE_ITEMS.INVOICE_ID
	JOIN CUSTOMERS
		ON INVOICES.CUSTOMER_ID = CUSTOMERS.CUST_ID
	JOIN EMPLOYEES
		ON INVOICES.EMP_ID = EMPLOYEES.EMP_ID
*/


-- Query to show all invoices, what product was purchased and what category that product is in
/*
SELECT INVOICES.INVOICE_ID, INVOICE_DATE, LINE_ITEMS.PRODUCT_ID, PRODUCT_NAME, CAT_NAME
	FROM INVOICES
    JOIN LINE_ITEMS
		ON INVOICES.INVOICE_ID = LINE_ITEMS.INVOICE_ID
	JOIN PRODUCTS
		ON LINE_ITEMS.PRODUCT_ID = PRODUCTS.PRODUCT_ID
	JOIN PROD_CATEGORIES
		ON PRODUCTS.CATEGORY_ID = PROD_CATEGORIES.CATEGORY_ID
*/


-- Query to show the name and inventory of all products, what store they are at, and what vendor they are from
/*
SELECT STORES.STORE_ID, STORES.MANAGER_ID, PRODUCTS.PRODUCT_NAME, P_INVENTORY, VENDORS.VENDOR_NAME, REP_LNAME
	FROM STORES
    JOIN STORE_INV
		ON STORES.STORE_ID = STORE_INV.STORE_ID
	JOIN PRODUCTS
		ON PRODUCTS.PRODUCT_ID = STORE_INV.PRODUCT_ID
    JOIN VENDORS
		ON VENDORS.VENDOR_ID = PRODUCTS.VENDOR_ID;
*/	
	
	
-- Query to create a view for accounting department to see customers' balance and contact information
/*
CREATE VIEW customer_accounting AS
	SELECT cus_fname, cus_lname, area_code, phone_number, email, SUM(line_price) AS balance
		FROM customers
        LEFT JOIN invoices
			ON customers.cust_id = invoices.customer_id
		LEFT JOIN line_items
			ON invoices.invoice_id = line_items.invoice_id
        JOIN contacts
			ON customers.contact_id = contacts.contact_id
		GROUP BY customers.cust_id;

SELECT * FROM customer_accounting;
*/

-- Query to check what products are running low on inventory (less than 10), along with vendor contact information
/*
SELECT p.product_name, v.vendor_name, v.rep_fname, v.rep_lname, c.area_code, c.phone_number
	FROM products p
    JOIN vendors v
		ON p.vendor_id = v.vendor_id
    JOIN contacts c
		ON v.contact_id = c.contact_id
    JOIN store_inv i 
		ON p.product_id = i.product_id
    WHERE (i.p_inventory < 10);
*/

-- Query to update a customer's last name
/*
UPDATE customers
	SET cus_lname = "Berry"
		WHERE cust_id = 1;
*/

-- Query to add a column for paid time off, and giving every employee one week of vacation time
/*
ALTER TABLE employees
	ADD pto_days INT;

UPDATE employees
	SET pto_days = 5;
*/
