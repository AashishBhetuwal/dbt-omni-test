-- Build a simple enriched fact by joining ORDERS to CUSTOMERS
with orders as (
  select
    ORDER_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    ORDER_DATE,
    ORDER_PRIORITY,
    ROW_ID,
    DISCOUNT,
    PROFIT,
    QUANTITY,
    SALES
  from {{ source('superstore', 'ORDERS') }}
),
customers as (
  select
    ID as CUSTOMER_ID,
    CUSTOMER,
    CITY,
    MARKET,
    COUNTRY,
    REGION,
    SEGMENT,
    STATE
  from {{ source('superstore', 'CUSTOMERS') }}
)
select
  o.ORDER_ID,
  o.ORDER_DATE,
  o.ORDER_PRIORITY,
  o.ROW_ID,
  o.DISCOUNT,
  o.PROFIT,
  o.QUANTITY,
  o.SALES,
  o.PRODUCT_ID,
  c.CUSTOMER_ID,
  c.CUSTOMER,       -- PII (flagged in schema.yml)
  c.CITY,
  c.MARKET,
  c.COUNTRY,
  c.REGION,
  c.SEGMENT,
  c.STATE
from orders o
left join customers c
  on o.CUSTOMER_ID = c.CUSTOMER_ID
