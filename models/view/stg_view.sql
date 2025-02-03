-- {{ config(materialized='view') }} By default the materialization of this model is view

-- Active products (non-expired)
WITH stg_view AS (
    SELECT
    product_id,
    product_name,
    price,
    category
    FROM dbt_tbetar.Products
    WHERE price > 50
)

SELECT * FROM stg_view