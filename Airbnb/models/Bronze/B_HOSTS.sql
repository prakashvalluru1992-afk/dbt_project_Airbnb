{{config(materialized='table')}}
SELECT * FROM {{source('my_bronze','HOSTS')}}