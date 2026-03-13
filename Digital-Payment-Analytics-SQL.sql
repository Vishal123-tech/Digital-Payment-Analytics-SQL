Drop table if exists upi_transactions ;

CREATE TABLE upi_transactions (
    transaction_id UUID PRIMARY KEY,
    timestamp TIMESTAMP,
    sender_name VARCHAR(100),
    sender_upi_id VARCHAR(100),
    receiver_name VARCHAR(100),
    receiver_upi_id VARCHAR(100),
    amount DECIMAL(10,2),
    status VARCHAR(20)
);
select * from upi_transactions;

COPY upi_transactions
FROM 'C:\Users\Aam admi\Downloads\transactions.csv'
DELIMITER ','
CSV HEADER;

-- Q3. Find the total number of transactions in the dataset.   
SELECT COUNT(*) AS total_transactions
FROM upi_transactions;

-- Q4. Calculate the total transaction amount for successful transactions.
SELECT SUM(amount) AS total_amount
FROM upi_transactions
WHERE status = 'SUCCESS';

--Q5. Find the average transaction amount.
SELECT AVG(amount) AS average_transaction
FROM upi_transactions
WHERE status = 'SUCCESS';

--Q6. Identify the top 10 senders based on the number of transactions.
SELECT sender_name, COUNT(*) AS total_transactions
FROM upi_transactions
GROUP BY sender_name
ORDER BY total_transactions DESC
LIMIT 10;

--Find the top 10 receivers based on total amount received.
Select receiver_name, sum(amount) AS total_received
FROM upi_transactions
WHERE status ='succes'
GROUP BY receiver_name
ORDER BY total_received DESC
LIMIT 5;

--Calculated the daily transaction volume and total amount.
SELECT DATE(timestamp) AS transaction_date,
       COUNT(*) AS total_transactions,
	   sum(amount) As total_amount
FROM upi_transactions
WHERE status ='SUCCESS'
GROUP BY transaction_date 
ORDER BY transaction_date;

--Find the number of failed transactions.
SELECT COUNT(*) AS failed_transactions
from upi_transactions
where status = 'FAILED';

--Identify the high value tractions greater than 5000
select * from upi_transactions
WHERE amount > 5000
Order by amount desc
limit 5;

--identify the busiest transaction hours in day
SELECT EXTRACT(HOUR FROM timestamp) AS hour,
       COUNT(*) AS transaction_count
FROM upi_transactions
GROUP BY hour
ORDER BY transaction_count DESC
LIMIT 1;

--Find the running total of transactions over time.
SELECT DATE(timestamp) AS transaction_date,
       SUM(amount) AS daily_amount,
       SUM(SUM(amount)) OVER (ORDER BY DATE(timestamp)) AS running_total
FROM upi_transactions
WHERE status='SUCCESS'
GROUP BY transaction_date
ORDER BY transaction_date;

