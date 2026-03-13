# Digital-Payment-Analytics-SQL
Fintech data analytics project analyzing UPI transactions using PostgreSQL. Demonstrates SQL analytics, window functions, transaction trends, and payment insights.
# UPI Payment Analytics using PostgreSQL

## Project Overview

This project analyzes **UPI (Unified Payments Interface) transaction data** using **PostgreSQL**.
The goal is to extract meaningful insights from digital payment transactions using **SQL analytics techniques**.

This project demonstrates how SQL can be used to analyze fintech data such as transaction trends, user behavior, and payment success rates.

---

## Dataset

The dataset contains **1000 simulated UPI transactions** with the following fields:

* Transaction ID
* Timestamp
* Sender Name
* Sender UPI ID
* Receiver Name
* Receiver UPI ID
* Amount (INR)
* Transaction Status

---

## Database Schema

Table: `upi_transactions`

| Column          | Description                           |
| --------------- | ------------------------------------- |
| transaction_id  | Unique transaction identifier         |
| timestamp       | Transaction time                      |
| sender_name     | Name of sender                        |
| sender_upi_id   | Sender UPI ID                         |
| receiver_name   | Name of receiver                      |
| receiver_upi_id | Receiver UPI ID                       |
| amount          | Transaction amount                    |
| status          | Transaction status (SUCCESS / FAILED) |

---

## Technologies Used

* PostgreSQL
* SQL
* Data Analytics Queries
* Window Functions
* Aggregation Functions

---

## SQL Analysis Performed

The project includes several SQL analyses such as:

* Total transaction count
* Total transaction amount
* Top senders by transaction volume
* Top receivers by total amount received
* Daily transaction trends
* Transaction success vs failure rate
* High value transaction detection

---

## Advanced SQL Techniques Used

* Window Functions (`RANK()`)
* Aggregations (`SUM()`, `AVG()`, `COUNT()`)
* Subqueries
* Time-based analysis
* Grouping and filtering

---

## Example SQL Query

Top senders by transaction amount:

```sql
SELECT sender_name,
       SUM(amount) AS total_sent
FROM upi_transactions
WHERE status='SUCCESS'
GROUP BY sender_name
ORDER BY total_sent DESC
LIMIT 10;
```

---

## Key Insights

* Identified most active senders and receivers
* Analyzed daily transaction patterns
* Calculated transaction success rates
* Detected high-value transactions
* Observed transaction peak hours

---

## Applications

This type of analysis is useful for:

* Fintech analytics
* Digital payment monitoring
* Fraud detection
* Customer transaction behavior analysis

---

## Future Improvements

* Build an interactive **Power BI dashboard**
* Add **fraud detection models**
* Perform **real-time transaction analytics**

---

## Author

Personal Data Analytics Project demonstrating **SQL and PostgreSQL skills for fintech transaction analysis.**
