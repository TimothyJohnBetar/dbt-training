{{ config(
  materialized='incremental',
  unique_key='order_id',
  incremental_strategy='merge'
) }}

-- Daily orders (BigQuery merge)
SELECT
  order_id,
  customer_id,
  order_date,
  total_price
FROM dbt_tbetar.Orders
{% if is_incremental() %}
WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}