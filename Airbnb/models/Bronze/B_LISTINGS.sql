{{config(materialized='incremental',
         unique_keys='LISTING_ID')}}
SELECT * FROM {{source('my_bronze','LISTINGS')}}
{% if is_incremental() %}
WHERE START_DATE > (SELECT COALESCE(MAX(START_DATE), '1900-01-01')FROM {{ this }})
{% endif %}