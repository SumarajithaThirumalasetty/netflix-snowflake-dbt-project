{{ config(materialized='ephemeral') }}

SELECT *
FROM {{ ref('dim_movies_with_tags') }}
{{ config(enabled=false) }}