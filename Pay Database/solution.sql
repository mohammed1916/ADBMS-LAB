\echo ************* CREATE: Vendor table
CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(255),
    vendor_gender CHAR(1) CHECK (vendor_gender IN ('M', 'F')),
    vendor_city VARCHAR(255),
    vendor_state VARCHAR(255) CHECK (vendor_state IN ('TN', 'KA', 'KE', 'AP')),
    vendor_phone CHAR(10) CHECK (LENGTH(vendor_phone) = 10)
);

\echo ************* CREATE: Invoice table
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    vendor_id INT,
    invoice_number VARCHAR(255),
    invoice_date DATE CHECK (invoice_date = TO_DATE('30th August 2020', 'DDth Month YYYY')),
    invoice_total INT,
    payment_total INT DEFAULT 0,
    credit_total INT DEFAULT 0,
    invoice_due_date DATE CHECK (invoice_due_date = TO_DATE('30th August 2020', 'DDth Month YYYY')),
    payment_date DATE
);

\echo ************* INSERT: sample data into Vendor table
INSERT INTO Vendor (vendor_id, vendor_name, vendor_gender, vendor_city, vendor_state, vendor_phone)
VALUES
    (32, 'Kun-Hyundai', 'F', 'Chennai', 'TN', '9330012323'),
    (33, 'Toyota Camry', 'M', 'Bangalore', 'KA', '9330112345'),
    (34, 'Chevrolet Silverado', 'M', 'Hyderabad', 'AP', '9330212345'),
    (35, 'Honda Civic', 'F', 'Mumbai', 'KA', '9330312345'),
    (36, 'Nissan Altima', 'M', 'Kolkata', 'KE', '9330412345'),
    (37, 'Nissan', 'M', 'Chennai', 'TN', '1234567890'),
    (38, 'Ford Mustang', 'F', 'Chennai', 'TN', '9876543210');


\echo ************* INSERT: sample data into Invoice table
INSERT INTO Invoice (invoice_id, vendor_id, invoice_number, invoice_date, invoice_total, payment_total, invoice_due_date)
VALUES
    (1, 34, 'ABA-100', '2020-08-30', 14000, 15000, '2020-08-30'),
    (2, 35, 'XYZ-200', '2020-08-30', 12000, 13000, '2020-08-30'),
    (3, 36, 'PQR-300', '2020-08-30', 16000, 17000, '2020-08-30'),
    (4, 37, 'LMN-400', '2020-08-30', 20000, 21000, '2020-08-30'),
    (5, 38, 'JKL-500', '2020-08-30', 18000, 19000, '2020-08-30');




\echo ************* QUERY 1: Get the details of female vendors.
SELECT * FROM Vendor WHERE vendor_gender = 'F';

\echo ************* QUERY 2: Get the details of vendors whose names contain the substring "AN".
SELECT * FROM Vendor WHERE LOWER(vendor_name) LIKE '%an%';

\echo ************* QUERY 3: Get the name, city, and state of each vendor who is located in the same city and state.
SELECT DISTINCT
    v1.vendor_name,
    v1.vendor_city,
    v1.vendor_state 
FROM
    Vendor v1
INNER JOIN
    Vendor v2
ON
    v1.vendor_id <> v2.vendor_id
    AND v1.vendor_state = v2.vendor_state
    AND v1.vendor_city = v2.vendor_city;



\echo ************* QUERY 4: Get the details of vendors who are not located in Tamil Nadu.
SELECT * FROM Vendor WHERE vendor_state <> 'TN';

\echo ************* QUERY 5: Retrieve the details of invoices for a range of invoice dates.
SELECT * FROM Invoice
WHERE invoice_date BETWEEN TO_DATE('1st January 2019', 'DDth Month YYYY') AND TO_DATE('1st October 2020', 'DDth Month YYYY');

\echo ************* Procedure: to check if a string is palindrome or not (Query 3).
CREATE OR REPLACE FUNCTION CheckPalindrome(p_str VARCHAR) RETURNS BOOLEAN AS $$
DECLARE
    len INT;
    i INT;
BEGIN
    len := LENGTH(p_str);
    FOR i IN 1..len/2 LOOP
        IF SUBSTRING(p_str FROM i FOR 1) <> SUBSTRING(p_str FROM len - i + 1 FOR 1) THEN
            RETURN FALSE;
        END IF;
    END LOOP;
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;


\echo ************* USAGE of PL/SQL procedure to check for a palindrome
SELECT CheckPalindrome('radar');
SELECT CheckPalindrome('hello');

\echo ************* Procedure: to find invoices with payment total greater than the average payment total (Query 4).
CREATE OR REPLACE FUNCTION FindInvoicesWithGreaterPayment() RETURNS TABLE (
    invoice_id INT,
    invoice_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT i.invoice_id, i.invoice_total::NUMERIC
    FROM Invoice i
    WHERE i.payment_total > (
        SELECT AVG(payment_total)
        FROM Invoice
        WHERE payment_total > 0
    );
END;
$$ LANGUAGE plpgsql;

\echo ************* USAGE of FindInvoicesWithGreaterPayment() procedure
SELECT * FROM FindInvoicesWithGreaterPayment();


