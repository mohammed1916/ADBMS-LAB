# Database Schema

Consider the following relational schema for the Accounts Payable Process Application:

#### Vendor (vendor_id(pk), vendor_name, vendor_gender, vendor_city, vendor_state, vendor_phone);

#### Invoice (invoice_id(pk), vendor_id(fk), invoice_number, invoice_date, invoice_total, payment_total (default as 0), credit_total (default as 0), invoice_due_date, payment_date);

Detailed Schema:


Sample record set for invoice table

| **invoice_id** | **vendor_id** | **invoice_number** | **invoice_date**   | **invoice_total** | **payment_total (default as 0)** | **credit_total (default as 0)** | **invoice_due_date** | **payment_date** |
| -------------- | ------------- | ------------------ | ------------------ | ----------------- | -------------------------------- | ------------------------------- | -------------------- | ---------------- |
| 1              | 34            | 'ABA-100'          | '30th August 2020' | 14000             | 0                                | 0                               | '30th August 2020'   | Null             |

Sample record set for Vendor table

| **vendor_id** | **vendor_name** | **vendor_gender** | **vendor_city** | **vendor_state** | **vendor_phone** |
| ------------- | --------------- | ----------------- | --------------- | ---------------- | ---------------- |
| 32            | Kun-Hyundai     | 'F' | Chennai           | TN              | 9330012323            |

1. Use Create statement to create the above relations.

   a. You need to define the primary key and foreign key (if any) in your statement. **(10)**

   b. Implement a check constraint for
   - *Vendor_Gender*
   - *Invoice_date* and *invoice_due_date* should be inserted as "30th August 2020"
   - Implement a check constraint for *vendor_state* Value Set ('TN', 'KA', 'KE', 'AP');
   - Implement a check constraint for *vendor_phone* Value as 10 digits.

   c. Use Insert command to populate each relation with a minimum of 5 tuples.

2. Answer the following queries **(10)**

   a. Get the details of female vendor.

   b. Get the details of vendor whose name has a substring of "AN".

   c. Get the name, city, and state of each vendor who is located in the same city and state.

   d. Get the details of the vendor who is not belonging to Tamilnadu.

   e. Retrieve the details of invoices that search for a range of invoice dates between 1st January 2019 and 1st October 2020.

3. Write a PL/SQL procedure/function to check whether the given string is palindrome or not? **(2)**

4. Write a PL/SQL procedure/function to find which invoices have a payment total greater than the average payment total for all paid invoices? Return the invoice number and invoice total for each invoice. **(3)**
