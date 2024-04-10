SELECT 
    txn.account_id,
    cust.customer_name, 
    CASE 
        WHEN LEN(cust.customer_taxx_id) = 13 THEN dbo.formatCPF(cust.customer_taxx_id) 
        ELSE dbo.formatCNPJ(cust.customer_taxx_id) 
    END AS taxxid, 
    REPLACE(CONVERT(DECIMAL, SUM(txn.transaction_amount))/100, '.', ',') AS totalAmount,
    REPLACE(CONVERT(DECIMAL,SUM(txn.transaction_fee))/100, '.', ',') AS fee,
    COUNT(txn.account_id) AS transactionCount,
    prod.product_name,
    cust.invite_code, 
    MONTH(txn.transaction_date) AS transaction_month,
    YEAR(txn.transaction_date) AS transaction_year
FROM 
    TransactionRecords txn
JOIN 
    CustomerData cust ON cust.CustomerID = txn.CustomerID
JOIN 
    ProductData prod ON prod.ProductID = txn.ProductID
WHERE 
    txn.transaction_date BETWEEN '2023-02-01' AND '2023-03-15' 
    AND txn.category_id <> 35
    AND (cust.invite_code IN ('CALVO', 'SLPEP', 'Pain', 'Cnb', 'Cute2')) 
GROUP BY
    cust.customer_name, 
    txn.account_id,
    CASE WHEN LEN(cust.customer_taxx_id) = 13 THEN dbo.formatCPF(cust.customer_taxx_id) 
         ELSE dbo.formatCNPJ(cust.customer_taxx_id) END, 
    prod.product_name,
    cust.invite_code, 
    MONTH(txn.transaction_date),
    YEAR(txn.transaction_date)
ORDER BY 
    YEAR(txn.transaction_date), MONTH(txn.transaction_date)
