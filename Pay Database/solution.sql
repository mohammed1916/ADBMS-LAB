-- 1. Create the tables
CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(255),
    vendor_gender CHAR(1) CHECK (vendor_gender IN ('M', 'F')),
    vendor_city VARCHAR(255),
    vendor_state VARCHAR(255) CHECK (vendor_state IN ('TN', 'KA', 'KE', 'AP')),
    vendor_phone CHAR(10) CHECK (LENGTH(vendor_phone) = 10)
);

CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    vendor_id INT REFERENCES Vendor(vendor_id),
    invoice_number VARCHAR(255),
    invoice_date DATE CHECK (invoice_date = '2020-08-30'),
    invoice_total DECIMAL(10, 2),
    payment_total DECIMAL(10, 2) DEFAULT 0,
    credit_total DECIMAL(10, 2) DEFAULT 0,
    invoice_due_date DATE CHECK (invoice_due_date = '2020-08-30'),
    payment_date DATE
);

INSERT INTO Vendor VALUES   (32, 'Kun-Hyundai', 'M', 'Chennai','TN','8765432109'),
                            (34, 'XYZ Motors', 'M', 'Hyderabad','TN', '7654321098'),
                            (35, 'Tech Solutions', 'F', 'Chennai','TN', '6543210987'),
                            (36, 'Green Enterprises', 'M', 'Mumbai','TN', '5432109876'),
                            (37, 'Star Innovations', 'F', 'Hyderabad','TN', '4321098765'),
                            (38, 'ABC Electronics', 'M', 'Bangalore','TN', '3210987654');


INSERT INTO Invoice VALUES
    (1, 34, 'ABA-100', '2020-08-30', 14000, 0, 0, '2020-08-30', NULL),
    (2, 33, 'XYZ-200', '2020-07-15', 12500, 0, 0, '2020-08-30', NULL),
    (3, 34, 'ABA-101', '2020-09-10', 18500, 0, 0, '2020-08-30', NULL),
    (4, 35, 'PQR-300', '2020-06-25', 9500, 0, 0, '2020-08-30', NULL),
    (5, 36, 'DEF-201', '2020-08-05', 13500, 0, 0, '2020-08-30', NULL),
    (6, 37, 'GHI-400', '2020-07-20', 10500, 0, 0, '2020-08-30', NULL);


-- 3. Queries
-- a. Get the details of female vendors
SELECT * FROM Vendor WHERE vendor_gender = 'F';

-- b. Get the details of vendors whose name has a substring of "AN"
SELECT * FROM Vendor WHERE vendor_name LIKE '%AN%';

-- c. Get the name, city, and state of vendors located in the same city and state
SELECT vendor_name, vendor_city, vendor_state
FROM Vendor
GROUP BY vendor_name, vendor_city, vendor_state
HAVING COUNT(*) > 1;

-- d. Get the details of vendors who do not belong to Tamilnadu
SELECT * FROM Vendor WHERE vendor_state != 'TN';

-- e. Retrieve the details of invoices within a date range
SELECT * FROM Invoice WHERE invoice_date BETWEEN '2019-01-01' AND '2020-10-01';

-- 4. PL/SQL Procedure to check if a string is palindrome
CREATE OR REPLACE FUNCTION IsPalindrome(str VARCHAR2) RETURN BOOLEAN AS
    reversed_str VARCHAR2(255);
BEGIN
    reversed_str := REVERSE(str);
    IF str = reversed_str THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END IsPalindrome;

-- 5. PL/SQL Procedure to find invoices with payment total greater than average
CREATE OR REPLACE PROCEDURE FindInvoicesWithHigherPayment IS
    avg_payment DECIMAL(10, 2);
BEGIN
    SELECT AVG(payment_total) INTO avg_payment FROM Invoice WHERE payment_total > 0;

    FOR invoice_rec IN (SELECT invoice_id, invoice_total FROM Invoice WHERE payment_total > avg_payment) LOOP
        DBMS_OUTPUT.PUT_LINE('Invoice ID: ' || invoice_rec.invoice_id || ', Invoice Total: ' || invoice_rec.invoice_total);
    END LOOP;
END FindInvoicesWithHigherPayment;
