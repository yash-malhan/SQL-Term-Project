#1.
select PAYMENT_METHOD, count(*) as Number_of_Payments 
from tppayments
group by PAYMENT_METHOD
order by Number_of_Payments desc;

#2
select city, CHANNEL_NAME ,count(invoice_id) as sales
from tpInvoice i, tpsales_channel sc
where i.S_CHANNEL_ID=sc.S_CHANNEL_ID
AND city = 'NEW YORK'
AND CHANNEL_NAME='BestBuy'
group by city, channel_name;


#3
select employee_name as sales_rep, sum(quantity*product_price) as sales
from tpemployee e, tpinvoice i, tpproduct p
where e.EMPLOYEE_ID=i.SALES_REP_ID and i.PRODUCT_ID=p.PRODUCT_ID
group by SALES_REP
order by SALES desc;

#4
SELECT SUPPLIER_NAME , COUNT(PRODUCT_NAME) AS NUMBER_OF_PRODUCTS 
FROM TPSUPPLIER S, TPPRODUCT P
WHERE S.SUPPLIER_ID = P.SUPPLIER_ID
GROUP BY SUPPLIER_NAME
ORDER BY NUMBER_OF_PRODUCTS DESC
LIMIT 1;


#5
SELECT PRODUCT_NAME, SUM(QUANTITY) AS UNIT_SALES
FROM TPPRODUCT P, TPINVOICE I
WHERE P.PRODUCT_ID=I.PRODUCT_ID
GROUP BY PRODUCT_NAME
ORDER BY UNIT_SALES DESC;


#6
select month(inv_date) as month_of_2020, sum(quantity*product_price) as monthly_revenue, sum(quantity) as monthly_sales_unit
from tpinvoice ti, tpproduct tp
where ti.PRODUCT_ID=tp.PRODUCT_ID
group by month_of_2020
order by monthly_revenue desc;

#7

SELECT REGION, SUM(QUANTITY* PRODUCT_PRICE) AS SALES
FROM TPPRODUCT P, TPINVOICE I
WHERE P.PRODUCT_ID = I.PRODUCT_ID
GROUP BY REGION
ORDER BY SALES DESC;

#8
SELECT COUNT(*) AS NUMCUS_ABOVE_AVERAGE
FROM 
(SELECT CUSTOMER_NAME, SUM(QUANTITY*PRODUCT_PRICE) AS REVENUE
FROM TPINVOICE I, TPCUSTOMER C, TPPRODUCT P
WHERE I.CUSTOMER_ID=C.CUSTOMER_ID 
AND I.PRODUCT_ID=P.PRODUCT_ID
AND REGION="WEST"
GROUP BY CUSTOMER_NAME
HAVING REVENUE > AVG(QUANTITY*PRODUCT_PRICE)
ORDER BY REVENUE DESC) AS PURCHASE;


#9
select channel_name as channels, sum(quantity) as unit_sales
from tpinvoice ti,tpproduct tp, tpsales_channel ts
where ti.PRODUCT_ID=tp.PRODUCT_ID and ti.S_CHANNEL_ID=ts.S_CHANNEL_ID
group by channels
order by unit_sales asc;

#10
SELECT PRODUCT_TYPE, AVG(PRODUCT_PRICE) AS AVERAGE_PRICE, COUNT(P.PRODUCT_ID) AS QUANITY_SOLD
FROM TPPRODUCT P, TPPRODUCT_TYPE PT, TPINVOICE IV
WHERE P.P_TYPE_ID = PT.P_TYPE_ID
AND IV.PRODUCT_ID = P.PRODUCT_ID
GROUP BY PRODUCT_TYPE
ORDER BY QUANITY_SOLD DESC;


#11
SELECT State, SUM(Quantity*Product_Price) AS Total_Sales
FROM TPInvoice IV, TPProduct PD
WHERE IV.Product_ID = PD.Product_ID
Group by State
ORDER BY Total_Sales DESC
LIMIT 5;


#12
select customer_name as customer, state, sum(quantity*product_price) as purchase
from tpinvoice ti, tpcustomer tc, tpproduct tp
where ti.CUSTOMER_ID=tc.CUSTOMER_ID
and ti.PRODUCT_ID=tp.PRODUCT_ID
and state='California'
group by customer
order by purchase desc
limit 5;
#13
SELECT EMPLOYEE_ID, EMPLOYEE_NAME, EMPLOYEE_ROLE
FROM tpemployee
WHERE EMPLOYEE_NAME LIKE 'C%'
ORDER BY EMPLOYEE_NAME ASC;

#14
SELECT COUNT(INVOICE_ID)/count(*) AS SALES_WINTER
FROM tpINVOICE
WHERE INV_DATE BETWEEN '2020-10-1' AND '2021-2-1';

#15
SELECT AVG(Payment_Amount) AS Average_Payment, MIN(Payment_Amount) AS Minimum_Payment, MAX(Payment_Amount) AS Maximum_Payment, 
STD(Payment_Amount) AS Payment_Standard_Deviation
FROM TPPayments;

